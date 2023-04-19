import 'package:equatable/equatable.dart';

import '../../../profile/domain/entities/Profile.dart';

class Issue extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<String> archives;
  final List<String> tags;
  final bool isFavorite;
  final Profile profile;

  const Issue({
    required this.id,
    required this.title,
    required this.description,
    required this.archives,
    required this.tags,
    required this.isFavorite,
    required this.profile,
  });

  @override
  List<Object?> get props =>
      [id, title, isFavorite, description, archives, tags, profile];
}
