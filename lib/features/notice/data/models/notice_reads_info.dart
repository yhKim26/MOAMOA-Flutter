import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/notice_reads.dart';
import 'notice_read_member_model.dart';

part 'notice_reads_info.freezed.dart';
part 'notice_reads_info.g.dart';

/// 공지 읽음 현황 응답 모델 (3-7)
@freezed
abstract class NoticeReadsInfo with _$NoticeReadsInfo {
  const factory NoticeReadsInfo({
    required int readCount,
    required int totalCount,
    required List<NoticeReadMemberModel> readMembers,
    required List<NoticeReadMemberModel> unreadMembers,
  }) = _NoticeReadsInfo;

  factory NoticeReadsInfo.fromJson(Map<String, dynamic> json) =>
      _$NoticeReadsInfoFromJson(json);
}

/// 응답 모델을 도메인 Entity 로 바꿉니다.
extension NoticeReadsInfoX on NoticeReadsInfo {
  NoticeReads toEntity() => NoticeReads(
    readCount: readCount,
    totalCount: totalCount,
    readMembers: readMembers.map((model) => model.toEntity()).toList(),
    unreadMembers: unreadMembers.map((model) => model.toEntity()).toList(),
  );
}
