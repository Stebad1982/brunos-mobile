import 'dart:convert';


import '../models/responses/promo_code_response.dart';
import '../utils/enums.dart';
import 'api_base_helper.dart';

class PromoApiServices {
  final ApiBaseHelper _httpService = ApiBaseHelper();

  Future<PromoCodeResponse> checkPromoCodeApi({required String code}) async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.promoIsValid,
        requestType: 'GET',
        params: code);
    final parsed = json.decode(response.body);
    PromoCodeResponse promoCodeResponse = PromoCodeResponse.fromJson(parsed);
    return promoCodeResponse;
  }
}
