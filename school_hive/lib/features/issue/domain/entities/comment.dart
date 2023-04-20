import 'package:equatable/equatable.dart';

import '../../data/models/issue_model.dart';

class Comment extends Equatable {
  final String id;
  final String description;
  final int upVote;
  final int downVote;
  final DateTime time;
  final List<Archive> archives;

  Comment({
    required this.id,
    required this.description,
    required this.upVote,
    required this.downVote,
    required this.archives,
    required this.time,
  });
  @override
  List<Object?> get props => [
        id,
        description,
        upVote,
        downVote,
        archives,
        time,
      ];
}
