import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';


class CardViewModel with ChangeNotifier {
  String _cardNumber = '';
  String _expiryDate = '';
  String _cardHolderName = '';
  bool _isCardAdd = false;
  String _cvvCode = '';
  bool _isPrimaryCard = false;
 // CardDetailData? _cardDetailData;
//  final CardApiServices _cardApiServices = CardApiServices();
  bool _isCvvFocused = false;
  bool _cardTypeVisa = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 // AllCardResponse _allCardResponse = AllCardResponse();

 // AllCardResponse get getAllCardResponse => _allCardResponse;

  bool get getIsCardAdd => _isCardAdd;

  bool get getIsPrimaryCard => _isPrimaryCard;

  String get getCardNumber => _cardNumber;

 // CardDetailData get getCardDetailData => _cardDetailData!;

  bool get getCardTypeVisa => _cardTypeVisa;

  String get getExpiryDate => _expiryDate;

  String get getCardHolderName => _cardHolderName;

  String get getCvvCode => _cvvCode;

  bool get getIsCvvFocused => _isCvvFocused;

  // void setAllCardResponse(AllCardResponse value) {
  //   _allCardResponse = value;
  //   notifyListeners();
  // }

  void setIsCardAdd(bool value) {
    _isCardAdd =  value;
    notifyListeners();
  }

  void setPrimaryCard(bool value) {
    _isPrimaryCard =  value;
    notifyListeners();
  }

  void clearCardData() {
    _cardNumber = "";
    _expiryDate = "";
    _cardHolderName = "";
    _cvvCode = "";
    notifyListeners();
  }

  // void setCardDetailData(CardDetailData value) {
  //   _cardDetailData = value;
  //   _expiryDate = _cardDetailData!.expDate!;
  //   _cardNumber = '0000 0000 0000 ${_cardDetailData!.endFourDigit}';
  //   _cardHolderName = _cardDetailData!.cardHolder!;
  //   _cvvCode = _cardDetailData!.cvc!;
  //   setPrimaryCard(_cardDetailData!.isPrimary!);
  //   notifyListeners();
  // }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    _cardNumber = creditCardModel!.cardNumber;
    _expiryDate = creditCardModel.expiryDate;
    _cardHolderName = creditCardModel.cardHolderName;
    _cvvCode = creditCardModel.cvvCode;
    _isCvvFocused = creditCardModel.isCvvFocused;
    if (_cardNumber.startsWith('5')) {
      _cardTypeVisa = false;
    } else {
      _cardTypeVisa = true;
    }
    notifyListeners();
  }

  void onValidate() {
    if (formKey.currentState!.validate()) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }

/*  Future<bool> callAllCardsApi() async {
    EasyLoading.show(status: 'Please wait...');
    try {
      final AllCardResponse response = await _cardApiServices.allCards();
      setAllCardResponse(response);
      if (_allCardResponse.status!) {
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError('${_allCardResponse.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  Future<bool> callSetCardPrimaryApi() async {
    EasyLoading.show(status: 'Please wait...');
    try {
      final AllCardResponse response = await _cardApiServices.primaryCard(cardId: _cardDetailData!.id!);
      setAllCardResponse(response);
      if (_allCardResponse.status!) {
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError('${_allCardResponse.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  Future<bool> callDeleteCardsApi() async {
    EasyLoading.show(status: 'Please wait...');
    try {
      final AllCardResponse response = await _cardApiServices.deleteCards(cardId: _cardDetailData!.id!);
      setAllCardResponse(response);
      if (_allCardResponse.status!) {
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError('${_allCardResponse.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  Future<bool> callAddCardApi() async {
    EasyLoading.show(status: 'Please wait...');
    AddCardRequest addCartRequest = AddCardRequest(number: _cardNumber, type: _cardTypeVisa? 'VISA' : 'MASTER CARD', expDate: _expiryDate, cvc: _cvvCode, cardHolder:_cardHolderName);
    try {
      final AllCardResponse response = await _cardApiServices.addCards(addCardRequest: addCartRequest);
      setAllCardResponse(response);
      if (_allCardResponse.status!) {
        EasyLoading.showSuccess(_allCardResponse.message!);
        return true;
      } else {
        EasyLoading.showError('${_allCardResponse.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }*/
}
