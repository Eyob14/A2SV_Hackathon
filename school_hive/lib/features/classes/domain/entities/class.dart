import 'package:equatable/equatable.dart';

class Class extends Equatable {
  final String id;
  final String name;
  final String ownerId;
  final String chatLink;

  Class({
    required this.id,
    required this.name,
    required this.ownerId,
    required this.chatLink,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        ownerId,
        chatLink,
      ];
}
