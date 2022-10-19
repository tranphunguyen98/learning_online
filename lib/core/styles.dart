import 'package:flutter/material.dart';

import 'colors.dart';

final kFontRegular = TextStyle(
    fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: kBlackColor);

final kFontMedium = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
  color: kBlackColor,
);

final kFontSemibold = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
  color: kBlackColor,
);

//REGULAR
final kFontRegularDefault = kFontRegular.copyWith(color: kBlackColor);
final kFontRegularDefault_10 = kFontRegular.copyWith(fontSize: 10);
final kFontRegularDefault_12 = kFontRegular.copyWith(fontSize: 12);
final kFontRegularDefault_14 = kFontRegular.copyWith(fontSize: 14);
final kFontRegularDefault_16 = kFontRegular.copyWith(fontSize: 16);

final kFontRegularWhite = kFontRegular.copyWith(color: kWhiteColor);
final kFontRegularWhite_8 = kFontRegularWhite.copyWith(fontSize: 8);
final kFontRegularWhite_10 = kFontRegularWhite.copyWith(fontSize: 10);
final kFontRegularWhite_12 = kFontRegularWhite.copyWith(fontSize: 12);
final kFontRegularWhite_12_80 = kFontRegularWhite.copyWith(
  fontSize: 12,
  color: kWhiteColor.withOpacity(0.8),
);
final kFontRegularWhite_14 = kFontRegularWhite.copyWith(fontSize: 14);
final kFontRegularWhite_16 = kFontRegularWhite.copyWith(fontSize: 16);
final kFontRegularWhite_14_80 = kFontRegularWhite.copyWith(
  fontSize: 14,
  color: kWhiteColor.withOpacity(0.8),
);

final kFontRegularBlue = kFontRegular.copyWith(color: kBlueColor);
final kFontRegularBlue_12 = kFontRegularBlue.copyWith(fontSize: 12);
final kFontRegularBlue_14 = kFontRegularBlue.copyWith(fontSize: 14);

final kFontRegularGray = kFontRegular.copyWith(color: kGrayColor);
final kFontRegularGray_10 = kFontRegularGray.copyWith(fontSize: 10);
final kFontRegularGray_12 = kFontRegularGray.copyWith(fontSize: 12);
final kFontRegularGray_14 = kFontRegularGray.copyWith(fontSize: 14);

final kFontRegularRed = kFontRegular.copyWith(color: kRedColor);
final kFontRegularRed_16 = kFontRegularRed.copyWith(fontSize: 16);

final kFontRegularPrimary = kFontRegular.copyWith(color: kPrimaryColor);
final kFontRegularPrimary_14 = kFontRegularPrimary.copyWith(fontSize: 14);
final kFontRegularPrimary_12 = kFontRegularPrimary.copyWith(fontSize: 12);
// final kFontRegularBlack2 = kFontRegular.copyWith(color: kColorBlack2);
// final kFontRegularBlack2_10 = kFontRegularBlack2.copyWith(fontSize: 10);
// final kFontRegularBlack2_12 = kFontRegularBlack2.copyWith(fontSize: 12);
// final kFontRegularBlack2_14 = kFontRegularBlack2.copyWith(fontSize: 14);
//
// final kFontRegularGray1 = kFontRegular.copyWith(color: kColorGray1);
// final kFontRegularGray1_10 = kFontRegularGray1.copyWith(fontSize: 10);
// final kFontRegularGray1_12 = kFontRegularGray1.copyWith(fontSize: 12);
// final kFontRegularGray1_14 = kFontRegularGray1.copyWith(fontSize: 14);

// final kFontRegularGray4 = kFontRegular.copyWith(color: kColorGray4);
// final kFontRegularGray4_8 = kFontRegularGray4.copyWith(fontSize: 8);
// final kFontRegularGray4_10 = kFontRegularGray4.copyWith(fontSize: 10);
// final kFontRegularGray4_12 = kFontRegularGray4.copyWith(fontSize: 12);
// final kFontRegularGray4_14 = kFontRegularGray4.copyWith(fontSize: 14);
// final kFontRegularGray4_16 = kFontRegularGray4.copyWith(fontSize: 16);

// final kFontRegularGray5 = kFontRegular.copyWith(color: kColorGray5);
// final kFontRegularGray5_10 = kFontRegular.copyWith(fontSize: 10);

//MEDIUM
final kFontMediumDefault = kFontMedium.copyWith(color: kBlueColor);
final kFontMediumDefault_10 = kFontMediumDefault.copyWith(fontSize: 10);
final kFontMediumDefault_12 = kFontMediumDefault.copyWith(fontSize: 12);
final kFontMediumDefault_14 = kFontMediumDefault.copyWith(fontSize: 14);
final kFontMediumDefault_16 = kFontMediumDefault.copyWith(fontSize: 16);

final kFontMediumWhite = kFontMedium.copyWith(color: kWhiteColor);
final kFontMediumWhite_12 = kFontMediumWhite.copyWith(fontSize: 12);
final kFontMediumWhite_14 = kFontMediumWhite.copyWith(fontSize: 14);
final kFontMediumWhite_16 = kFontMediumWhite.copyWith(fontSize: 16);
final kFontMediumWhite_18 = kFontMediumWhite.copyWith(fontSize: 18);
final kFontMediumWhite_22 = kFontMediumWhite.copyWith(fontSize: 22);

final kFontMediumBlack = kFontMedium;
final kFontMediumBlack_12 = kFontMediumBlack.copyWith(fontSize: 12);
final kFontMediumBlack_14 = kFontMediumBlack.copyWith(fontSize: 14);
final kFontMediumBlack_16 = kFontMediumBlack.copyWith(fontSize: 16);
final kFontMediumBlack_18 = kFontMediumBlack.copyWith(fontSize: 18);
final kFontMediumBlack_22 = kFontMediumBlack.copyWith(fontSize: 22);
//
// final kFontMediumGray = kFontMedium.copyWith(color: kColorGray7);
// final kFontMediumGray_12 = kFontMediumGray.copyWith(fontSize: 12);
// final kFontMediumGray_14 = kFontMediumGray.copyWith(fontSize: 14);
//SEMI_BOLD
final kFontSemiboldWhite = kFontSemibold.copyWith(color: kWhiteColor);
final kFontSemiboldWhite_10 = kFontSemiboldWhite.copyWith(fontSize: 10);
final kFontSemiboldWhite_16 = kFontSemiboldWhite.copyWith(fontSize: 16);
final kFontSemiboldWhite_18 = kFontSemiboldWhite.copyWith(fontSize: 18);

final kFontSemiboldBlack = kFontSemibold.copyWith(color: kBlackColor);
final kFontSemiboldBlack_14 = kFontSemiboldBlack.copyWith(fontSize: 14);
final kFontSemiboldBlack_16 = kFontSemiboldBlack.copyWith(fontSize: 16);
final kFontSemiboldBlack_22 = kFontSemiboldBlack.copyWith(fontSize: 22);
//
// final kFontSemiboldGray = kFontSemibold.copyWith(color: kColorGray1_50);
// final kFontSemiboldGray_16 = kFontSemiboldGray.copyWith(fontSize: 16);

final kFontSemiboldPrimary = kFontSemibold.copyWith(color: kBlueColor);
final kFontSemiboldPrimary_16 = kFontSemiboldPrimary.copyWith(fontSize: 16);
