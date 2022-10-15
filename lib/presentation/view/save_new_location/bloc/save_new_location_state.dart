part of 'save_new_location_cubit.dart';

@immutable
abstract class SaveNewLocationState {}

class SaveNewLocationInitial extends SaveNewLocationState {}

class SaveNewLocationLoading extends SaveNewLocationState {}

class SaveNewLocationSuccess extends SaveNewLocationState {
  final data;

  SaveNewLocationSuccess(this.data);
}

class SaveNewLocationFailure extends SaveNewLocationState {
  final message;

  SaveNewLocationFailure(this.message);
}

