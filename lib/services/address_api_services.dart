

import 'dart:convert';

import 'package:brunos_kitchen/models/base_response_model.dart';
import 'package:brunos_kitchen/models/requests/add_address_request.dart';

import '../models/responses/all_address_reponse.dart';
import '../utils/enums.dart';
import 'api_base_helper.dart';

class AddressApiServices {
  Future<AllAddressResponse> allAddress() async {
    ApiBaseHelper httpService = ApiBaseHelper();
    final response = await httpService.httpRequest(
        endPoint: EndPoints.allAddresses, requestType: 'GET', params: '');
    final parsed = json.decode(response.body);
    AllAddressResponse allAddressResponse = AllAddressResponse.fromJson(parsed);
    return allAddressResponse;
  }

  Future<BaseResponseModel> createAddress(
      {required AddAddressRequest addAddressRequest}) async {
    ApiBaseHelper httpService = ApiBaseHelper();
    final response = await httpService.httpRequest(
        endPoint: EndPoints.addAddress,
        requestType: 'POST',
        requestBody: addAddressRequest,
        params: '');
    final parsed = json.decode(response.body);
    BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(parsed);
    return baseResponseModel;
  }

  Future<BaseResponseModel> deleteAddress({required String addressId}) async {
    ApiBaseHelper httpService = ApiBaseHelper();
    final response = await httpService.httpRequest(
        endPoint: EndPoints.deleteAddress,
        requestType: 'DEL',
        params: addressId);
    final parsed = json.decode(response.body);
    BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(parsed);
    return baseResponseModel;
  }

/*  Future<AllAddressResponse> updateAddress(
      {required AddressModel addressModel}) async {
    ApiBaseHelper httpService = ApiBaseHelper();
    final response = await httpService.httpRequest(
        endPoint: EndPoints.updateAddress,
        requestType: 'POST',
        requestBody: addressModel,
        params: '');
    final parsed = json.decode(response.body);
    AllAddressResponse allAddressResponse = AllAddressResponse.fromJson(parsed);
    return allAddressResponse;
  }*/
}
