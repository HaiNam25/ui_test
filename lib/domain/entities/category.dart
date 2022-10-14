import 'package:pindias_app/domain/entities/base_object.dart';
import 'package:pindias_app/domain/entities/pageable.dart';
import 'package:pindias_app/domain/entities/real_estate_type.dart';
import 'package:pindias_app/domain/entities/sort.dart';

import 'real_estate.dart';
import 'entities_config.dart';

class Category<T extends BaseContent> {
  final List<T>? content;
  dynamic pageable;
  final int? totalElements;
  final bool? last;
  final int? totalPages;
  final bool? first;
  final Sort? sort;
  final int? size;
  final int? number;
  final int? numberOfElements;
  final bool? empty;

  Category(
      {this.content,
      dynamic pageable,
      this.totalElements,
      this.last,
      this.totalPages,
      this.first,
      this.sort,
      this.size,
      this.number,
      this.numberOfElements,
      this.empty}) {
    pageable = pageable;
  }

  bool get isContent => T == TypeElementContent.realEstate;
  bool get isRealEstateType => T == TypeElementContent.realEstateType;

  factory Category.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonContent = json['content'] ?? [];
    List<T> contents = [];

    switch (T) {
      case TypeElementContent.realEstate:
        contents = (jsonContent.map((e) => RealEstate.fromJson(e as Map<String, dynamic>))
            .toList()) as List<T>;
        break;
      case TypeElementContent.realEstateType:

        contents = (jsonContent.map((e) => RealEstateType.fromJson(e as Map<String, dynamic>))
            .toList()) as List<T>;
        break;
    }

    Category<T> category = Category(
      content: contents,
      pageable: json['pageable'],
      totalElements: json['totalElements'] as int?,
      last: json['last'] as bool?,
      totalPages: json['totalPages'] as int?,
      first: json['first'] as bool?,
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      size: json['size'] as int?,
      number: json['number'] as int?,
      numberOfElements: json['numberOfElements'] as int?,
      empty: json['empty'] as bool?,
    );

    final String typePageable = json['pageable'].runtimeType.toString();
    if (typePageable == '_InternalLinkedHashMap<String, dynamic>') {
      category.pageable =
          Pageable.fromJson(json['pageable'] as Map<String, dynamic>);
    }
    else {
      category.pageable = json['pageable'].toString();
    }
    return category;
  }

  int get getTotalPages => totalPages ?? 0;
  bool get isPageableObject => pageable.runtimeType.toString() == 'Pageable';

  Map<String, dynamic> toJson() {
    return {
      'pageable': pageable.runtimeType == String ? pageable : pageable.toJson(),
      'totalElements': totalElements,
      'last': last,
      'totalPages': totalPages,
      'first': first,
      'sort': sort?.toJson(),
      'size': size,
      'number': number,
      'numberOfElements': numberOfElements,
      'empty': empty,
      'content': content?.map((e) => e.toJson()),
    };
  }

}
