import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moamoa/features/notice/domain/entities/notice_detail_request.dart';
import 'package:moamoa/features/notice/domain/entities/notice_read_member.dart';
import 'package:moamoa/features/notice/domain/entities/notice_reads.dart';
import 'package:moamoa/features/notice/presentation/providers/notice_providers.dart';

import '../../fakes/fake_notice_repository.dart';

void main() {
  const request = NoticeDetailRequest(meetingId: 1, noticeId: 3);
  const reads = NoticeReads(
    readCount: 1,
    totalCount: 2,
    readMembers: [NoticeReadMember(memberId: 3, userName: '김모아')],
    unreadMembers: [NoticeReadMember(memberId: 5, userName: '이모아')],
  );

  group('noticeReadsProvider', () {
    late FakeNoticeRepository repository;
    late ProviderContainer container;

    setUp(() {
      repository = FakeNoticeRepository(notices: [buildNotice(3)])
        ..readsByNoticeId[3] = reads;
      container = ProviderContainer.test(
        overrides: [noticeRepositoryProvider.overrideWithValue(repository)],
        retry: (_, _) => null,
      );
    });

    test('해당 공지의 읽음 현황을 불러온다', () async {
      final result = await container.read(noticeReadsProvider(request).future);

      expect(result, reads);
    });

    test('내 읽음 처리를 요청한 뒤에 읽음 현황을 불러온다', () async {
      await container.read(noticeReadsProvider(request).future);

      expect(repository.readNoticeIdsAtReadsRequest, [
        [3],
      ]);
    });

    test('내 읽음 처리가 실패해도 읽음 현황을 불러온다', () async {
      repository.readError = Exception('시간 초과');

      final result = await container.read(noticeReadsProvider(request).future);

      expect(result, reads);
    });

    test('읽음 현황을 불러오지 못하면 오류 상태가 된다', () async {
      repository.readsError = Exception('시간 초과');
      container.listen(noticeReadsProvider(request), (_, _) {});

      await expectLater(
        container.read(noticeReadsProvider(request).future),
        throwsA(isA<Exception>()),
      );

      expect(container.read(noticeReadsProvider(request)).hasError, isTrue);
    });
  });
}
