import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  LoginCubit({required this.authRepo}) : super(LoginInitial());

  Future<void> login() async {
    emit(LoginLoading());
    final result = await authRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (errorMessage) => emit(LoginFailure(errorMessage: errorMessage)),
      (user) => emit(LoginSuccess()),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
