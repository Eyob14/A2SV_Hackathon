import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final String id;
  final String description;
  final int upVotes;
  final int downVotes;
  final DateTime time;

  Comment({
    required this.id,
    required this.description,
    required this.upVotes,
    required this.downVotes,
    required this.time,
  });
  @override
  List<Object?> get props => [
        id,
        description,
        upVotes,
        downVotes,
        time,
      ];
}
