import 'package:get/get.dart';
import 'package:trademate_app/presentation/auth/binding/auth_signin_binding.dart';
import 'package:trademate_app/presentation/auth/binding/auth_splash_binding.dart';
import 'package:trademate_app/presentation/auth/binding/auth_welcome_binding.dart';
import 'package:trademate_app/presentation/auth/view/auth_signin_view.dart';
import 'package:trademate_app/presentation/auth/view/auth_splash_view.dart';
import 'package:trademate_app/presentation/auth/view/auth_welcome_view.dart';
import 'package:trademate_app/presentation/home/binding/home_wrapper_binding.dart';
import 'package:trademate_app/presentation/home/view/home_wrapper_view.dart';
import 'package:trademate_app/presentation/profile/view/profile_edit.view.dart';
import 'package:trademate_app/utils/routes/app_routes.dart';

class PagesRoute {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoute.splash,
      page: () => const AuthSplashView(),
      bindings: [AuthSplashBinding()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoute.home,
      page: () => const HomeWrapperView(),
      bindings: [HomeWrapperBinding()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoute.authWelcome,
      page: () => const AuthWelcomeView(),
      bindings: [AuthWelcomeBinding()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoute.authSignin,
      page: () => const AuthSigninView(),
      bindings: [AuthSigninBinding()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoute.editProfile,
      page: () => const EditProfileView(),
      bindings: [],
      transition: Transition.noTransition,
    ),
  ];
}
