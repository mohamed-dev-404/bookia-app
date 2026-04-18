import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  final AuthRepo authRepo;
  RegisterCubit({required this.authRepo}) : super(RegisterInitial());

  Future<void> register() async {
    emit(RegisterLoading());
    final result = await authRepo.register(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      passwordComfirmation: confirmPasswordController.text,
    );
    result.fold(
      (errorMessage) => emit(RegisterFailure(errorMessage: errorMessage)),
      (user) => emit(RegisterSuccess()),
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
