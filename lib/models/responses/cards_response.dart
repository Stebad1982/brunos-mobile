import 'package:brunos_kitchen/models/base_response_model.dart';

import '../card_model.dart';

class CardsResponse extends BaseResponseModel{
  List<CardModel>? data;

  CardsResponse({super.isSuccess, this.data, super.message});

  CardsResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['data'] != null) {
      data = <CardModel>[];
      json['data'].forEach((v) {
        data!.add(CardModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccess'] = isSuccess;
   /* if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }*/
    data['message'] = message;
    return data;
  }
}

