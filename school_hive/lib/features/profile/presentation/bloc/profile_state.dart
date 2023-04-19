import 'package:equatable/equatable.dart';

import '../../domain/entities/profile.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileInfo extends ProfileState {
  final Profile profileInfo;

  const ProfileInfo({required this.profileInfo});

  @override
  List<Object> get props => [profileInfo];
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError({required this.message});

  @override
  List<Object> get props => [message];
}
