import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trademate_app/presentation/auth/controller/auth_splash_controller.dart';
import 'package:trademate_app/theme/palette.dart';

class AuthSplashView extends StatefulWidget {
  const AuthSplashView({super.key});

  @override
  State<AuthSplashView> createState() => _AuthSplashViewState();
}

class _AuthSplashViewState extends State<AuthSplashView> {
  final AuthSplashController _con = Get.find();

  @override
  void initState() {
    super.initState();
    _con.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Palette.white,
        child: Center(
          child: SvgPicture.asset(
            "assets/brands/logo-tm-text.svg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
