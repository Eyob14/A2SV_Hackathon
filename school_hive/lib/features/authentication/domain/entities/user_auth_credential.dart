import 'package:equatable/equatable.dart';
// import 'package:mobile/core/constants/app_enums.dart';

class UserAuthCredential extends Equatable {
  final String email;
  final String accessToken;
  final String userRole;

  const UserAuthCredential({
    required this.email,
    required this.accessToken,
    required this.userRole,
  });

  @override
  List<Object?> get props => [email, accessToken, userRole];
}
