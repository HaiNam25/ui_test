import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'save_new_location_state.dart';

class SaveNewLocationCubit extends Cubit<SaveNewLocationState> {
  final List datas =[];
  final List imagess=[];
  TextEditingController tittle = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController conscious = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController ward = TextEditingController();
  Image? image;
  SaveNewLocationCubit() : super(SaveNewLocationInitial());
}
