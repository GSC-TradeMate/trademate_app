import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademate_app/test/test_socket_controller.dart';

class TestSocketView extends StatefulWidget {
  const TestSocketView({super.key});

  @override
  State<TestSocketView> createState() => _TestSocketViewState();
}

class _TestSocketViewState extends State<TestSocketView> {
  final TestSocketController _con = Get.put(TestSocketController());

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
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Socket Test"),
            ElevatedButton(
              onPressed: () {
                _con.socket.emit("message", "Hello from Flutter");
              },
              child: const Text("Send Hello"),
            ),
          ],
        ),
      ),
    );
  }
}
