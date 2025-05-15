import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trademate_app/presentation/auth/controller/auth_signin_controller.dart';
import 'package:trademate_app/theme/palette.dart';
import 'package:trademate_app/utils/constant.dart';

class AuthSigninView extends StatefulWidget {
  const AuthSigninView({super.key});

  @override
  State<AuthSigninView> createState() => _AuthSigninViewState();
}

class _AuthSigninViewState extends State<AuthSigninView> {
  final AuthSigninController _con = Get.find();

  @override
  void initState() {
    super.initState();
    _con.init();
  }

  @override
  void dispose() {
    _con.disp();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Palette.primaryDef),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text(
          "Sign In",
          style: TextStyle(
            color: Palette.primaryDef,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Spacer(),
                const Text(
                  'Sign In to ',
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
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                'Enter the 6-digit verification code provided and click the link below.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Obx(() {
              if (!_con.hasCode) {
                return SizedBox(
                  width: 180,
                  height: 48,
                  child: Shimmer.fromColors(
                    baseColor: Palette.outline,
                    highlightColor: Colors.white54,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Palette.outline,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                );
              }
              return GestureDetector(
                onTap: () {
                  Clipboard.setData(
                    ClipboardData(
                      text: _con.code,
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Palette.outline,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    _con.code,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 8,
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Clipboard.setData(
                  ClipboardData(
                    text: "${Constant.TM_WEB_URI}/signin",
                  ),
                );
              },
              child: Text(
                "${Constant.TM_WEB_URI}/signin",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Palette.primaryDef),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
