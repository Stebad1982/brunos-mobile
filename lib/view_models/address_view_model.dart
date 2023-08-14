import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:location/location.dart' as locator;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import '../models/address_model.dart';
import '../models/responses/all_address_reponse.dart';
import '../services/api_base_helper.dart';

class AddressViewModel with ChangeNotifier {
  //final AddressApiServices _addressApiServices = AddressApiServices();
 AllAddressResponse _allAddressResponse = AllAddressResponse();
  final TextEditingController _fullAddressController = TextEditingController();
  final TextEditingController _nearByLocationController =
      TextEditingController();
  GoogleMapsPlaces? _googleMapsPlaces;
  LatLng _initialCameraPosition = const LatLng(20.5937, 78.9629);
  Timer? _debounce;
  List<Prediction> _predictionList = [];
  double? _selectedAddressLat;
  double? _selectedAddressLng;
  GoogleMapController? _googleMapController;
  locator.LocationData? myLocation;
  String? error;
  locator.Location location = locator.Location();

  // Prediction? _selectedPrediction;
  bool _isDefault = false;
  int _selectedLabel = 1;
  AddressModel _editAddress = AddressModel();
  bool _isAddressAdd = true;
  bool _routeFromSettings = true;

  Timer? get getDebounce => _debounce;

  LatLng get getInitialCameraPosition => _initialCameraPosition;

  void setInitialCameraPosition(LatLng value) {
    _initialCameraPosition = value;
    _selectedAddressLat = value.latitude;
    _selectedAddressLng = value.longitude;
    notifyListeners();
  }

  //Prediction? get getSelectedPrediction => _selectedPrediction;

  Future<void> setSelectedPrediction(Prediction value) async {
    EasyLoading.show(status: 'Please Wait');
    _nearByLocationController.text = value.description!;
    await getPredictionLatLng(value);
    notifyListeners();
  }

  TextEditingController get getFullAddressController => _fullAddressController;

  GoogleMapController get getGoogleMapController => _googleMapController!;

  List<Prediction> get getPrediction => _predictionList;

  TextEditingController get getNearByLocationController =>
      _nearByLocationController;

  AddressModel get getEditAddress => _editAddress;

  bool get getIsAddressAdd => _isAddressAdd;

  bool get getRoutFromSettings => _routeFromSettings;

  AllAddressResponse get getAllAddressResponse => _allAddressResponse;

  bool get getIsDefault => _isDefault;

  int get getSelectedLabel => _selectedLabel;

  void setDebounce(Timer? value) {
    _debounce = value;
    notifyListeners();
  }

  void setPredictionList(List<Prediction> value) {
    _predictionList = value;
    notifyListeners();
  }

  void setEditAddress(AddressModel value) {
    _editAddress = value;
    _fullAddressController.text = _editAddress.fullAddress!;
    _nearByLocationController.text = _editAddress.nearbyLocations!;
    _selectedLabel = _editAddress.addressType!;
    _isDefault = _editAddress.isDefault!;
    notifyListeners();
  }

  void setRouteFromSettings(bool value) {
    _routeFromSettings = value;
    notifyListeners();
  }

  void setIsAddressAdd(bool value) {
    _isAddressAdd = value;
    if (_isAddressAdd) {
      clearAddressData();
    }
    notifyListeners();
  }

  void setAllAddressResponse(AllAddressResponse value) {
    _allAddressResponse = value;
    notifyListeners();
  }

  void setIsDefault(bool value) {
    _isDefault = value;
    notifyListeners();
  }

  void setSelectedLabel(int value) {
    _selectedLabel = value;
    notifyListeners();
  }

  clearAddressData() {
    _fullAddressController.clear();
    _nearByLocationController.clear();
    _selectedLabel = 1;
    _isDefault = false;
  }

