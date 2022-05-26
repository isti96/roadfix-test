import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:credit_card_validate/credit_card_validate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class CardInfo {
  CardType type = CardType.Others;
  String cardholderName = '';
  String cardNumber = '';
  String expDate = '';
  String cvc = '';
  bool isPrimary = false;

  void setCardInfo(type, cardholderName, cardNumber, expDate, cvc, isPrimary) {
    this.type = type;
    this.cardholderName = cardholderName;
    this.cardNumber = cardNumber;
    this.expDate = expDate;
    this.cvc = cvc;
    this.isPrimary = isPrimary;
  }

  @override
  String toString() {
    String message = 'cardholderName: ' +
        cardholderName +
        '\ncardNumber: ' +
        cardNumber +
        '\nexpDate: ' +
        expDate +
        '\ncvc: ' +
        cvc;

    return message;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String selected = "first";
  List<CardInfo> myList = [];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 70, right: 40, left: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Text(
                'Checkout',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins'),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            Container(
              child: const Text(
                'Select your payment method',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 'first';
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 99,
                          height: 75,
                          decoration: BoxDecoration(
                            color: selected == 'first'
                                ? const Color.fromARGB(255, 83, 224, 255)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 1.5,
                              color: const Color.fromARGB(255, 83, 224, 255),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            width: 55,
                            height: 5.0,
                            child: Image.asset(
                              'assets/images/AppleLogo.png',
                              // width: 54,
                              // height: 22,
                              // fit: BoxFit.fill,
                              color: selected == 'first'
                                  ? Colors.white
                                  : const Color.fromARGB(255, 83, 224, 255),
                            ),
                          )),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        'Apple Pay',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 163, 255)),
                      ),
                    ],
                  )),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 'second';
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 99,
                          height: 75,
                          decoration: BoxDecoration(
                            color: selected == 'second'
                                ? const Color.fromARGB(255, 83, 224, 255)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 1.5,
                              color: const Color.fromARGB(255, 83, 224, 255),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Image.asset(
                              'assets/images/cardcard.png',
                              width: 54,
                              height: 22.5,
                              color: selected == 'second'
                                  ? Colors.white
                                  : const Color.fromARGB(255, 83, 224, 255),
                            ),
                          )),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        'Credit Card',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 163, 255)),
                      ),
                    ],
                  )),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 'third';
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 99,
                          height: 75,
                          decoration: BoxDecoration(
                            color: selected == 'third'
                                ? const Color.fromARGB(255, 83, 224, 255)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 1.5,
                              color: const Color.fromARGB(255, 83, 224, 255),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Image.asset(
                              'assets/images/PayPalPay.png',
                              width: 54,
                              height: 22.5,
                              color: selected == 'third'
                                  ? Colors.white
                                  : const Color.fromARGB(255, 83, 224, 255),
                            ),
                          )),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        'PayPal',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 163, 255)),
                      ),
                    ],
                  )),
            ]),
            const SizedBox(
              height: 57,
            ),
            Container(
              child: const Text(
                'Select your card',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myList.isEmpty
                    ? Column(
                        children: [
                          Container(
                            child: Image.asset(
                              'assets/images/Icon.png',
                              width: 99,
                              height: 96,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: const Text(
                              'You do not have a credit card on file.',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        // height: 100,
                        child: ListView.builder(
                            itemCount: myList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, position) {
                              return InkWell(
                                  borderRadius: BorderRadius.circular(15),
                                  onTap: () =>
                                      setState(() => selectedIndex = position),
                                  child: Card(
                                      color: (selectedIndex == position)
                                          ? const Color.fromARGB(
                                              255, 107, 179, 228)
                                          : Colors.white,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 2, bottom: 2, left: 30)),
                                          Text(myList[position].cardNumber),
                                          Text(myList[position].expDate)
                                        ],
                                      )));
                            }),
                      ),
              ],
            )),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 83, 224, 255),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () {
                  _awaitReturnValueFromSecondScreen(context);
                },
                child: const Text(
                  'Add a new card',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: const Text(
                    'Total amount',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  child: const Text(
                    '\$29.90',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: GestureDetector(
                onTap: () => {
                  if (selectedIndex != -1)
                    {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Success!'),
                          content: const Text('The payment was registered'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                    }
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 83, 224, 255),
                    ),
                    alignment: Alignment.center,
                    width: 264,
                    height: 50,
                    child: const Text(
                      'Pay now',
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
    );
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    CardInfo result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SecondScreen(
            title: "gg",
          ),
        ));
    if (result.isPrimary) {
      selectedIndex = myList.length;
      for (var i = 0; i < myList.length; i++) {
        if (myList[i].isPrimary) {
          myList[i].isPrimary = false;
        }
      }
    }
    setState(() {
      myList.add(result);
    });
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

enum CardType { MasterCard, Visa, Verve, Others, Invalid }

class Strings {
  static const String appName = 'Payment Card Demo';
  static const String fieldReq = 'This field is required';
  static const String numberIsInvalid = 'Card is invalid';
  static const String pay = 'Validate';
}

class CardUtils {
  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static String? validateCardNum(String? input) {
    if (input == null || input.isEmpty) {
      return Strings.fieldReq;
    }

    input = getCleanedNumber(input);

    if (input.length < 8) {
      return Strings.numberIsInvalid;
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      int digit = int.parse(input[length - i - 1]);

      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return Strings.numberIsInvalid;
  }

  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.MasterCard;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = CardType.Visa;
    } else if (input.startsWith(RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
      cardType = CardType.Verve;
    } else if (input.length <= 8) {
      cardType = CardType.Others;
    } else {
      cardType = CardType.Invalid;
    }
    return cardType;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.fieldReq;
    }

    int year;
    int month;

    if (value.contains(RegExp(r'(\/)'))) {
      var split = value.split(RegExp(r'(\/)'));
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      month = int.parse(value.substring(0, (value.length)));
      year = -1;
    }

    if ((month < 1) || (month > 12)) {
      return 'Expiry month is invalid';
    }

    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      return 'Expiry year is invalid';
    }

    if (!hasDateExpired(month, year)) {
      return "Card has expired";
    }

    return 'null';
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name empty';
    }

    RegExp nameRegExp = RegExp(r"^[A-Za-z ,.'-]+$");
    if (nameRegExp.hasMatch(value)) {
      return 'null';
    }
    return 'Name invalid';
  }

  static String? validateCVC(String? value) {
    if (value == null || value.isEmpty) {
      return 'CVC empty';
    }

    RegExp cvcRegExp = RegExp(r"^[0-9]{3}$");
    if (cvcRegExp.hasMatch(value)) {
      return 'null';
    }
    return 'CVC invalid';
  }

  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return !(month == null || year == null) && isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    return fourDigitsYear < now.year;
  }
}

