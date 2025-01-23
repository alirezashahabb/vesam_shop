import 'package:flutter/material.dart';

ThemeData lightThemeData() {
  return ThemeData(
    listTileTheme: ListTileThemeData(
      minLeadingWidth: 10,
      iconColor: AppColors.kGray900,
      contentPadding: EdgeInsets.zero,
      titleTextStyle: TextStyle(
        color: AppColors.kGray900,
        fontSize: 12,
        fontFamily: 'Vazir',
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        fontSize: 14,
      ),
      contentPadding: EdgeInsets.all(
        12,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          color: AppColors.kGray300,
          width: 0.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          color: AppColors.kPrimary500,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          color: AppColors.kAlert500,
          width: 0.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          color: AppColors.kAlert500,
          width: 1,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(64, 45),
          textStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: 'Vazir',
            fontSize: 14,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          )),
    ),
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.kGray900,
        size: 20,
      ),
      color: AppColors.kWhite,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.kGray900,
        fontSize: 16,
        fontFamily: "Vazir",
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: AppColors.kPrimary500,
      onPrimary: Colors.white,
    ),
    fontFamily: 'Vazir',
    platform: TargetPlatform.iOS,
    textTheme: const TextTheme(
        displayMedium: TextStyle(
          fontSize: 16,
          color: AppColors.kGray900,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.kGray900,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: AppColors.kGray900,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          color: AppColors.kGray300,
        )),
  );
}

class AppColors {
  static const Color kAlert100 = Color(0xfffcd3d3);
  static const Color kAlert150 = Color(0xfffabdbd);
  static const Color kAlert200 = Color(0xfff9a7a7);
  static const Color kAlert300 = Color(0xfff67c7c);
  static const Color kAlert400 = Color(0xfff35050);
  static const Color kAlert50 = Color(0xfffde9e9);
  static const Color kAlert500 = Color(0xfff02424);
  static const Color kAlert600 = Color(0xffc01d1d);
  static const Color kAlert700 = Color(0xff901616);
  static const Color kBlack = Color(0xff000000);
  static const Color kGray100 = Color(0xffeaeaea);
  static const Color kGray150 = Color(0xffdfdfdf);
  static const Color kGray200 = Color(0xffd4d4d4);
  static const Color kGray300 = Color(0xffbfbfbf);
  static const Color kGray400 = Color(0xffa9a9a9);
  static const Color kGray50 = Color(0xfff4f4f4);
  static const Color kGray500 = Color(0xff949494);
  static const Color kGray600 = Color(0xff767676);
  static const Color kGray700 = Color(0xff595959);
  static const Color kGray800 = Color(0xff3b3b3b);
  static const Color kGray850 = Color(0xff2c2c2c);
  static const Color kGray900 = Color(0xff1e1e1e);
  static const Color kGray950 = Color(0xff0f0f0f);
  static const Color kInfo100 = Color(0xffd5e8fc);
  static const Color kInfo150 = Color(0xffc0dcfb);
  static const Color kInfo200 = Color(0xffabd1fa);
  static const Color kInfo300 = Color(0xff80baf7);
  static const Color kInfo400 = Color(0xff56a3f5);
  static const Color kInfo50 = Color(0xffeaf3fe);
  static const Color kInfo500 = Color(0xff2c8cf2);
  static const Color kInfo600 = Color(0xff2370c2);
  static const Color kInfo700 = Color(0xff1a5491);
  static const Color kPrimary100 = Color(0xfffde0d6);
  static const Color kPrimary150 = Color(0xfffbd0c2);
  static const Color kPrimary200 = Color(0xfffac0ae);
  static const Color kPrimary300 = Color(0xfff8a185);
  static const Color kPrimary400 = Color(0xfff5815d);
  static const Color kPrimary50 = Color(0xfffeefeb);
  static const Color kPrimary500 = Color(0xfff36234);
  static const Color kPrimary600 = Color(0xffca512a);
  static const Color kPrimary700 = Color(0xffa13f20);
  static const Color kSuccess100 = Color(0xffd6f9dc);
  static const Color kSuccess150 = Color(0xffc2f6ca);
  static const Color kSuccess200 = Color(0xffadf3b9);
  static const Color kSuccess300 = Color(0xff85ed96);
  static const Color kSuccess400 = Color(0xff5ce773);
  static const Color kSuccess50 = Color(0xffebfced);
  static const Color kSuccess500 = Color(0xff33e150);
  static const Color kSuccess600 = Color(0xff29b440);
  static const Color kSuccess700 = Color(0xff1f8730);
  static const Color kWarning100 = Color(0xffffebd4);
  static const Color kWarning150 = Color(0xfffee0be);
  static const Color kWarning200 = Color(0xfffed6a8);
  static const Color kWarning300 = Color(0xfffec27d);
  static const Color kWarning400 = Color(0xfffdad51);
  static const Color kWarning50 = Color(0xfffff5e9);
  static const Color kWarning500 = Color(0xfffd9926);
  static const Color kWarning600 = Color(0xffca7a1e);
  static const Color kWarning700 = Color(0xff985c17);
  static const Color kWhite = Color(0xffffffff);
}
