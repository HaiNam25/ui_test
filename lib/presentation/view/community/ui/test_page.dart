import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pindias_app/presentation/view/community/bloc/community_cubit.dart';
import 'package:pindias_app/shared/app_images.dart';


class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('aaaaaaaaaaaaaaaaaa'),
        ),
        body: BlocProvider(
          create: (context) => CommunityCubit(),
          child: BlocBuilder<CommunityCubit, CommunityState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      const Image(
                        image: AssetImage(AppImages.building),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.black.withOpacity(0.6),
                                child: const Image(
                                    image: AssetImage(AppImages.vr)),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.black.withOpacity(0.6),
                                child: const Image(
                                    image: AssetImage(AppImages.vr)),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.black.withOpacity(0.6),
                                child: const Image(
                                    image: AssetImage(AppImages.vr)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Image(
                          image: AssetImage(AppImages.building),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                width: 4,
                                height: 50,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment(0.5, 1),
                                    colors: <Color>[
                                      Color(0xff8E0088),
                                      Color(0xff6B0D89),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Expanded(
                              child: Text(
                                'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text('Toa nha  khach san TM MCT'),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Bất động sản cho bạn'),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment(0.5, 1),
                                    colors: <Color>[
                                      Color(0xff8E0088),
                                      Color(0xff6B0D89),
                                    ],
                                  ),
                                ),
                                child: const SizedBox(
                                  width: 83,
                                  height: 32,
                                  child: Center(
                                    child: Text(
                                      'Mua ban',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment(0.5, 1),
                                    colors: <Color>[
                                      Color(0xff8E0088),
                                      Color(0xff6B0D89),
                                    ],
                                  ),
                                ),
                                child: const SizedBox(
                                  width: 83,
                                  height: 32,
                                  child: Center(
                                    child: Text(
                                      'Cho thue',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text('Tất cả')
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        )
    );
  }
}
