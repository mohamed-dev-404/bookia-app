
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final AuthRepo authRepo;
  ForgetPasswordCubit({required this.authRepo}) : super(ForgetPasswordInitial());
}
