import 'dart:convert';
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

  Future<BlogsNewsResponse> allBlogsAndNewsApi() async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.allBlogsAndNews, requestType: 'GET', params: '');
    final parsed = json.decode(response.body);
    BlogsNewsResponse blogsNewsResponse = BlogsNewsResponse.fromJson(parsed);
    return blogsNewsResponse;
  }
}
