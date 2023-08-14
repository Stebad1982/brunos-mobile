import 'package:brunos_kitchen/models/base_response_model.dart';
import 'package:http/http.dart';

import '../address_model.dart';


class AllAddressResponse  extends BaseResponseModel{

  AllAddressData? data;

  AllAddressResponse({super.isSuccess, super.message, this.data});

  AllAddressResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    data = json['data'] != null ? new AllAddressData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AllAddressData {
  AddressModel? defaultAddress;
  List<AddressModel>? allAddresses;

  AllAddressData({this.defaultAddress, this.allAddresses});

  AllAddressData.fromJson(Map<String, dynamic> json) {
    defaultAddress = json['default_address'] != null
        ? new AddressModel.fromJson(json['default_address'])
        : null;
    if (json['all_addresses'] != null) {
      allAddresses = <AddressModel>[];
      json['all_addresses'].forEach((v) {
        allAddresses!.add(new AddressModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.defaultAddress != null) {
      data['default_address'] = this.defaultAddress!.toJson();
    }
    if (this.allAddresses != null) {
      data['all_addresses'] =
          this.allAddresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



