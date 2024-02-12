import 'dart:convert';
import 'package:brunos_kitchen/models/base_response_model.dart';
import 'package:brunos_kitchen/models/requests/feedback_request.dart';
import 'package:brunos_kitchen/models/responses/blogs_news_response.dart';
import 'package:brunos_kitchen/models/responses/faqs_blogs_news_response.dart';

import '../utils/enums.dart';
import 'api_base_helper.dart';

class FaqsBlogsNewsApiServices {
  final ApiBaseHelper _httpService = ApiBaseHelper();

  Future<FaqsBlogsNewsResponse> allFaqsApi() async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.allFaqs, requestType: 'GET', params: '');
    final parsed = json.decode(response.body);
    FaqsBlogsNewsResponse faqsResponse = FaqsBlogsNewsResponse.fromJson(parsed);
    return faqsResponse;
  }

  Future<BaseResponseModel> addFeedbackApi(
      {required FeedbackRequest feedbackRequest}) async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.addFeedback,
        requestType: 'POST',
        params: '',
        requestBody: feedbackRequest);
    final parsed = json.decode(response.body);
    BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(parsed);
    return baseResponseModel;
  }

  Future<BlogsNewsResponse> allNewsApi() async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.allNews, requestType: 'GET', params: '');
    final parsed = json.decode(response.body);
    BlogsNewsResponse blogsNewsResponse = BlogsNewsResponse.fromJson(parsed);
    return blogsNewsResponse;
  }
  Future<BlogsNewsResponse> allBlogsApi() async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.allBlogs, requestType: 'GET', params: '');
    final parsed = json.decode(response.body);
    BlogsNewsResponse blogsNewsResponse = BlogsNewsResponse.fromJson(parsed);
    return blogsNewsResponse;
  }

}
