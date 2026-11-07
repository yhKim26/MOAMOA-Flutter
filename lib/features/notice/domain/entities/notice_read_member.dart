import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_read_member.freezed.dart';

/// 공지 읽음 현황(3-7)의 구성원 한 명
///
/// 나간·탈퇴한 구성원은 현황에 포함되지 않습니다.
@freezed
abstract class NoticeReadMember with _$NoticeReadMember {
  const factory NoticeReadMember({
    required int memberId,

    /// 회원 기능이 생기기 전까지 null 일 수 있습니다.
    String? userName,

    /// 처음 읽은 시각. 읽지 않은 구성원은 null 입니다.
    DateTime? readAt,
  }) = _NoticeReadMember;
}
