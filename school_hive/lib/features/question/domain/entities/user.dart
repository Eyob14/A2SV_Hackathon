import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.email,
    required this.userName,
    required this.name,
    required this.bio,
    required this.country,
    required this.avatar,
    required this.favoriteTags,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String email;
  final String userName;
  final String name;
  final String bio;
  final String country;
  final String avatar;
  final List<dynamic> favoriteTags;
  final DateTime createdAt;
  final DateTime updatedAt;

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
        createdAt,
        updatedAt,
      ];
}
