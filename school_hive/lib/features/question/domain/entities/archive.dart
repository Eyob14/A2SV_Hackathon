import 'package:equatable/equatable.dart';

class Archive extends Equatable {
  const Archive({
    required this.id,
    required this.name,
    required this.fileAddress,
    required this.cloudinaryId,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final String fileAddress;
  final String cloudinaryId;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        name,
        fileAddress,
        cloudinaryId,
        createdAt,
        updatedAt,
      ];
}
