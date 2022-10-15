import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pindias_app/presentation/view/post_news_social/bloc/post_news_social_cubit.dart';
import 'package:pindias_app/presentation/view/post_news_social/component/form.dart';

class PostNewsSocialPage extends StatelessWidget {
  const PostNewsSocialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostNewsSocialCubit postNewsSocialCubit = PostNewsSocialCubit();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Color(0xff6B0D89), Color(0xff8E0088)],
                tileMode: TileMode.mirror,
              ),
            ),
          ),
      ),
      body: BlocProvider(
        create: (BuildContext context) => postNewsSocialCubit,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: AppBar().preferredSize.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Color(0xff6B0D89), Color(0xff8E0088)],
                    tileMode: TileMode.mirror,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(19),
                          child: InkWell(
                            onTap: () {
                              // Navigator.pop(context);
                            },
                            child: const Image(
                              image: AssetImage('assets/ic_back.png'),
                              width: 18,
                              height: 14,
                            ),
                          ),
                        ),
                        const Text(
                          'Tao moi',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: BlocBuilder<PostNewsSocialCubit, PostNewsSocialState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonForm(
                          tittle: 'Tieu de',
                          hint: 'Nhap tieu de',
                          control: postNewsSocialCubit.tittle,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CommonForm(
                          control: postNewsSocialCubit.theme,
                          tittle: 'Chu de',
                          hint: 'Nhap chu de',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CommonForm(
                          control: postNewsSocialCubit.description,
                          tittle: 'Mo ta',
                          hint: 'Nhap mo ta',
                          maxline: 3,
                        ),const SizedBox(
                          height: 16,
                        ),
                        CommonForm(
                          control: postNewsSocialCubit.content,
                          tittle: 'Noi dung',
                          hint: 'Nhap noji dung',
                          maxline: 3,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text('Anh'),
                        const SizedBox(height: 4,),
                        InkWell(
                          onTap:(){},
                          child: Container(
                            height: 44,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4)
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
