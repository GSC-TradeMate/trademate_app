import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:trademate_app/data/repo/auth_repo.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:trademate_app/data/sock.dart';
import 'package:trademate_app/utils/constant.dart';
import 'package:trademate_app/utils/hive/models/session/session_model.dart';
import 'package:trademate_app/utils/hive/stores/session_store.dart';
import 'package:trademate_app/utils/routes/app_routes.dart';

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
      log.i(Constant.SOCKET_HTTP_URI);
      log.i(Constant.CURRENT_ENVIRONMENT);
      socket.onError((e) {
        log.i(Constant.SOCKET_HTTP_URI);
        log.e("Socket error: $e");
      });
      socket.on(
        "qr_code:$code",
        (data) async {
          log.i("message recieved");
          if (data["event"] == "authenticated") {
            await SessionStore.set(SessionModel.fromMap(data["data"]));
            Get.offAllNamed(AppRoute.home);
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
