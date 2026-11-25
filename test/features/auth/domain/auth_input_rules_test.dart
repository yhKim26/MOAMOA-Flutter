import 'package:flutter_test/flutter_test.dart';
import 'package:moamoa/features/auth/domain/auth_input_rules.dart';

void main() {
  group('invalidEmailMessage', () {
    test('이메일 형식이면 null 을 돌려준다', () {
      expect('moa@example.com'.invalidEmailMessage, isNull);
    });

    test('앞뒤 공백은 빼고 검사한다', () {
      expect('  moa@example.com '.invalidEmailMessage, isNull);
    });

    test('비어 있으면 이메일을 입력하라고 안내한다', () {
      expect('  '.invalidEmailMessage, '이메일을 입력해주세요.');
    });

    test('@ 나 도메인이 없으면 형식이 다르다고 안내한다', () {
      expect('moa.example.com'.invalidEmailMessage, '올바른 이메일 형식이 아니에요.');
      expect('moa@example'.invalidEmailMessage, '올바른 이메일 형식이 아니에요.');
    });
  });

  group('invalidPasswordMessage', () {
    test('영문과 숫자를 포함한 8자면 null 을 돌려준다', () {
      expect('moamoa12'.invalidPasswordMessage, isNull);
    });

    test('기호를 포함해도 null 을 돌려준다', () {
      expect('moa!@#12'.invalidPasswordMessage, isNull);
    });

    test('72자까지 허용한다', () {
      expect('${'a' * 71}1'.invalidPasswordMessage, isNull);
    });

    test('비어 있으면 비밀번호를 입력하라고 안내한다', () {
      expect(''.invalidPasswordMessage, '비밀번호를 입력해주세요.');
    });

    test('7자 이하이거나 73자 이상이면 길이를 안내한다', () {
      expect('moamo12'.invalidPasswordMessage, '8~72자로 입력해주세요.');
      expect('${'a' * 72}1'.invalidPasswordMessage, '8~72자로 입력해주세요.');
    });

    test('숫자나 영문이 빠지면 둘 다 포함하라고 안내한다', () {
      expect('moamoamoa'.invalidPasswordMessage, '영문과 숫자를 모두 포함해주세요.');
      expect('12345678'.invalidPasswordMessage, '영문과 숫자를 모두 포함해주세요.');
    });

    test('공백이나 한글이 있으면 쓸 수 있는 글자를 안내한다', () {
      expect('moa moa12'.invalidPasswordMessage, '영문, 숫자, 기호만 사용할 수 있어요.');
      expect('모아moa1234'.invalidPasswordMessage, '영문, 숫자, 기호만 사용할 수 있어요.');
    });
  });
}
