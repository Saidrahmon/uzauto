import 'package:get/get.dart';
import 'package:uzauto/screens/auth/controller/controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
