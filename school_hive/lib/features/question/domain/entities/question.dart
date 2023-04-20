import 'package:equatable/equatable.dart';
import 'package:school_hive/features/question/domain/entities/user.dart';

import 'archive.dart';

class Question extends Equatable {
  const Question({
    required this.id,
    required this.userId,
    required this.classId,
    required this.title,
    required this.description,
    required this.archives,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
    required this.isFavorite,
  });

  final String id;
  final User userId;
  final dynamic classId;
  final String title;
  final String description;
  final List<Archive> archives;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isFavorite;

  @override
  List<Object?> get props => [
        id,
        userId,
        classId,
        title,
        description,
        archives,
        tags,
        createdAt,
        updatedAt,
      ];
}
