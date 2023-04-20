import '../../domain/entities/profile.dart';

class ProfileModel extends Profile {
  ProfileModel({
    required super.id,
    required super.email,
    required super.userName,
    required super.name,
    required super.bio,
    required super.country,
    required super.avatar,
    required super.favoriteTags,
    required super.createdAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    String avatar = "";
    if (json["avatar"] != null) {
      avatar = json["avatar"]["fileAddress"];
    }
    return ProfileModel(
      id: json["_id"],
      email: json["email"],
      userName: json["userName"],
      name: json["name"],
      bio: json["bio"],
      avatar: avatar,
      country: json["country"],
      favoriteTags: List<String>.from(json["favoriteTags"].map((x) => x)),
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'userName': userName,
      'name': name,
      'bio': bio,
      'avatar': avatar,
      "country": country,
      "favoriteTags": favoriteTags,
      "createdAt": createdAt
    };
  }
}
