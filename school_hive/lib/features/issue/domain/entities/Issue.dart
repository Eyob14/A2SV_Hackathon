import 'package:equatable/equatable.dart';
import 'package:school_hive/features/issue/data/models/issue_model.dart';
import '../../../profile/domain/entities/profile.dart';

class Issue extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<Archive> archives;
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
