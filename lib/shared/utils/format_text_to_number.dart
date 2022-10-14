class FormatTextToNumber {
  String _decimalPart = '';
  String _realPart = '';

  String _formatTextToMoney(String text) {
    int len = text.length;
    if (len <= 3) {
      return text;
    }

    int cnt = 0;
    String ans = "";
    for (int i = len - 1; i >= 0; i--) {
      ans = text[i] + ans;
      cnt++;
      if (cnt == 3) {
        if (i != 0) {
          ans = " " + ans;
        }
        cnt = 0;
      }
    }
    return ans;
  }

  String getRealPart(String value) {
    String realPart = '';
    String val = value.replaceAll(' ', '');
    int len = val.length;
    int index = 0;
    while (index < len) {
      if (val[index] == '.') {
        break;
      }
      realPart += val[index];
      index++;
    }
    return realPart;
  }

  String getDecimalPart(String value) {
    String val = value.replaceAll(' ', '');
    int len = val.length;

    String decimalPart = '';
    int index = value.indexOf('.');
    index++;
    while (index < len) {
      decimalPart += val[index];
      index++;
    }
    return decimalPart;
  }

  String changeText(String value) {
    String val = value.replaceAll(' ', '');
    int len = val.length;
    if (len <= 3) {
      return val;
    }

    String point = '.';
    int index = -1;
    index = value.indexOf('.');
    String decimalPart = getDecimalPart(value);
    String realPart = getRealPart(value);

    String x = _formatTextToMoney(decimalPart) == "" ? '': _formatTextToMoney(decimalPart);
    String decimal = (index > 0 ? '.' : '') + x;

    print('_formatTextToMoney(realPart): ${_formatTextToMoney(realPart)}');
    _realPart = realPart;
    _decimalPart = decimalPart;

    return _formatTextToMoney(realPart) + decimal;
  }

  static double formatTextToDouble(String formattedNumber) {
    String num = formattedNumber.replaceAll(' ', '');
    return double.parse(num);
  }

  String compactMoney({double? money}) {
    if (money == null) return '0';
    double quotient = -1;
    final String realPart = getRealPart(money.toString());
    if (_isMillions(realPart: realPart)) {
      quotient = money/1000000;
      return '$quotient ${Currency.millions}';
    }
    else if (_isBillion(realPart: realPart)) {
      quotient = money/1000000000;
      return '$quotient ${Currency.billions}';
    }
    return changeText(money.toString());
  }

  bool _isMillions({String? realPart}) {
    if (realPart == null) return false;
    return realPart.length >= 7 && realPart.length <= 9;
  }

  bool _isBillion({String? realPart}) {
    if (realPart == null) return false;
    return realPart.length >= 10 && realPart.length <= 12;
  }
}

class Currency {
  static const String millions = 'triệu';
  static const String billions = 'tỉ';
}