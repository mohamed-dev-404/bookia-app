import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/features/splash/splash_view.dart';
import 'package:bookia/features/welcome/welcome_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      //* Splash view
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashView(),
      ),
      //* Welcome view
      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => const WelcomeView(),
      ),
      // GoRoute(
      //   path: Routes.login,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => AuthCubit(),
      //     child: const LoginScreen(),
      //   ),
      // ),
      // GoRoute(
      //   path: Routes.register,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => AuthCubit(),
      //     child: const RegisterScreen(),
      //   ),
      // ),
      // GoRoute(
      //   path: Routes.forgotPassword,
      //   builder: (context, state) {
      //     return ForgotPasswordScreen(email: state.extra as String);
      //   },
      // ),
    ],
  );
}
