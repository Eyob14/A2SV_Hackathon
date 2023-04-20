import '../../domain/entities/Profile.dart';

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
    // final tags = json["favoriteTags"];
    // List<String> tagsList = tags.cast<String>();
    // print(tagsList);
    return ProfileModel(
      id: json["_id"],
      email: json["email"],
      userName: json["userName"],
      name: json["name"],
      bio: json["bio"],
      avatar: json["avatar"]["fileAddress"],
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
