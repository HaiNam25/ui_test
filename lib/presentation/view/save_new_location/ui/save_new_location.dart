import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pindias_app/presentation/view/save_new_location/bloc/save_new_location_cubit.dart';
import 'package:pindias_app/presentation/view/save_new_location/component/form.dart';
import 'package:image_picker/image_picker.dart';

class SaveNewLocation extends StatefulWidget {
  const SaveNewLocation({Key? key}) : super(key: key);

  @override
  State<SaveNewLocation> createState() => _SaveNewLocationState();
}

class _SaveNewLocationState extends State<SaveNewLocation> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
        actions: [
          IconButton(
            onPressed: () {
              showFlexibleBottomSheet(
                context: context,
                builder: _buildBottomSheet,
                initHeight: 0.75,
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              selectImages();
            },
            child: const Text('Test lấy ảnh'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: imageFileList!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return Image.file(File(imageFileList![index].path),
                        fit: BoxFit.cover);
                  }),
            ),
          )
        ],
      ),
    );
  }

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    if(selectedImages.length>12){
      imageFileList!.remove(imageFileList!.last);
    }
    setState(() {});
  }
}

Widget _buildBottomSheet(
  BuildContext context,
  ScrollController scrollController,
  double bottomSheetOffset,
) {
  final SaveNewLocationCubit saveNewLocationCubit = SaveNewLocationCubit();
  return Material(
    child: BlocProvider(
      create: (context) => saveNewLocationCubit,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Lưu địa điểm mới',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              height: 1,
              color: Color(0xffE8E8E8),
            ),
            BlocBuilder<SaveNewLocationCubit, SaveNewLocationState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 10, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      CommonFormSave(
                        tittle: 'Tiêu đề',
                        hint: 'Nhập tiêu đề...',
                        control: saveNewLocationCubit.tittle,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CommonFormSave(
                        tittle: 'Mô tả',
                        hint: 'Nhập mô tả...',
                        maxline: 3,
                        control: saveNewLocationCubit.description,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CommonFormSave(
                        tittle: 'Thành phố/Tỉnh',
                        hint: 'Nhập tỉnh / thành phô',
                        control: saveNewLocationCubit.description,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CommonFormSave(
                        tittle: 'Quận/Huyện',
                        hint: 'Nhập quận / huyện',
                        control: saveNewLocationCubit.description,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CommonFormSave(
                        tittle: 'Phường/Xã',
                        hint: 'Nhập phường/ xã',
                        control: saveNewLocationCubit.description,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Ảnh',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: const Color(0xff6B0D89),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image: AssetImage('assets/im_gallery.png'),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Tải ảnh lên',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff670374),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Tối đa 12 ảnh',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
