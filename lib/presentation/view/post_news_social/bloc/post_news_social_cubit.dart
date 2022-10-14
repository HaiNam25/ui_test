import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'post_news_social_state.dart';

class PostNewsSocialCubit extends Cubit<PostNewsSocialState> {
  List datas=[];
  TextEditingController tittle = TextEditingController();
  TextEditingController theme = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController card = TextEditingController();
  PostNewsSocialCubit() : super(PostNewsSocialInitial());

  // addMarker() async {
  //   try {
  //     // final data = await getDataById.(
  //     theme.text,
  //     theme.text,
  //     description.text,
  //     content.text,
  //     card.text,
  //     datas.clear();
  //     // datas.addAll(data);
  //     emit(PostNewsSocialSuccess(data),);
  //     // Fluttertoast.showToast(msg: 'aaaaaaaaaaaaaaaaa');
  //     print('aaaaaaaaaaaaaaaaaaaaaa');
  //   } catch (e) {
  //     // Fluttertoast.showToast(msg: (e as DioError).message);
  //     print('-----------------------------$e');
  //   }
  // }
}
