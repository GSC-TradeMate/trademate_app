import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:trademate_app/utils/constant.dart';

class Sock {
  static IO.Socket createChannel() {
    return IO.io(
      Constant.SOCKET_HTTP_URI,
      IO.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .setReconnectionAttempts(5)
          .setReconnectionDelay(1000)
          .build(),
    );
  }
}

enum SockStatus {
  connected,
  disconnected,
  connecting,
  disconnecting,
}
