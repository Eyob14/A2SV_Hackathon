import '../../../profile/data/models/profile_model.dart';
import '../../../profile/domain/entities/profile.dart';
import '../../domain/entities/Issue.dart';

class IssueModel extends Issue {
  const IssueModel(
      {required super.id,
      required super.title,
      required super.description,
      required super.archives,
      required super.tags,
      required super.isFavorite,
      required super.profile});

  factory IssueModel.fromJson(Map<String, dynamic> json) {
    Profile profile = ProfileModel.fromJson(json["userId"]);
    List<dynamic> tags = json["tags"];
    final archives = json["archives"];
    List<String> tagsList = tags.cast<String>();

    return IssueModel(
      id: json["_id"],
      description: json["description"],
      profile: profile,
      isFavorite: json["isFavorite"],
      title: json["title"],
      tags: tagsList,
      archives:
          List<Archive>.from(json["archives"].map((x) => Archive.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'tags': tags,
      'archives': archives,
      'isFavorite': isFavorite,
      'profile': profile,
    };
  }
}

class Archive {
  Archive({
    required this.id,
    required this.name,
    required this.fileAddress,
    required this.cloudinaryId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String fileAddress;
  String cloudinaryId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Archive.fromJson(Map<String, dynamic> json) => Archive(
        id: json["_id"],
        name: json["name"],
        fileAddress: json["fileAddress"],
        cloudinaryId: json["cloudinaryId"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "fileAddress": fileAddress,
        "cloudinaryId": cloudinaryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "__v": v,
      };
}
