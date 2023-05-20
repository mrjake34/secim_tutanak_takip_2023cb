import 'package:flutter/material.dart';

import '../../constants/colors/constant_colors.dart';
import '../../constants/sizes/sizes.dart';

class MainOutlineButton extends StatelessWidget {
  final Function() buttonFunction;
  final Widget textWidget;
  const MainOutlineButton(
      {super.key, required this.buttonFunction, required this.textWidget});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            foregroundColor: mainColor,
            side: const BorderSide(color: mainColor),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius))),
        onPressed: buttonFunction,
        child: textWidget);
  }
}
