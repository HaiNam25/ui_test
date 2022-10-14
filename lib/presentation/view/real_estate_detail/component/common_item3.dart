import 'package:flutter/material.dart';

class CommonItem3 extends StatelessWidget {
  final String? image;
  final String? tittle;

  const CommonItem3({Key? key, this.image, this.tittle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 36,
          width: 36,
          child: Image(
            image: AssetImage(image ?? ''),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          tittle ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Color(0xff670374),
          ),
        )
      ],
    );
  }
}
