import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uzauto/config/config.dart';
import 'package:uzauto/models/User.dart';

class AuthRepo {
  Future<String> getAccessToken(String code) async {
    var postUri = Uri.parse("${Config.faceIdBaseUrl}/api/v1${Config.getAccessToken}");

    var request = http.MultipartRequest("POST", postUri);

    request.fields['grant_type'] = Config.grantType;
    request.fields['code'] = code;
    request.fields['client_id'] = Config.clientId;
    request.fields['client_secret'] = Config.clientSecret;
    http.Response response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes))['access_token'];
    }
    throw ("Error");
  }

  Future<UserModel> getUserInfo(String token) async {
    http.Response response = await http.get(Uri.parse("${Config.faceIdBaseUrl}/api/v1${Config.login}"), headers: {"Authorization": "Bearer $token"});

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes))['profile']['common_data']);
    }
    throw ("Error");
  }
}
