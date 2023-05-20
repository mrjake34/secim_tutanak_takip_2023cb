// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MainTextButton extends StatelessWidget {
  final Function() buttonFunction;
  final Widget buttonWidget;

  const MainTextButton({
    Key? key,
    required this.buttonFunction,
    required this.buttonWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: buttonFunction, child: buttonWidget);
  }
}
