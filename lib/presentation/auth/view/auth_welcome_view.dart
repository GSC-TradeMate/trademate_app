import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademate_app/presentation/auth/controller/auth_welcome_controller.dart';

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
            const Text(
              'Welcome to TradeMate',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your one-stop solution for trading.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _con.handleSignin,
              child: const Text('Login With Whatsapp'),
            ),
          ],
        ),
      ),
    );
  }
}
