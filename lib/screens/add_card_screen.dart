import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../view_models/card_view_model.dart';
import '../widgets/app_bar_with_back_widget.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardViewModel>(builder: (context, cardViewModel, child) {
      return Scaffold(
        backgroundColor: CustomColors.orangeColorTint,
        appBar: const AppBarWithBackWidget(showPuppy: false, showCart: false,),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: black18w500(
                        data: cardViewModel.getIsCardAdd
                            ? 'Add New Card'
                            : 'Card Detail',
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Visibility(
                      visible: !cardViewModel.getIsCardAdd,
                      child: TextButton(
                        onPressed: () {
                       /*   cardViewModel.callDeleteCardsApi().then((value) {
                            if (value) {
                              Navigator.pop(context);
                              context.read<WalletViewModel>().callWalletDetailApi();
                            }
                          });*/
                        },
                        child: black14w500(
                          data: 'Remove',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CreditCardWidget(
                cardNumber: cardViewModel.getCardNumber,
                expiryDate: cardViewModel.getExpiryDate,
                cardHolderName: cardViewModel.getCardHolderName,
                cvvCode: cardViewModel.getCvvCode,
                showBackView: cardViewModel.getIsCvvFocused,
                cardBgColor: CustomColors.orangeColor,
                cardType: cardViewModel.getCardTypeVisa
                    ? CardType.visa
                    : CardType.mastercard,
                //glassmorphismConfig: Glassmorphism.defaultConfig(),
                //backgroundImage: 'assets/card_bg.png',
                obscureCardNumber: true,
                obscureInitialCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                height: 175.h,
                chipColor: CustomColors.color5,
                textStyle: const TextStyle(
                    color: CustomColors.color5, fontWeight: FontWeight.bold),
                width: MediaQuery.of(context).size.width,
                isChipVisible: true,
                isSwipeGestureEnabled: true,
                animationDuration: const Duration(milliseconds: 1000),
                frontCardBorder: Border.all(color: CustomColors.color5),
                backCardBorder: Border.all(color: CustomColors.color5),
                /*customCardTypeIcons: <customCardTypeIcons>[
                  CustomCardTypeImage(
                    cardType: CardType.mastercard,
                    cardImage: Image.asset(
                      'assets/mastercard.png',
                      height: 48,
                      width: 48,
                    ),
                  ),
                ],*/
                onCreditCardWidgetChange: (CreditCardBrand) {},
              ),
              Visibility(
                visible: cardViewModel.getIsCardAdd,
                child: CreditCardForm(
                  formKey: cardViewModel.formKey,
                  cardNumber: cardViewModel.getCardNumber,
                  expiryDate: cardViewModel.getExpiryDate,
                  cardHolderName: cardViewModel.getCardHolderName,
                  cvvCode: cardViewModel.getCvvCode,
                  onCreditCardModelChange:
                      cardViewModel.onCreditCardModelChange,
                  themeColor: CustomColors.color6,
                  obscureCvv: true,
                  obscureNumber: true,
                  isHolderNameVisible: true,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  enableCvv: true,
                  cardNumberValidator: (String? cardNumber) {},
                  expiryDateValidator: (String? expiryDate) {},
                  cvvValidator: (String? cvv) {},
                  cardHolderValidator: (String? cardHolderName) {},
                  onFormComplete: () {
                    // callback to execute at the end of filling card data
                  },
                  cardNumberDecoration: InputDecoration(
                    border:  OutlineInputBorder(
                        borderSide: BorderSide(color: CustomColors.color5)),
                    labelText: 'Number',
                    labelStyle:
                        TextStyle(color: CustomColors.color6, fontSize: 12.sp),
                    hintText: 'XXXX XXXX XXXX XXXX',
                  ),
                  expiryDateDecoration: InputDecoration(
                    border:  OutlineInputBorder(
                        borderSide: BorderSide(color: CustomColors.color5)),
                    labelText: 'Expired Date',
                    labelStyle:
                        TextStyle(color: CustomColors.color6, fontSize: 12.sp),
                    hintText: 'XX/XX',
                  ),
                  cvvCodeDecoration: InputDecoration(
                    border:  OutlineInputBorder(
                        borderSide: BorderSide(color: CustomColors.color5)),
                    labelText: 'CVV',
                    labelStyle:
                        TextStyle(color: CustomColors.color6, fontSize: 12.sp),
                    hintText: 'XXX',
                  ),
                  cardHolderDecoration: InputDecoration(
                    border:  OutlineInputBorder(
                        borderSide: BorderSide(color: CustomColors.color5)),
                    labelText: 'Card Holder',
                    labelStyle:
                        TextStyle(color: CustomColors.color6, fontSize: 12.sp),
                  ),
                ),
              ),
              Visibility(
                visible: !cardViewModel.getIsCardAdd &&
                    !cardViewModel.getIsPrimaryCard,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          black14w500(data: 'Set As Primary'),
                          Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              activeColor: CustomColors.color6,
                              value: cardViewModel.getIsPrimaryCard,
                              onChanged: (value) async {
                               /* await cardViewModel
                                    .callSetCardPrimaryApi()
                                    .then((status) {
                                  if (status) {
                                    cardViewModel.setPrimaryCard(value);
                                   // context.read<WalletViewModel>().callWalletDetailApi();
                                  }
                                });*/
                                //addressViewModel.setIsDefault(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              // Spacer(),
              Visibility(
                visible: cardViewModel.getIsCardAdd,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: customButton(
                    colored: true,
                    text: 'Submit',
                    onPressed: () async {
                     /* cardViewModel.callAddCardApi().then((value) {
                        if (value) {
                          Navigator.pop(context);
                          //context.read<WalletViewModel>().callWalletDetailApi();
                        }
                      });*/
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
