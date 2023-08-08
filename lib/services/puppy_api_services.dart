import 'dart:convert';

import 'package:brunos_kitchen/models/base_response_model.dart';
import 'package:brunos_kitchen/models/requests/add_breed_request.dart';
import 'package:brunos_kitchen/models/requests/register_puppy_request.dart';
import 'package:brunos_kitchen/models/responses/breeds_response.dart';

import '../utils/enums.dart';
import 'api_base_helper.dart';

class PuppyApiServices {

 /* Future<BreedsResponse> breedsApi() async {
    ApiBaseHelper httpService = ApiBaseHelper();
    final response = await httpService.httpRequest(
        endPoint: EndPoints.breeds,
        requestType: 'GET',
        requestBody: '',
        params: '');
    final parsed = json.decode(response.body);
    BreedsResponse breedsResponse = BreedsResponse.fromJson(parsed);
    return breedsResponse;
  }*/

  Future<BaseResponseModel> addBreedsApi({required AddBreedRequest addBreedRequest}) async {
    ApiBaseHelper httpService = ApiBaseHelper();
    final response = await httpService.httpRequest(
        endPoint: EndPoints.addBreeds,
        requestType: 'POST',
        requestBody: addBreedRequest,
        params: '');
    final parsed = json.decode(response.body);
    BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(parsed);
    return baseResponseModel;
  }

  Future<BaseResponseModel> addPuppyApi({required RegisterPuppyRequest registerPuppyRequest}) async {
    ApiBaseHelper httpService = ApiBaseHelper();
    final response = await httpService.httpRequest(
        endPoint: EndPoints.registerPuppy,
        requestType: 'POST',
        requestBody: registerPuppyRequest,
        params: '');
    final parsed = json.decode(response.body);
    BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(parsed);
    return baseResponseModel;
  }



}
