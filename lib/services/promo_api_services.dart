import 'dart:convert';

import 'package:brunos_kitchen/models/base_response_model.dart';

import '../utils/enums.dart';
import 'api_base_helper.dart';

class PromoApiServices {
  final ApiBaseHelper _httpService = ApiBaseHelper();

  Future<BaseResponseModel> checkPromoCodeApi() async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.promoIsValid,
        requestType: 'GET',
        params: '');
    final parsed = json.decode(response.body);
    BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(parsed);
    return baseResponseModel;
  }
}
