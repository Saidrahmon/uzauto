import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzauto/screens/auth/controller/controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth"),
      ),
      body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: controller.startMyId,
                child: const Text("Start MyID"),
              ),
              Text(controller.userModel.value.lastName ?? ""),
              Text(controller.userModel.value.firstName ?? ""),
              Text(controller.userModel.value.middleName ?? ""),
              Text(controller.userModel.value.birthCountry ?? ""),
            ],
          ),
        ),
      ),
    );
  }
}
