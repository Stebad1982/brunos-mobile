import 'package:brunos_kitchen/models/responses/faqs_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../services/faqs_api_services.dart';

class FaqsViewModel with ChangeNotifier {
  final FaqsApiServices _faqsApiServices = FaqsApiServices();
  FaqsResponse _faqsResponse = FaqsResponse();

  FaqsResponse get getFaqsResponse => _faqsResponse;

  void setFaqsResponse(FaqsResponse value) {
    _faqsResponse = value;
    notifyListeners();
  }

  Future<bool> callFaqsApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final FaqsResponse response = await _faqsApiServices.allFaqsApi();
      if (response.isSuccess!) {
        setFaqsResponse(response);
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError('${response.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }
}
