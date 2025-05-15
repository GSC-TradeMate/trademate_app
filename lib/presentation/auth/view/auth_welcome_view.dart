import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademate_app/presentation/auth/controller/auth_welcome_controller.dart';
import 'package:trademate_app/theme/palette.dart';
import 'package:trademate_app/widgets/button_solid_widget.dart';

class AuthWelcomeView extends StatefulWidget {
  const AuthWelcomeView({super.key});

  @override
  State<AuthWelcomeView> createState() => _AuthWelcomeViewState();
}

class _AuthWelcomeViewState extends State<AuthWelcomeView> {
  final AuthWelcomeController _con = Get.find();

  @override
  void initState() {
    _con.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/brands/logo-tm.png",
              height: 135,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                Spacer(),
                const Text(
                  'Welcome to ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'TradeMate',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Palette.primaryDef),
                ),
                Spacer(),
              ],
            ),
            const Text(
              'Your one-stop solution for trading.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ButtonSolid(
              onPressed: _con.handleSignin,
              child: const Text('Login With Whatsapp'),
              fixedSize: Size(238, 49),
            ),
          ],
        ),
      ),
    );
  }
}
