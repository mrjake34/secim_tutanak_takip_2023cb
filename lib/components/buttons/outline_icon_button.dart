import 'package:flutter/material.dart';

import '../../constants/colors/constant_colors.dart';
import '../../constants/sizes/sizes.dart';

class MainOutlineIconButton extends StatelessWidget {
  final Function() buttonFunction;
  final Widget iconWidget;
  final Widget textWidget;
  const MainOutlineIconButton(
      {super.key,
      required this.buttonFunction,
      required this.iconWidget,
      required this.textWidget});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
            foregroundColor: mainColor,
            side: const BorderSide(color: mainColor),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius))),
        onPressed: buttonFunction,
        icon: iconWidget,
        label: textWidget);
  }
}
