import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:trademate_app/data/repo/auth_repo.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:trademate_app/data/sock.dart';

class AuthSigninController extends GetxController {
  Logger log = Logger();
  IO.Socket socket = Sock.createChannel();

  final RxString _code = "".obs;
  String get code => _code.value;
  bool get hasCode => _code.value.isNotEmpty;

  void init() {
    getCode().then((_) {
      connect();
    });
  }

  void disp() {
    socket.close();
    socket.dispose();
  }

  Future<void> connect() async {
    try {
      log.i("Socket connecting");
      socket.connect();
      socket.on(
        "qr_code:$code",
        (data) {
          log.i("message recieved");
          if (data["event"] == "authenticated") {
            var d = data["data"];
            log.i(d);
          }
        },
      );
    } catch (e) {
      log.f("Error connecting to Socket: $e");
    }
  }

  Future<void> getCode() async {
    _code.value = await AuthRepo.createSignInCode();
  }

  Future<void> onAuthenticate() async {}
}
