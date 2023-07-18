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
    color: Colors.black,
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
    color: KColors.kLightWhite,
    size: 24,
  );
  static const searchHintStyle = TextStyle(
    color: KColors.kLightWhite,
  );
  static const helloTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const smallTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  static const titleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const searchStyle = TextStyle(
    color: Colors.white,
  );

  static const mediumTextStyle = TextStyle(
    color: KColors.kBlue,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );

  static const userNameTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const boldMediumTextStyle = TextStyle(
    color: Colors.white60,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    // overflow: TextOverflow.ellipsis,
  );

  static const mediumTextStyleLabel = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );

  static const mediumTextStyleWhiteLabel = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );

  static const smallTextStyleWhiteLabel = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );
  static final navDecoration = BoxDecoration(
    // color: Colors.white,
    borderRadius: BorderRadius.circular(20),
  );

  static const navBoxShadow = BoxShadow(
    spreadRadius: 2,
    blurRadius: 1,
  );

  static final imageBoxDecor = BoxDecoration(
    color: KColors.kGrey,
    borderRadius: BorderRadius.circular(16),
  );
}
