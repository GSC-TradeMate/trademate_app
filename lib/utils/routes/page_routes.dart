import 'package:get/get.dart';
import 'package:trademate_app/presentation/home/view/home_wrapper_view.dart';
import 'package:trademate_app/utils/routes/app_routes.dart';

class PagesRoute {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoute.home,
      page: () => const HomeWrapperView(),
      bindings: [],
      transition: Transition.cupertino,
    ),
  ];
}
