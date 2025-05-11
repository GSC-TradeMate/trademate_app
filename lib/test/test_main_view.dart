import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademate_app/test/test_socket_view.dart';

class TestMainView extends StatefulWidget {
  const TestMainView({super.key});

  @override
  State<TestMainView> createState() => _TestMainViewState();
}

class _TestMainViewState extends State<TestMainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Test Main View"),
            ElevatedButton(
              onPressed: () {
                Get.to(TestSocketView());
              },
              child: const Text("Test Button"),
            ),
          ],
        ),
      ),
    );
  }
}
