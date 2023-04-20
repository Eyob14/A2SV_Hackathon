import '../../domain/entities/archive.dart';
import '../../domain/entities/issue.dart';
import 'archive_model.dart';
import 'class_model.dart';
import 'user_model.dart';

class IssueModel extends Issue {
  const IssueModel({
    required super.id,
    required super.userId,
    required super.classId,
    required super.title,
    required super.description,
    required super.archives,
    required super.tags,
    required super.createdAt,
    required super.updatedAt,
    required super.isFavorite,
  });

  IssueModel copyWith({
    UserModel? userId,
    ClassModel? classId,
    String? title,
    String? description,
    List<ArchiveModel>? archives,
    List<dynamic>? tags,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      IssueModel(
        userId: userId ?? this.userId,
        classId: classId ?? this.classId,
        title: title ?? this.title,
        description: description ?? this.description,
        archives: (archives ?? this.archives) as List<Archive>,
        tags: (tags ?? this.tags) as List<String>,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isFavorite: false,
      );

  factory IssueModel.fromJson(Map<String, dynamic> json) => IssueModel(
        userId: UserModel.fromJson(json["userId"]),
        classId: ClassModel.fromJson(json["classId"]),
        title: json["title"],
        description: json["description"],
        archives: List<Archive>.from(
            json["archives"].map((x) => ArchiveModel.fromJson(x))),
        tags: List<String>.from(json["tags"].map((x) => x)),
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isFavorite: false,
      );

  Map<String, dynamic> toJson() => {
        "userId": (userId as UserModel).toJson(),
        "classId": classId.toJson(),
        "title": title,
        "description": description,
        "archives": List<dynamic>.from(
            archives.map((x) => (x as ArchiveModel).toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
