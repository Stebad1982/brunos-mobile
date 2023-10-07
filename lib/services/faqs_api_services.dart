import 'dart:convert';
import 'package:brunos_kitchen/models/responses/faqs_response.dart';

import '../utils/enums.dart';
import 'api_base_helper.dart';

class FaqsApiServices {
  final ApiBaseHelper _httpService = ApiBaseHelper();

  Future<FaqsResponse> allFaqsApi() async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.allFaqs, requestType: 'GET', params: '');
    final parsed = json.decode(response.body);
    FaqsResponse faqsResponse = FaqsResponse.fromJson(parsed);
    return faqsResponse;
  }
}
