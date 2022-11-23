import 'package:get/get.dart';
import 'package:uzauto/AppRoutes.dart';
import 'package:uzauto/screens/auth/binding/binding.dart';
import 'package:uzauto/screens/auth/view/view.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    )
  ];
}
