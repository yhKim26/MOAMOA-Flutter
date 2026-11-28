import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt.freezed.dart';

/// 로그인·회원가입·토큰 재발급 응답으로 받은 토큰 (API 7-1·7-2·7-3)
@freezed
abstract class Jwt with _$Jwt {
  const factory Jwt({
    required String accessToken,
    required String refreshToken,
  }) = _Jwt;

  const Jwt._();

  /// 로그나 예외 메시지에 실려도 토큰이 드러나지 않도록 값을 출력하지 않습니다.
  @override
  String toString() => 'Jwt(accessToken: ***, refreshToken: ***)';
}
