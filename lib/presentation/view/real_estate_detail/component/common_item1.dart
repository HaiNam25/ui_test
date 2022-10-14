import 'package:flutter/material.dart';

class CommonItem1 extends StatelessWidget {
  final String? image;
  final String? tittle;
  final double? sizeWidth;
  final GestureTapCallback? onTap;
  final double? textFontsize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? imageWidth;
  final double? imageHeight;

  const CommonItem1(
      {Key? key,
      this.image,
      this.tittle,
      this.onTap,
      this.sizeWidth,
      this.textFontsize,
      this.textColor,
      this.fontWeight,
      this.imageWidth,
      this.imageHeight,
      })
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
            height: imageHeight??24,
            width: imageWidth??24,
          ),
        ),
        SizedBox(
          width: sizeWidth ?? 0,
        ),
        Text(
          tittle ?? '',
          style: TextStyle(
              fontSize: textFontsize,
              fontWeight: fontWeight,
              color: textColor ?? Colors.red,
          ),
        ),
      ],
    );
  }
}
