import 'package:flutter/material.dart';

class CommonFormSave extends StatelessWidget {
  final String? tittle;
  final String? hint;
  final TextEditingController? control;
  final int? maxline;
  const CommonFormSave({Key? key, this.tittle, this.maxline, this.hint,required this.control}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tittle??'',
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black
          ),
        ),
        const SizedBox(height: 4,),
        TextFormField(
          controller: control,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: hint??'',
          ),
          maxLines:maxline??1 ,
        )
      ],
    );
  }
}