import 'package:school_hive/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/presentation/usecases/usecase.dart';
import '../entities/profile.dart';
import '../repository/profile_repo.dart';

class GetProfileInfoUseCase implements UseCase<Profile, NoParams> {
  final ProfileRepository profileRepository;

  GetProfileInfoUseCase({required this.profileRepository});

  @override
  Future<Either<Failure, Profile>> call(NoParams params) async {
    return await profileRepository.getProfileInfo();
  }
}
