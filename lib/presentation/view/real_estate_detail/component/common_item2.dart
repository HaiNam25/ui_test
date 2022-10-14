import 'package:flutter/material.dart';

class CommonItem2 extends StatelessWidget {
  final String? title;
  final String? value;

  const CommonItem2({Key? key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff6B6B6B),
                ),
              ),
            ),
            Expanded(
              child: Text(
                value ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 2,)
      ],
    );
  }
}
