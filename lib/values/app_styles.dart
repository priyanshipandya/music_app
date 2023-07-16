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
    // color: KColors.kGrey,
    gradient: LinearGradient(
      colors: [
        Colors.white.withOpacity(0.1),
        Colors.white.withOpacity(0.2),
      ],
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomEnd,
    ),
    borderRadius: BorderRadius.circular(30),
  );
  static final blackEmptyBoxDecor = BoxDecoration(
    color: Colors.black,
    gradient: LinearGradient(
      colors: [
        Colors.black12.withOpacity(0.1),
        Colors.black26.withOpacity(0.2),
      ],
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomEnd,
    ),
    borderRadius: BorderRadius.circular(30),
  );
  static const prefixIconStyle = Icon(
    Icons.search,
    color: KColors.kBlue,
    size: 24,
  );

  static const helloTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: Colors.white,
  );

  static const smallTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    fontSize: 12,
  );

  static const titleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
    color: Colors.white,
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
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: Colors.white,
  );

  static const boldMediumTextStyle = TextStyle(
    color: Colors.white60,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    fontSize: 14,
    // overflow: TextOverflow.ellipsis,
  );

  static const mediumTextStyleLabel = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    fontSize: 14,
  );

  static const mediumTextStyleWhiteLabel = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    fontSize: 16,
    // overflow: TextOverflow.ellipsis,
  );

  static final navDecoration = BoxDecoration(
    // color: Colors.white,
    borderRadius: BorderRadius.circular(20),
  );

  static final navBoxShadow = BoxShadow(
    // color: Colors.grey.shade200,
    spreadRadius: 2,
    blurRadius: 1,
  );

  static final imageBoxDecor = BoxDecoration(
    color: KColors.kGrey,
    borderRadius: BorderRadius.circular(16),
  );
}
