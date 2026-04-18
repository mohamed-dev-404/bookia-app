import 'package:bookia/core/cache/secure_storage/secure_storage_service.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final ProfileRepo profileRepo;

  SplashCubit({required this.profileRepo}) : super(SplashInitial());

  Future<void> getInitData() async {
    final token = await SecureStorageService.instance.getAccessToken();
    if (token == null || token.isEmpty) {
      emit(SplashError('there is no active session, please login again'));
      return;
    }
    final response = await profileRepo.getProfile();
    response.fold(
      (failure) {
        emit(SplashError(failure));
      },
      (profileResponse) {
        emit(SplashSuccess());
      },
    );
  }
}
