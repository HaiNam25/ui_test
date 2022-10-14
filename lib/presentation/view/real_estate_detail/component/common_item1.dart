import 'package:flutter/material.dart';

class CommonItem1 extends StatelessWidget {
  final String? image;
  final String? tittle;
  final double? sizeWidth;
  final GestureTapCallback? onTap;
  final double? styleFontsize;
  final Color? styleColor;
  final FontWeight? fontWeight;

  const CommonItem1(
      {Key? key,
      this.image,
      this.tittle,
      this.onTap,
      this.sizeWidth,
      this.styleFontsize,
      this.styleColor,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Image(
            image: AssetImage(
              image ?? '',
            ),
          ),
        ),
        SizedBox(
          width: sizeWidth ?? 0,
        ),
        Text(
          tittle ?? '',
          style: TextStyle(
              fontSize: styleFontsize,
              fontWeight: fontWeight,
              color: styleColor ?? Colors.red,
          ),
        ),
      ],
    );
  }
}
