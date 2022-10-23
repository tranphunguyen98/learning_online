import 'package:flutter/material.dart';

import '../colors.dart';
import '../styles.dart';

AppBar widgetCoreAppBar({String? title, bool hasBackIcon = true, required BuildContext context}) {
  return hasBackIcon
      ? AppBar(
    backgroundColor: kWhiteColor,
    elevation: 0,
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: const Icon(
        Icons.arrow_back_ios_rounded,
        color: kBlackColor,
      ),
    ),
    title: Text(
      title ?? '',
      style: kFontSemiboldBlack_16,
    ),
  )
      : AppBar(
    backgroundColor: kWhiteColor,
    elevation: 0,
    title: Text(
      title ?? '',
      style: kFontSemiboldBlack_16,
    ),
  );
}
