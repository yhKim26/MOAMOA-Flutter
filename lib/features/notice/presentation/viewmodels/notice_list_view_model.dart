import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/get_notices.dart';
import '../providers/notice_providers.dart';
import 'notice_list_state.dart';

/// 공지 목록 ViewModel (family 인자: meetingId)
class NoticeListViewModel extends AsyncNotifier<NoticeListState> {
  NoticeListViewModel({required int meetingId}) : _meetingId = meetingId;

  final int _meetingId;

  /// 첫 페이지를 새로 불러올 때마다 1씩 늘어나는 번호입니다.
  /// 다음 페이지 응답이 늦게 도착했을 때, 그사이 새로고침이 있었는지 확인하는 데 씁니다.
  int _generation = 0;

  /// 첫 페이지를 불러오는 요청이 진행 중인 개수입니다. (처음 로딩, 새로고침, Provider 무효화 포함)
  /// 0보다 크면 목록이 곧 새 내용으로 바뀌므로 다음 페이지 요청을 보내지 않습니다.
  int _firstPageRequests = 0;

  @override
  Future<NoticeListState> build() => _fetchFirstPage();

  /// 당겨서 새로고침. 새로 불러오는 동안 기존 목록을 그대로 보여줍니다.
  Future<void> refresh() async {
    final result = await AsyncValue.guard(_fetchFirstPage);
    if (!ref.mounted) return;
    state = result;
  }

  /// 목록에서 [noticeId] 공지의 "읽음 N/M" 만 바꿉니다. 목록에 없으면 그대로 둡니다.
  ///
  /// 공지 상세에서 읽음 현황(3-7)을 받으면 호출합니다.
  /// 목록이 정상 상태일 때만 바꿉니다. 새로 불러오는 중이거나 오류 상태일 때는, 이전 목록이
  /// 남아 있어도 그 값으로 성공 상태를 만들지 않습니다.
  void updateReadCount({
    required int noticeId,
    required int readCount,
    required int totalCount,
  }) {
    final current = _loadedState();
    if (current == null) return;
    state = AsyncData(
      current.copyWith(
        notices: [
          for (final notice in current.notices)
            notice.id == noticeId
                ? notice.copyWith(readCount: readCount, totalCount: totalCount)
                : notice,
        ],
      ),
    );
  }

  /// 다음 페이지를 불러와 목록 뒤에 붙입니다.
  ///
  /// 새로고침 중에는 요청하지 않고, 요청 중에 새로고침이 일어나면 늦게 도착한 응답은 버립니다.
  /// 실패하면 목록은 그대로 두고 NoticeException 을 던집니다.
  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.hasNext || current.isLoadingMore) return;
    // 새로고침 중에 시작한 요청은 새로고침 전의 목록(current)에 이어 붙이게 되어
    // 새 목록을 덮어쓰므로, 첫 페이지 요청이 끝날 때까지 기다립니다.
    if (_firstPageRequests > 0) return;

    final generation = _generation;
    bool isStale() => !ref.mounted || generation != _generation;

    state = AsyncData(current.copyWith(isLoadingMore: true));
    try {
      final result = await ref.read(getNoticesProvider)(
        GetNoticesParams(meetingId: _meetingId, page: current.page + 1),
      );
      if (isStale()) return;
      // 요청 전의 목록(current) 이 아니라 응답이 도착한 시점의 목록에 이어 붙입니다.
      // 그사이 updateReadCount 로 바뀐 읽음 수가 되돌아가지 않게 하기 위해서입니다.
      final latest = _loadedState();
      if (latest == null) return;
      state = AsyncData(
        latest.copyWith(
          notices: [...latest.notices, ...result.notices],
          page: result.page,
          hasNext: result.hasNext,
          isLoadingMore: false,
        ),
      );
    } catch (_) {
      if (isStale()) return;
      final latest = _loadedState();
      if (latest != null) {
        state = AsyncData(latest.copyWith(isLoadingMore: false));
      }
      rethrow;
    }
  }

  /// 목록이 정상 상태일 때의 값입니다. 오류 상태이거나 새로 불러오는 중이면 null 입니다.
  ///
  /// 새로 불러오는 중에도 이전 값이 남아 있고 [AsyncData] 로 보이므로 [AsyncValue.isLoading] 도 봅니다.
  NoticeListState? _loadedState() {
    final current = state;
    if (current is! AsyncData<NoticeListState> || current.isLoading) {
      return null;
    }
    return current.value;
  }

  Future<NoticeListState> _fetchFirstPage() async {
    _generation++;
    _firstPageRequests++;
    try {
      final result = await ref.read(getNoticesProvider)(
        GetNoticesParams(meetingId: _meetingId),
      );
      return NoticeListState(
        notices: result.notices,
        page: result.page,
        hasNext: result.hasNext,
      );
    } finally {
      _firstPageRequests--;
    }
  }
}
