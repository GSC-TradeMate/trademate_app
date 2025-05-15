import 'package:get/get.dart';
import '../controller/profile_main_controller.dart';

class ProfileMainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileMainController());
  }
}
