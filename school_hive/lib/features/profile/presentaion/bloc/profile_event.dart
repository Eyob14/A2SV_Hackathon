import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetProfileInfo extends ProfileEvent {}

class EditProfileInfo extends ProfileEvent {}
