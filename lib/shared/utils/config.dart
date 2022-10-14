class CategoryStatus {
  static const String opening = 'OPENING';
}

class RealEstateStatus {
  static const String active = 'ACTIVE';
  static const String deleted = 'DELETED';
}

class TypeEstate {
  static const String realEstate = 'REAL_ESTATE';
  static const String project = 'PROJECT';
  static const String sourceCrawl = 'SOURCE_CRAWL';
  static const String community = 'COMMUNITY';
  static const String news = 'NEWS';
}

class Purpose {
  static const String rent = 'RENT';
  static const String project = 'PROJECT';
  static const String sell = 'SELL';
  static const List<String> listPurpose = [
    rent,
    project,
    sell,
  ];
}

class BottomLimitedArea {
  static const String thirty = '30';
  static const String fifty = '50';
  static const String seventy = '70';
  static const String oneHundred = '100';
  static const String oneHundredFifty = '150';
  static const String threeHundred = '300';
  static const String fiveHundred = '500';
  static const String nineNineNineNine = '9999';

  static const String squareDecimetre = 'm2';

  static const Map<String, String> rangeArea = {
    '$thirty - $fifty $squareDecimetre': '$thirty-$fifty',
    '$fifty - $seventy $squareDecimetre': '$fifty-$seventy',
    '$seventy - $oneHundred $squareDecimetre': '$seventy-$oneHundred',
    '$oneHundred - $oneHundredFifty $squareDecimetre':
        '$oneHundred-$oneHundredFifty',
    '$oneHundredFifty - $threeHundred $squareDecimetre':
        '$oneHundredFifty-$threeHundred',
    '$threeHundred - $fiveHundred $squareDecimetre':
        '$threeHundred-$fiveHundred',
    '$fiveHundred - $nineNineNineNine': '$fiveHundred-$nineNineNineNine',
  };
}

class BottomLimitedPrice {
  static const String agree = '0,0';
  static const String one = '1';
  static const String two = '2';
  static const String three = '3';
  static const String five = '5';
  static const String seven = '7';
  static const String ten = '10';
  static const String twenty = '20';
  static const String thirty = '30';
  static const String fifty = '50';
  static const String oneHundred = '100';
  static const String twoHundred = '200';

  static const String unitPrice = '000000000';
  static const String currency = 'tỷ';

  static const Map<String, String> rangePrice = {
    'Thỏa thuận': '$agree',
    '$one - $two $currency': '$one$unitPrice-$two$unitPrice',
    '$two - $three $currency': '$two$unitPrice-$three$unitPrice',
    '$three - $five $currency': '$three$unitPrice-$five$unitPrice',
    '$five - $seven $currency': '$five$unitPrice-$seven$unitPrice',
    '$seven - $ten $currency': '$seven$unitPrice-$ten$unitPrice',
    '$ten - $twenty $currency': '$ten$unitPrice-$twenty$unitPrice',
    '$twenty - $thirty $currency': '$twenty$unitPrice-$thirty$unitPrice',
    '$thirty - $fifty $currency': '$thirty$unitPrice-$fifty$unitPrice',
    '$fifty - $oneHundred $currency': '$fifty$unitPrice-$oneHundred$unitPrice',
    '$oneHundred - $twoHundred $currency':
        '$twoHundred$unitPrice-$twoHundred$unitPrice',
  };
}

class NumOfRoom {
  static const String one = '1';
  static const String two = '2';
  static const String three = '3';
  static const String four = '4';
  static const String five = '5';
  static const String six = '6';
  static const String room = 'Phòng';

  static const Map<String, String> numOfRoom = {
    '$one $room': '$one-$one',
    '$two $room': '$two-$two',
    '$three $room': '$three-$three',
    '$four $room': '$four-$four',
    '$five $room': '$five-$five',
    '>= $six $room': '$six-99',
  };
}

class Direction {
  static const String east = 'EAST';
  static const String west = 'WEST';
  static const String south = 'SOUTH';
  static const String north = 'NORTH';
  static const String northEast = 'NORTHEAST';
  static const String southEast = 'SOUTHEAST';
  static const String northWest = 'NORTHWEST';
  static const String southWest = 'SOUTHWEST';

  static const String unitDirection = 'Hướng';
  static const Map<String, String> direction = {
    '$unitDirection Đông': '$east',
    '$unitDirection Tây': '$west',
    '$unitDirection Nam': '$south',
    '$unitDirection Bắc': '$north',
    '$unitDirection Đông Bắc': '$northEast',
    '$unitDirection Đông Nam': '$southEast',
    '$unitDirection Tây Bắc': '$northWest',
    '$unitDirection Tây Nam': '$southWest',
  };
}

class TypeOfAdvanced {
  static const String bathRoom = 'baths';
  static const String bedRoom = 'beds';
  static const String direction = 'direction';

  static const Map<String, String> typeOfAdvanced = {
    'Số phòng tắm': '$bathRoom',
    'Số phòng ngủ': '$bedRoom',
    'Hướng': '$direction',
  };
}
