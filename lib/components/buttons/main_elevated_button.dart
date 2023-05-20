import 'package:flutter/material.dart';

import '../../constants/sizes/sizes.dart';

class MainElevatedButton extends StatelessWidget {
  final Function() buttonFunction;
  final Widget buttonWidget;
  const MainElevatedButton(
      {super.key, required this.buttonFunction, required this.buttonWidget});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius))),
        onPressed: buttonFunction,
        child: buttonWidget);
  }
}
