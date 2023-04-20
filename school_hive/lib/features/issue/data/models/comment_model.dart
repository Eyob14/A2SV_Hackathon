import '../../domain/entities/comment.dart';
import 'issue_model.dart';

class CommentModel extends Comment {
  CommentModel({
    required super.id,
    required super.description,
    required super.upVote,
    required super.downVote,
    required super.time,
    required super.archives,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json["_id"],
      description: json["description"],
      upVote: json["upVotes"],
      downVote: json["downVotes"],
      time: DateTime.parse(json["createdAt"]),
      archives: List<Archive>.from(json["archives"].map((x) => Archive.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'upVote': upVote,
      'downVote': downVote,
      'archives': archives,
      'time': time,
    };
  }
}
