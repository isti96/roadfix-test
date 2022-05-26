import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roadfix_test/card_infos.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class Strings {
  static const String appName = 'Payment Card Demo';
  static const String fieldReq = 'This field is required';
  static const String numberIsInvalid = 'Card is invalid';
  static const String pay = 'Validate';
}

class _SecondScreenState extends State<SecondScreen> {
  bool? value = false;
  TextEditingController cardholderNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvcController = TextEditingController();

  String creditCardNumber = '';
  late IconData brandIcon;
  final _paymentCard = CardInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 70, right: 40, left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Image.asset(
                              'assets/images/Vector.png',
                              width: 24,
                              height: 21,
                            ),
                          )),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text(
                        'Checkout',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'New card',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/Card.png',
                      width: 253,
                      height: 162,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Cardholder name',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    controller: cardholderNameController,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.only(top: 8, bottom: 8),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0)),
                      hintText: 'Enter cardholder name',
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Card number',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    validator: CardUtils.validateCardNum,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                    ],
                    onChanged: (str) {
                      _getCardTypeFrmNumber();
                    },
                    keyboardType: TextInputType.number,
                    controller: cardNumberController,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                    decoration: InputDecoration(
                      suffixIcon: Container(
                        child: getCardIcon(_paymentCard.type),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0)),
                      hintText: 'Enter card number',
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18),
                      isDense: true,
                      contentPadding: const EdgeInsets.only(top: 8, bottom: 8),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Exp date',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Container(
                            width: 160,
                            child: TextFormField(
                              validator: CardUtils.validateDate,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(5),
                              ],
                              controller: expDateController,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                              decoration: const InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.only(top: 8, bottom: 8),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(width: 2.0)),
                                hintText: 'Enter exp date',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'CVC',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Container(
                            width: 160,
                            child: TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3)
                              ],
                              validator: CardUtils.validateCVC,
                              controller: cvcController,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                              decoration: const InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.only(top: 8, bottom: 8),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(width: 2.0)),
                                hintText: 'Enter CVC',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 16,
                        height: 15,
                        child: Checkbox(
                          value: value,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      const Text(
                        'Set as primary',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        if (validateAndSave()) {
                          _sendDataBack(context);
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color.fromARGB(255, 83, 224, 255)),
                          alignment: Alignment.center,
                          width: 264,
                          height: 50,
                          child: const Text(
                            'Add card',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(cardNumberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      _paymentCard.type = cardType;
    });
  }

  bool validateAndSave() {
    RegExp regExp = RegExp(r"^[0-9]{16}$");
    bool cardNumberIsValid = regExp.hasMatch(cardNumberController.text);
    bool cardTypeIsInvalid = _paymentCard.type == CardType.invalid;
    bool expDateIsValid =
        CardUtils.validateDate(expDateController.text).toString() == 'null';
    bool cvcIsValid =
        CardUtils.validateCVC(cvcController.text).toString() == 'null';
    bool nameIsValid =
        CardUtils.validateName(cardholderNameController.text).toString() ==
            'null';

    return (cardNumberController.text.isNotEmpty &&
        cardNumberIsValid &&
        !cardTypeIsInvalid &&
        expDateIsValid &&
        cvcIsValid &&
        nameIsValid);
  }

  void _sendDataBack(BuildContext context) {
    CardInfo card = CardInfo();
    card.setCardInfo(
        _paymentCard.type,
        cardholderNameController.text,
        cardNumberController.text,
        expDateController.text,
        cvcController.text,
        value);

    Navigator.pop(context, card);
  }
}