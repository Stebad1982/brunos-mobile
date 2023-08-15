

/*class AddressApiServices {
  Future<AllAddressResponse> allAddress() async {
    ApiBaseHelper httpService = ApiBaseHelper();
    final response = await httpService.httpRequest(
        endPoint: EndPoints.allAddresses, requestType: 'GET', params: '');
    final parsed = json.decode(response.body);
    AllAddressResponse allAddressResponse = AllAddressResponse.fromJson(parsed);
    return allAddressResponse;
  }

  Future<AllAddressResponse> createAddress(
      {required CreateAddressRequest createAddressRequest}) async {
    ApiBaseHelper httpService = ApiBaseHelper();
    final response = await httpService.httpRequest(
        endPoint: EndPoints.createAddress,
        requestType: 'POST',
        requestBody: createAddressRequest,
        params: '');
    final parsed = json.decode(response.body);
    AllAddressResponse allAddressResponse = AllAddressResponse.fromJson(parsed);
    return allAddressResponse;
  }

  Future<AllAddressResponse> deleteAddress({required int addressId}) async {
    ApiBaseHelper httpService = ApiBaseHelper();
    final response = await httpService.httpRequest(
        endPoint: EndPoints.deleteAddress,
        requestType: 'GET',
        requestBody: '',
        params: addressId.toString());
    final parsed = json.decode(response.body);
    AllAddressResponse allAddressResponse = AllAddressResponse.fromJson(parsed);
    return allAddressResponse;
  }

  Future<AllAddressResponse> updateAddress(
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
  }
}*/
