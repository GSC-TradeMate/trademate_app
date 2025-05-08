import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:trademate_app/theme/theme.dart';
// import 'package:trademate_app/utils/constant.dart';
import 'package:trademate_app/utils/routes/app_routes.dart';
import 'package:trademate_app/utils/routes/page_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Future.wait([
  //   Constant.load(),
  // ]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      getPages: PagesRoute.pages,
      initialRoute: AppRoute.initialRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
