import 'package:freezed_annotation/freezed_annotation.dart';

part 'read_notice_request.freezed.dart';

/// 공지 읽음 현황(3-7) 요청. 요청 본문은 없고 경로에만 씁니다.
@freezed
abstract class ReadNoticeRequest with _$ReadNoticeRequest {
  const factory ReadNoticeRequest({
    required int meetingId,
    required int noticeId,
  }) = _ReadNoticeRequest;
}
