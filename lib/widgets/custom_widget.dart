import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final bool isCheck;
  final void Function(bool?)? onChanged;
  const CustomBox({Key? key,required this.isCheck,required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Checkbox(
        value: isCheck,
        onChanged: onChanged);
  }
}
