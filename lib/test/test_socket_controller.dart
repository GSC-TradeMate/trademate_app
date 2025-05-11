import 'package:get/get.dart';
import 'package:trademate_app/utils/constant.dart';
import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class TestSocketController extends GetxController {
  Logger log = Logger();

  final IO.Socket socket = IO.io(
    Constant.SOCKET_HTTP_URI,
    IO.OptionBuilder()
        .setTransports(['websocket']) // for Flutter or Dart VM
        .setReconnectionAttempts(5)
        .setReconnectionDelay(1000)
        .build(),
  );

  void init() {
    log.i("Socket initialized: ${Constant.SOCKET_HTTP_URI}");
    connect();
  }

  void disp() {
    socket.dispose();
  }

  Future<void> connect() async {
    try {
      socket.connect();
      socket.onConnect((_) {
        log.i("Socket connected");
      });
      socket.onConnectError((data) {
        log.e("Socket connection error: $data");
      });
      socket.onDisconnect((_) {
        log.i("Socket disconnected");
      });
      socket.on(
        "hello",
        (data) {
          log.i("Socket hello said: $data");
        },
      );
    } catch (e) {
      log.f("Error connecting to Socket: $e");
    }
  }
}
