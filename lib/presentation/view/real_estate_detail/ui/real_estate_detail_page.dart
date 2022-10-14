import 'package:flutter/material.dart';
import 'image_slide.dart';
import 'info_detail_real_estate.dart';
import 'map_real_estate.dart';

class RealStateDetailPage extends StatelessWidget {
  const RealStateDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          )
      ),
      body: Column(
        children: [
          Container(
            height:AppBar().preferredSize.height,
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
                      'Chi tiet bai dang',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Image(image: AssetImage('assets/ic_saved.png'),
                        width: 24,
                        height: 24,),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Image(image: AssetImage('assets/ic_share.png'),
                        width: 24,
                        height: 24,),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ImageSlide(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 16, right: 16  ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const InfoDetailRealEstate(),
                        const SizedBox(
                          height: 26,
                        ),
                        const MapRealEstate(),
                        const Text(
                          'Bất động sản liên quan',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Column(
                                        children: [
                                          Image.network(
                                            'https://media.cntraveler.com/photos/5fc6818f3cfe1de2cab79372/master/w_2580%2Cc_limit/Amsterdam-GettyImages-840603854.jpg',
                                            fit: BoxFit.fill,
                                          ),
                                          const SizedBox(height: 8,),
                                          const Text(
                                            'Chính chủ cần bán căn chung cư cao cấp Dolphin abc def ght ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color: Color(0xff6B6B6b)
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      )
                                    ),
                                  ],
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: const Color(0xffF0E6F1),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Text(
                        '6.5 Tỷ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff424242)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '100 triệu/m²',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Color(0xff525252)),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 14, right: 16, left: 16, bottom: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Color(0xff6B0D89),
                            Color(0xff8E0088)
                          ],
                          tileMode: TileMode.mirror,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                            image: AssetImage('assets/im_call_calling.png'),
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Liên hệ người bán',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
