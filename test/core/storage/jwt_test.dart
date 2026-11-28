import 'package:flutter_test/flutter_test.dart';
import 'package:moamoa/core/storage/jwt.dart';

void main() {
  group(Jwt, () {
    const tokens = Jwt(
      accessToken: 'secret-access',
      refreshToken: 'secret-refresh',
    );

    test('문자열로 바꿔도 액세스 토큰이 드러나지 않는다', () {
      expect(tokens.toString(), isNot(contains('secret-access')));
    });

    test('문자열로 바꿔도 리프레시 토큰이 드러나지 않는다', () {
      expect(tokens.toString(), isNot(contains('secret-refresh')));
    });

    test('같은 두 토큰이면 같은 값으로 비교된다', () {
      expect(
        tokens,
        const Jwt(accessToken: 'secret-access', refreshToken: 'secret-refresh'),
      );
    });
  });
}
