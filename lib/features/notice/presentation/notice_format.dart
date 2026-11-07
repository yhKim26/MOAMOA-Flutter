import '../domain/entities/notice.dart';

/// 상세 화면의 작성일. 연도까지 항상 표시합니다. (예: 2026년 9월 12일)
String formatNoticeDate(DateTime date) {
  return '${date.year}년 ${date.month}월 ${date.day}일';
}

/// 목록의 작성 시각. 오래될수록 거칠게 표시합니다.
///
/// "방금 전" → "3분 전" → "3시간 전" → "2일 전" → "1주 전" → "3개월 전" → "1년 전"
/// 한 달은 30일, 한 해는 365일로 계산합니다.
///
/// [now] 는 테스트에서 기준 시각을 고정할 때만 넘깁니다.
String formatNoticeRelative(DateTime createdAt, {DateTime? now}) {
  final diff = (now ?? DateTime.now()).difference(createdAt);
  if (diff.inMinutes < 1) return '방금 전';
  if (diff.inHours < 1) return '${diff.inMinutes}분 전';
  if (diff.inDays < 1) return '${diff.inHours}시간 전';
  if (diff.inDays < 7) return '${diff.inDays}일 전';
  if (diff.inDays < 30) return '${diff.inDays ~/ 7}주 전';
  if (diff.inDays < 365) return '${diff.inDays ~/ 30}개월 전';
  return '${diff.inDays ~/ 365}년 전';
}

/// 목록의 읽음 현황 표시 값 (3-2 readCount / totalCount)
extension NoticeReadCountX on Notice {
  /// "읽음 6/8". 읽은 수를 받지 못했으면 null 입니다.
  String? get readCountLabel {
    final readCount = this.readCount;
    final totalCount = this.totalCount;
    if (readCount == null || totalCount == null) return null;
    return '읽음 $readCount/$totalCount';
  }

  /// 모든 구성원이 읽었는지
  bool get isReadByAll => readCount != null && readCount == totalCount;
}
