part of 'real_estate_detail_cubit.dart';

abstract class RealEstateDetailState {}

class RealEstateDetailInitial extends RealEstateDetailState {}

class RealEstateDetailLoading extends RealEstateDetailState {}

class RealEstateDetailSuccess extends RealEstateDetailState {
  final data;

  RealEstateDetailSuccess(this.data);
}

class RealEstateDetailFailure extends RealEstateDetailState {
  final message;

  RealEstateDetailFailure(this.message);
}

class CheckBoxState {
  List<Map> checkBoxes;

  CheckBoxState({
    required this.checkBoxes,
  });

  CheckBoxState copyWith({
    final List<Map>? checkBoxes,
  }) {
    return CheckBoxState(
      checkBoxes: checkBoxes ?? this.checkBoxes,
    );
  }
}
