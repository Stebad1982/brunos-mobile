import 'package:brunos_kitchen/models/responses/blogs_news_response.dart';
import 'package:brunos_kitchen/models/responses/faqs_blogs_news_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../services/faqs_blogs_news_api_services.dart';

class FaqsBlogsNewsViewModel with ChangeNotifier {
  final FaqsBlogsNewsApiServices _faqsBlogsNewsApiServices = FaqsBlogsNewsApiServices();
  FaqsBlogsNewsResponse _faqsResponse = FaqsBlogsNewsResponse();
  BlogsNewsResponse _blogsNewsResponse = BlogsNewsResponse();
  WebViewController _webViewController = WebViewController();

  WebViewController get getWebViewController => _webViewController;

  BlogsNewsResponse get getBlogsNewsResponse => _blogsNewsResponse;

  void setBlogsNewsResponse (BlogsNewsResponse value){
    _blogsNewsResponse = value;
    notifyListeners();
  }

  FaqsBlogsNewsResponse get getFaqsResponse => _faqsResponse;

  void setFaqsResponse(FaqsBlogsNewsResponse value) {
    _faqsResponse = value;
    notifyListeners();
  }

  void setWebView({required String url})async{
    EasyLoading.show(status: "Loading...");
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(false)
      ..currentUrl().catchError((error)async{
        EasyLoading.showError(error);
       // print("Invalid url ${error.hashCode} $error");
      })
      ..currentUrl()
      ..setNavigationDelegate(
          NavigationDelegate(
             /* onNavigationRequest: (navigation){
                final host = Uri.parse(navigation.url).host;
                if(host.contains("success")){
                  print("Flutter Web view success");
                  return NavigationDecision.navigate;
                }else{
                  return NavigationDecision.navigate;
                }
              },*/
              /*onUrlChange: (urlChange){
                if(urlChange.url!.contains('return')){
                  Navigator.pop(context);
                }
                print(" Url change in web wiew kjhkh \n  ${urlChange.url}");
              },*/
              onWebResourceError: (error){
                EasyLoading.dismiss();
                print("web view error ${error.description} ||\n ${error.errorType}");
              },
              onPageFinished: (v){
                EasyLoading.dismiss();
                notifyListeners();
                print("Navigation success");
              }
          )
      )
      ..loadRequest(
          Uri.parse(url)
      );
    // await _webViewController.loadRequest(Uri.parse(widget.url));
  }

  Future<bool> callFaqsApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final FaqsBlogsNewsResponse response = await _faqsBlogsNewsApiServices.allFaqsApi();
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

  void clearWebView() {
    _webViewController.clearCache();
    _webViewController.clearLocalStorage();
    notifyListeners();
  }
}