  bool validateAddress() {
    if (_fullAddressController.text.isEmpty ||
        _nearByLocationController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void getUserLocation(
    GoogleMapController _cntlr,
  ) async {
    _googleMapController = _cntlr;
    if (_isAddressAdd) {
      try {
        myLocation = await location.getLocation();
      } on PlatformException catch (e) {
        if (e.code == 'PERMISSION_DENIED') {
          error = 'please grant permission';
          print(error);
        }
        if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
          error = 'permission denied- please enable it from app settings';
          print(error);
        }
        myLocation = null;
      }
      updateMapCameraPosition(
          LatLng(myLocation!.latitude!, myLocation!.longitude!));
    }

    else{
      _googleMapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(double.parse(_editAddress.lat!),double.parse(_editAddress.long!)), zoom: 15),
        ),
      );
      setInitialCameraPosition(LatLng(double.parse(_editAddress.lat!),double.parse(_editAddress.long!)));
    }

  }

  void updateMapCameraPosition(LatLng location) async {
    _googleMapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: location, zoom: 15),
      ),
    );
    setInitialCameraPosition(LatLng(location.latitude, location.longitude));
    convertCoordinatesToPlaces();
  }

  Future<void> convertCoordinatesToPlaces() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(getInitialCameraPosition.latitude, getInitialCameraPosition.longitude);
    var first = placemarks.first;
    getNearByLocationController.text =
        '${first.locality}, ${first.name},${first.subLocality}, ${first.thoroughfare}, ${first.subThoroughfare}';
  }

  Future<void> getPredictionLatLng(Prediction p) async {
    PlacesDetailsResponse detail =
        await _googleMapsPlaces!.getDetailsByPlaceId(p.placeId!);
    _selectedAddressLat = detail.result.geometry!.location.lat;
    _selectedAddressLng = detail.result.geometry!.location.lng;
    updateMapCameraPosition(
      LatLng(_selectedAddressLat!, _selectedAddressLng!),
    );
    EasyLoading.dismiss();
    _predictionList.clear();
  }

  void autoCompleteSearch(String value) async {
    try {
      EasyLoading.show(status: 'Searching');
      _googleMapsPlaces = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders(),
      );
      PlacesAutocompleteResponse result = await _googleMapsPlaces!.autocomplete(
          value,
          types: [],
          strictbounds: false,
          language: "en",
          components: [Component(Component.country, "pk")]);
      setPredictionList(result.predictions);
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showToast(e.toString());
    }
  }

/*  Future<bool> callAllAddressApi() async {
    EasyLoading.show(status: 'Please wait...');
    try {
      final AllAddressResponse response =
          await _addressApiServices.allAddress();
      setAllAddressResponse(response);
      if (_allAddressResponse.status!) {
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError('${_allAddressResponse.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  Future<bool> callCreateAddressApi() async {
    EasyLoading.show(status: 'Please wait...');
    final CreateAddressRequest newAddress = CreateAddressRequest(
        addressType: _selectedLabel,
        fullAddress: _fullAddressController.text,
        nearbyLocations: _nearByLocationController.text,
        lat: _selectedAddressLat.toString(),
        long: _selectedAddressLng.toString(),
        isDefault: _isDefault);
    try {
      final AllAddressResponse response = await _addressApiServices
          .createAddress(createAddressRequest: newAddress);

      setAllAddressResponse(response);

      if (_allAddressResponse.status!) {
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError('${_allAddressResponse.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  Future<bool> callDeleteAddressApi() async {
    EasyLoading.show(status: 'Please wait...');
    try {
      final AllAddressResponse response =
          await _addressApiServices.deleteAddress(addressId: _editAddress.id!);
      setAllAddressResponse(response);
      if (_allAddressResponse.status!) {
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError('${_allAddressResponse.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  Future<bool> callUpdateAddressApi() async {
    EasyLoading.show(status: 'Please wait...');
    final AddressModel updatedAddress = AddressModel(
        id: _editAddress.id,
        addressType: _selectedLabel,
        fullAddress: _fullAddressController.text,
        nearbyLocations: _nearByLocationController.text,
        lat: _selectedAddressLat.toString(),
        long: _selectedAddressLng.toString(),
        isDefault: _isDefault);
    try {
      final AllAddressResponse response =
          await _addressApiServices.updateAddress(addressModel: updatedAddress);

      setAllAddressResponse(response);

      if (_allAddressResponse.status!) {
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError('${_allAddressResponse.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }*/
}
