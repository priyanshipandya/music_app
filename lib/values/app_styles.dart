import 'package:flutter/material.dart';

import 'colors.dart';

class AppStyles {
  static const bottomNavRadius = BorderRadius.only(
    topLeft: Radius.circular(36),
    topRight: Radius.circular(36),
  );

  static const navDialContainerDecor = BoxDecoration(
    color: KColors.kBlue,
    shape: BoxShape.circle,
  );

  static final emptyBoxDecor = BoxDecoration(
    color: KColors.kGrey,
    borderRadius: BorderRadius.circular(30),
  );

  static const prefixIconStyle = Icon(
    Icons.search,
    color: KColors.kBlue,
    size: 24,
  );

  static const helloTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  static const smallTextStyle = TextStyle(
    color: KColors.kBorderColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    fontSize: 12,
  );

  static const titleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  static const seeAllTextStyle = TextStyle(
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: KColors.kSeeAllColor,
  );

  static const mediumTextStyle = TextStyle(
    color: KColors.kBlue,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    fontSize: 14,
  );

  static const userNameTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  static const boldMediumTextStyle = TextStyle(
    color: KColors.darkBlack,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    fontSize: 14,
    // overflow: TextOverflow.ellipsis,
  );

  static final navDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
  );

  static final navBoxShadow = BoxShadow(
    color: Colors.grey.shade200,
    spreadRadius: 2,
    blurRadius: 1,
  );

static final imageBoxDecor = BoxDecoration(
  color: KColors.kGrey,
  borderRadius: BorderRadius.circular(16),
);
}
