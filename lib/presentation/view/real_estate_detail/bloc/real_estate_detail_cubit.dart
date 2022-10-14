import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'real_estate_detail_state.dart';

class RealEstateDetailCubit extends Cubit<RealEstateDetailState> {
  RealEstateDetailCubit() : super(RealEstateDetailInitial());
}

class CheckBoxCubit extends Cubit<CheckBoxState> {
  CheckBoxCubit()
      : super(CheckBoxState(
    checkBoxes: [
      {
        "name": "Trường học",
        "isChecked": false,
      },
      {
        "name": "Siêu thị",
        "isChecked": false,
      },{
        "name": "Công viên",
        "isChecked": false,
      },{
        "name": "Y tế",
        "isChecked": false,
      },{
        "name": "Ngân hàng",
        "isChecked": false,
      },{
        "name": "Chung cư",
        "isChecked": false,
      },
    ],
  ));

  void toggleNotification(int index, bool? newValue) => emit(
    state.copyWith(
      checkBoxes: List.from(state.checkBoxes)..[index]['isChecked'] = newValue,
    ),
  );
}
