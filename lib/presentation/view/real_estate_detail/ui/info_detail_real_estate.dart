import 'package:flutter/material.dart';
import 'package:pindias_app/presentation/view/real_estate_detail/component/common_item1.dart';
import 'package:pindias_app/presentation/view/real_estate_detail/component/common_item2.dart';
import 'package:pindias_app/presentation/view/real_estate_detail/component/common_item3.dart';

class InfoDetailRealEstate extends StatelessWidget {
  const InfoDetailRealEstate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '#246 CĂN HỘ CAO CẤP KING PALACE',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Container(
              height: 24,
              width: 73,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xffD0B1D4)),
              child: const Center(
                child: Text(
                  'Chung cư',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff6670374),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const CommonItem1(
              image: 'assets/ic_back.png',
              tittle: '12468',
              sizeWidth: 8,
              styleFontsize: 12,
              fontWeight: FontWeight.w600,
              styleColor: Color(0xff670374),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          '12 Đường Nguyễn Trãi, Phường Thượng Đình, Quận Thanh Xuân, Thành phố Hà Nội',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff6B6B6B)),
        ),
        const SizedBox(
          height: 8,
        ),
        CommonItem1(
          onTap: () {},
          image: 'assets/ic_back.png',
          tittle: 'Xem trên bản đồ',
          sizeWidth: 8,
          styleFontsize: 12,
          fontWeight: FontWeight.w600,
          styleColor: const Color(0xff670374),
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(
          height: 1,
          color: Color(0xffE8E8E8),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: CommonItem1(
                onTap: () {},
                image: 'assets/ic_back.png',
                tittle: '3 phòng ngủ',
                sizeWidth: 8,
                styleFontsize: 12,
                fontWeight: FontWeight.w600,
                styleColor: const Color(0xff6B6B6B),
              ),
            ),
            Expanded(
              child: CommonItem1(
                onTap: () {},
                image: 'assets/ic_back.png',
                tittle: '83m2',
                sizeWidth: 8,
                styleFontsize: 12,
                fontWeight: FontWeight.w600,
                styleColor: const Color(0xff6B6B6B),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: CommonItem1(
                onTap: () {},
                image: 'assets/ic_back.png',
                tittle: '2 ve sinh',
                sizeWidth: 8,
                styleFontsize: 12,
                fontWeight: FontWeight.w600,
                styleColor: const Color(0xff6B6B6B),
              ),
            ),
            Expanded(
              child: CommonItem1(
                onTap: () {},
                image: 'assets/ic_back.png',
                tittle: 'hướng Tây',
                sizeWidth: 8,
                styleFontsize: 12,
                fontWeight: FontWeight.w600,
                styleColor: const Color(0xff6B6B6B),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(
          height: 1,
          color: Color(0xffE8E8E8),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Tổng quan',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'Chung cư King Palace nằm cạnh Royal City mới xây đẹp nhất khu vực. Chung cư có 5 tầng trung tâm thương mại, bể bơi, 3 hầm để xe rộng rãi. Căn 3 ngủ đẹp nhất dự án chỉ 4,7 tỷ. Căn 3 ngủ đẹp nhất dự án chỉ 4,7 tỷ. Căn 3 ngủ đẹp nhất dự án chỉ 4,7 tỷ. Căn 3 ngủ đẹp nhất dự án chỉ 4,7 tỷ',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff686868)),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Chi tiết bất động sản',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
        const SizedBox(
          height: 8,
        ),
        const CommonItem2(
          title: 'Phòng ngủ:',
          value: '7',
        ),
        const CommonItem2(
          title: 'Chiều dài:',
          value: '12m',
        ),
        const CommonItem2(
          title: 'Diện tích đất:',
          value: '120m2',
        ),
        const CommonItem2(
          title: 'Hướng:',
          value: 'Đông Nam',
        ),
        const CommonItem2(
          title: 'Hiện trạng nhà:',
          value: 'Mới',
        ),
        const CommonItem2(
          title: 'Phòng tắm:',
          value: '3',
        ),
        const CommonItem2(
          title: 'Chiều rộng:',
          value: '10m',
        ),
        const CommonItem2(
          title: 'Diện tích sử dụng:',
          value: '100m2',
        ),
        const CommonItem2(
          title: 'Mặt tiền:',
          value: '10m',
        ),
        const CommonItem2(
          title: 'Giấy tờ:',
          value: 'Sổ đỏ',
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Tiện ích xung quanh',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: const [
            Expanded(
              flex: 3,
              child: CommonItem3(
                tittle: "Quảng trường",
                image: 'assets/im_square.png',
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 3,
              child: CommonItem3(
                tittle: "Quảng trường",
                image: 'assets/im_square.png',
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 3,
              child: CommonItem3(
                tittle: "Quảng trường",
                image: 'assets/im_square.png',
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
