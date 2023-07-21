import 'dart:convert';

import '../utils/enums.dart';
import 'package:http/http.dart' as http;
import '../utils/shared_pref .dart';
import 'api_base_helper.dart';

class AuthApiServices {
  final SharedPref _sharedPref = SharedPref();

 /* Future<AuthResponse> signInApi({required SignInRequest signInRequest}) async {
    ApiBaseHelper httpService = ApiBaseHelper();
    final response = await httpService.httpRequest(
        endPoint: EndPoints.signIn,
        requestType: 'POST',
        requestBody: signInRequest,
        params: '');
    final parsed = json.decode(response.body);
    AuthResponse signInResponse = AuthResponse.fromJson(parsed);
    if (signInResponse.status!) {
      _sharedPref.save(
          SharedPreferencesKeys.authToken.text, signInResponse.data!.token);
    }
    return signInResponse;
  }*/

}
