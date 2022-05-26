import 'package:roadfix_test/my_strings.dart';
import 'package:flutter/material.dart';

class CardInfo {
  CardType type = CardType.others;
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

enum CardType { masterCard, visa, verve, others, invalid }

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
      cardType = CardType.masterCard;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = CardType.visa;
    } else if (input.startsWith(RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
      cardType = CardType.verve;
    } else if (input.length <= 8) {
      cardType = CardType.others;
    } else {
      cardType = CardType.invalid;
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

    if (!isNotExpired(year, month)) {
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

Widget getCardIcon(CardType cardType) {
  String img = "";
  late Icon icon;
  switch (cardType) {
    case CardType.masterCard:
      img = 'mastercard.png';
      break;
    case CardType.visa:
      img = 'visa.png';
      break;
    case CardType.verve:
      img = 'verve.png';
      break;
    case CardType.others:
      icon = Icon(
        Icons.credit_card,
        size: 40.0,
        color: Colors.grey[600],
      );
      break;
    case CardType.invalid:
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
