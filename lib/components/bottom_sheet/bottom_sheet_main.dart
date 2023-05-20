import 'package:flutter/material.dart';

class MainComponents {
  Future openBottomSheet(BuildContext context, Widget widget) async {
    double pageWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      constraints: BoxConstraints(
        minWidth: pageWidth,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      showDragHandle: true,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }
}