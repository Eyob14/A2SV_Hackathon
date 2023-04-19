import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:school_hive/features/profile/domain/entities/profile.dart';
import 'package:school_hive/features/profile/presentation/bloc/profile_event.dart';
import 'package:school_hive/features/profile/presentation/bloc/profile_state.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/presentation/usecases/usecase.dart';
import '../../domain/usecases/get_profile_info_usecase.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileInfoUseCase profileInfoUseCase;

  ProfileBloc(super.initialState, {required this.profileInfoUseCase});

  void _getProfileInfo(GetProfileInfo event, Emitter<ProfileState> emit) async {
    emit(ProfileInitial());
    final failureOrProfile = await profileInfoUseCase(NoParams());
    var profileState = _errorOrProfile(failureOrProfile);
    emit(profileState);
  }

  ProfileState _errorOrProfile(Either<Failure, Profile> failureOrProfile) {
    return failureOrProfile.fold(
      (failure) => const ProfileError(message: "Couldn't fetch issues"),
      (profileInfo) => ProfileInfo(profileInfo: profileInfo),
    );
  }
}
