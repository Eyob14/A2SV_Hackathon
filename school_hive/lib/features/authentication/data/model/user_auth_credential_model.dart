import '../../domain/entities/user_auth_credential.dart';

class UserAuthCredentialModel extends UserAuthCredential {
  const UserAuthCredentialModel(
      {required super.accessToken,
      required super.userRole,
      required super.email});

  factory UserAuthCredentialModel.fromJson(Map<String, dynamic> json) {
    return UserAuthCredentialModel(
      accessToken: json['token'],
      userRole: json['role'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "token": accessToken,
      "role": userRole,
    };
  }
}
