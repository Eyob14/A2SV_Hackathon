import '../../domain/entities/class.dart';

class ClassModel extends Class {
  ClassModel(
      {required super.id,
      required super.name,
      required super.ownerId,
      required super.chatLink});

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      id: json["classId"]["_id"],
      name: json["classId"]["name"],
      ownerId: json["classId"]["owner"],
      chatLink: json["classId"]["chatLink"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'owner': ownerId,
      'chatLink': chatLink,
    };
  }
}
