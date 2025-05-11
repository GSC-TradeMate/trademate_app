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
        title: const Text("Sign In"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