class _SecondScreenState extends State<SecondScreen> {
  bool? value = false;
  TextEditingController cardholderNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvcController = TextEditingController();

  String creditCardNumber = '';
  late IconData brandIcon;
  var _paymentCard = CardInfo();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  Container(
                    child: const Text(
                      'New card',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  Center(
                    child: Container(
                      child: Image.asset(
                        'assets/images/Card.png',
                        width: 253,
                        height: 162,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: const Text(
                      'Cardholder name',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 11,
                  // ),
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
                  Container(
                    child: const Text(
                      'Card number',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 12,
                  // ),
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
                          Container(
                            child: const Text(
                              'Exp date',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
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
                          Container(
                            child: const Text(
                              'CVC',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
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
                          value: this.value,
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
    bool isValidNumber = regExp.hasMatch(cardNumberController.text);
    final form = _formKey.currentState;
    bool cardTypeBool = _paymentCard.type == CardType.Invalid;
    bool expDateBool =
        CardUtils.validateDate(expDateController.text).toString() == 'null';
    bool cvcBool =
        CardUtils.validateCVC(cvcController.text).toString() == 'null';
    bool nameBool =
        CardUtils.validateName(cardholderNameController.text).toString() ==
            'null';

    if (cardNumberController.text.isNotEmpty &&
        isValidNumber &&
        !cardTypeBool &&
        expDateBool &&
        cvcBool &&
        nameBool) {
      print('Form is valid');
      return true;
    } else {
      print('Form is invalid');
      print(nameBool);
      print(cvcBool);
      print(expDateBool);
      print(isValidNumber);
      return false;
    }
  }

  static Widget getCardIcon(CardType cardType) {
    String img = "";
    late Icon icon;
    switch (cardType) {
      case CardType.MasterCard:
        img = 'mastercard.png';
        break;
      case CardType.Visa:
        img = 'visa.png';
        break;
      case CardType.Verve:
        img = 'verve.png';
        break;
      case CardType.Others:
        icon = Icon(
          Icons.credit_card,
          size: 40.0,
          color: Colors.grey[600],
        );
        break;
      case CardType.Invalid:
        icon = Icon(
          Icons.warning,
          size: 40.0,
          color: Colors.grey[600],
        );
        break;
    }

    Widget widget;
    if (img.isNotEmpty) {
      widget = Image.asset(
        'assets/images/$img',
        width: 40.0,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  void _sendDataBack(BuildContext context) {
    CardInfo card = CardInfo();
    card.setCardInfo(
        _paymentCard.type,
        cardholderNameController.text,
        cardNumberController.text,
        expDateController.text,
        cvcController.text,
        this.value);

    Navigator.pop(context, card);
  }
}
