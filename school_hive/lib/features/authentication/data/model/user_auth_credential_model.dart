import '../../domain/entities/user_auth_credential.dart';

class UserAuthCredentialModel extends UserAuthCredential {
  const UserAuthCredentialModel({
    required super.accessToken,
    required super.email,
    required super.userId,
  });

  factory UserAuthCredentialModel.fromJson(Map<String, dynamic> json) {
    return UserAuthCredentialModel(
      accessToken: json['token'],
      email: json['email'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "token": accessToken,
      "userId": userId,
    };
  }
}
