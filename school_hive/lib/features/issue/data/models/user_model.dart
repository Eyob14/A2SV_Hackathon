import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.email,
    required super.userName,
    required super.bio,
    required this.department,
    required this.year,
    required this.resetToken,
    required super.name,
    required super.country,
    required super.avatar,
    required super.favoriteTags,
    required super.createdAt,
    required super.updatedAt,
  });

  final String department;
  final String year;
  final String resetToken;

  UserModel copyWith({
    String? department,
    String? year,
    String? id,
    String? email,
    String? userName,
    String? name,
    String? bio,
    String? country,
    String? avatar,
    List<dynamic>? favoriteTags,
    String? resetToken,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserModel(
        department: department ?? this.department,
        year: year ?? this.year,
        id: id ?? this.id,
        email: email ?? this.email,
        userName: userName ?? this.userName,
        name: name ?? this.name,
        bio: bio ?? this.bio,
        country: country ?? this.country,
        avatar: avatar ?? this.avatar,
        favoriteTags: favoriteTags ?? this.favoriteTags,
        resetToken: resetToken ?? this.resetToken,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        department: json["department"],
        year: json["year"],
        id: json["_id"],
        email: json["email"],
        userName: json["userName"],
        name: json["name"],
        bio: json["bio"],
        country: json["country"],
        avatar: json["avatar"],
        favoriteTags: List<dynamic>.from(json["favoriteTags"].map((x) => x)),
        resetToken: json["resetToken"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "department": department,
        "year": year,
        "_id": id,
        "email": email,
        "userName": userName,
        "name": name,
        "bio": bio,
        "country": country,
        "avatar": avatar,
        "favoriteTags": List<dynamic>.from(favoriteTags.map((x) => x)),
        "resetToken": resetToken,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
