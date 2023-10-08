import 'package:brunos_kitchen/models/responses/blogs_news_response.dart';
import 'package:brunos_kitchen/models/responses/faqs_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../services/faqs_blogs_news_api_services.dart';

class FaqsBlogsNewsViewModel with ChangeNotifier {
  final FaqsBlogsNewsApiServices _faqsBlogsNewsApiServices = FaqsBlogsNewsApiServices();
  FaqsResponse _faqsResponse = FaqsResponse();
  BlogsNewsResponse _blogsNewsResponse = BlogsNewsResponse();

  BlogsNewsResponse get getBlogsNewsResponse => _blogsNewsResponse;

  void setBlogsNewsResponse (BlogsNewsResponse value){
    _blogsNewsResponse = value;
    notifyListeners();
  }

  FaqsResponse get getFaqsResponse => _faqsResponse;

  void setFaqsResponse(FaqsResponse value) {
    _faqsResponse = value;
    notifyListeners();
  }

  Future<bool> callFaqsApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final FaqsResponse response = await _faqsBlogsNewsApiServices.allFaqsApi();
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

  Future<bool> callBlogsNewsApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final BlogsNewsResponse response = await _faqsBlogsNewsApiServices.allBlogsAndNewsApi();
      if (response.isSuccess!) {
        setBlogsNewsResponse(response);
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
