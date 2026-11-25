import '../models/password_reset_mail_request.dart';
import '../models/password_reset_request.dart';

abstract interface class AuthRemoteDataSource {
  /// POST /v1/auth/password-reset-requests
  Future<void> requestPasswordResetMail(PasswordResetMailRequest request);

  /// POST /v1/auth/password-resets
  Future<void> resetPassword(PasswordResetRequest request);
}
