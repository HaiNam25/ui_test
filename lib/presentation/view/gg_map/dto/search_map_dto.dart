
import 'package:pindias_app/shared/utils/api_config.dart';
import 'package:pindias_app/shared/utils/config.dart';

class SearchMapDto {
  List<String>? _categories; // Loại BĐS. Ref: TypeEstate
  String? _status; // default is ACTIVE. Ref: RealEstateStatus
  String? _page;
  String? _size;
  String? _purpose; // Ref: Purpose
  String? _province;
  List<String>? _districts;
  List<String>? _areaRange; // Ref: BottomLimitedArea
  List<String>? _priceRange; // Ref: BottomLimitedPrice
  List<String>? _bathrooms; // Ref: NumOfRoom
  List<String>? _bedrooms; // Ref: NumOfRoom
  List<String>? _directions; // Ref: Direction

  SearchMapDto({
    List<String>? categories,
    String? status = CategoryStatus.opening,
    String? page = ApiConfig.pageDefaultFirst,
    String? size = ApiConfig.maxSize,
    String? purpose,
    String? province,
    List<String>? districts,
    List<String>? areaRange,
    List<String>? priceRange,
    List<String>? bathrooms,
    List<String>? bedrooms,
    List<String>? directions,
  }) {
    _categories = categories;
    _status = status;
    _page = page;
    _size = size;
    _purpose = purpose;
    _province = province;
    _districts = districts;
    _areaRange = areaRange;
    _priceRange = priceRange;
    _bathrooms = bathrooms;
    _bedrooms = bedrooms;
    _directions = directions;
  }

  void changeValue({
    List<String>? categories,
    String? status,
    String? page,
    String? size,
    String? purpose,
    String? province,
    List<String>? districts,
    List<String>? areaRange,
    List<String>? priceRange,
    List<String>? bathrooms,
    List<String>? bedrooms,
    List<String>? directions,
  }) {
    _categories = categories ?? _categories;
    _status = status ?? _status;
    _page = page ?? _page;
    _size = size ?? _size;
    _purpose = purpose ?? _purpose;
    _province = province ?? _province;
    _districts = districts ?? _districts;
    _areaRange = areaRange ?? _areaRange;
    _priceRange = priceRange ?? _priceRange;
    _bathrooms = bathrooms ?? _bathrooms;
    _bedrooms = bedrooms ?? _bedrooms;
    _directions = directions ?? _directions;
  }

  String get pathCategory {
    if (_categories == null || _categories!.isEmpty) return '';
    String pathCategories = '&category=';
    pathCategories += _categories!.join(',');
    return pathCategories;
  }

  String get pathStatus => _status != null ? '&status=$_status' : '';

  String get pathPage => _page != null ? '&page=$_page' : '';

  String get pathSize => _size != null ? '&size=$_size' : '';

  String get pathPurpose => _purpose != null ? '&purpose=$_purpose' : '';

  String get pathProvince => _province != null ? '&province=$_province' : '';

  String get pathDistricts {
    if (_districts == null || _districts!.isEmpty) return '';
    String pathDistricts = '&district=';
    pathDistricts += _districts!.join(',');
    return pathDistricts;
  }

  String get pathArea {
    if (_areaRange == null || _areaRange!.isEmpty) return '';
    String pathArea = '&area=';
    pathArea += _areaRange!.join(',');
    return pathArea;
  }

  String get pathPrice {
    if (_priceRange == null || _priceRange!.isEmpty) return '';
    String pathArea = '&price=';
    pathArea += _priceRange!.join(',');
    return pathArea;
  }

  String get pathBathrooms {
    if (_bathrooms == null || _bathrooms!.isEmpty) return '';
    String pathBathrooms = '&baths=';
    pathBathrooms += _bathrooms!.join(',');
    return pathBathrooms;
  }

  String get pathBedrooms {
    if (_bedrooms == null || _bedrooms!.isEmpty) return '';
    String pathBedroom = '&beds=';
    pathBedroom += _bedrooms!.join(',');
    return pathBedroom;
  }

  String get pathDirections {
    if (_directions == null || _directions!.isEmpty) return '';
    String pathDirection = '&direction=';
    pathDirection += _directions!.join(',');
    return pathDirection;
  }

  String get searchUri {
    String uri = ''
        '$pathPurpose'
        '$pathCategory'
        '$pathProvince'
        '$pathDistricts'
        '$pathArea'
        '$pathPrice'
        '$pathBathrooms'
        '$pathBedrooms'
        '$pathDirections'
        '$pathStatus'
        '$pathPage'
        '$pathSize';
    if (uri.isEmpty) return '';
    return uri.replaceRange(0, 1, '');
  }
}
