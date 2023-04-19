import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String email;
  final String userName;
  final String name;
  final String bio;
  final String country;
  final String avatar;
  final List<String> favoriteTags;
  final DateTime createdAt;

  Profile({
    required this.id,
    required this.email,
    required this.userName,
    required this.name,
    required this.bio,
    required this.country,
    required this.avatar,
    required this.favoriteTags,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        userName,
        name,
        bio,
        country,
        avatar,
        favoriteTags,
        createdAt
      ];
}
