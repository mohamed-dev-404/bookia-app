import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/services/service_locator.dart';
import 'package:bookia/features/auth/presentation/view/login/login_view.dart';
import 'package:bookia/features/auth/presentation/view/register/register_view.dart';
import 'package:bookia/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:bookia/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:bookia/features/main/main_app_view.dart';
import 'package:bookia/features/splash/view/splash_view.dart';
import 'package:bookia/features/splash/view_model/splash_cubit.dart';
import 'package:bookia/features/welcome/welcome_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      //* Splash view
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<SplashCubit>()..getInitData(),
          child: const SplashView(),
        ),
      ),

      //* Welcome view
      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => const WelcomeView(),
      ),

      //* Login view
      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginView(),
        ),
      ),

      //* Register view
      GoRoute(
        path: Routes.register,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: const RegisterView(),
        ),
      ),

      // GoRoute(
      //   path: Routes.forgotPassword,
      //   builder: (context, state) {
      //     return ForgotPasswordScreen(email: state.extra as String);
      //   },
      // ),

      //* Main view
      GoRoute(
        path: Routes.main,
        builder: (context, state) => const MainAppView(),
      ),
    ],
  );
}
