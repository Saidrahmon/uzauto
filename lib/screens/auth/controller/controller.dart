import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:uzauto/models/User.dart';
import 'package:uzauto/repositories/AuthRepo.dart';

class AuthController extends GetxController {
  static const _platform = MethodChannel('flutter.native/myid');

  var userModel = UserModel().obs;
  AuthRepo authRepo = AuthRepo();


  void startMyId() {
    _platform.invokeMethod('runSDK').then((value) {
      if(value.length > 5){
        getUserInfo(value);
      }else{
        getErrorMessage(value);
      }
    });
  }

  void getUserInfo(String code) async {
    String token = await authRepo.getAccessToken(code.replaceAll("\"", ""));
    userModel.value = await authRepo.getUserInfo(token);
  }

  String getErrorMessage(String code) {
    String message = "";
    switch (code) {
      case "2":
        {
          message = "Паспортные данные введены неправильно";
        }
        break;
      case "3":
        {
          message = "Паспортные данные введены неправильно";
        }
        break;
      default : message = "Сервис MyID не может обработать запрос. Попробуйте повторить позже";
    }
    return message;
  }
}
