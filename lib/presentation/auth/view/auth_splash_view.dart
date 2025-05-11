import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademate_app/presentation/auth/controller/auth_splash_controller.dart';

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
        color: Colors.white,
        child: Center(
          child: Text(
            'Splash Screen',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
