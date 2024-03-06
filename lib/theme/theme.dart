import 'package:flutter/material.dart';

ThemeData get theme => ThemeHelper().themeData();
// ignore: use_full_hex_values_for_flutter_colors
Color secondarytTitle = const Color(0xFFFA6BDCA);
const defaultPadding = 20.0;
const defaultLargePadding = 70;

const defaultSpacerVerticalSmall = SizedBox(height: defaultPadding / 4);
const defaultSpacerVerticalLarge = SizedBox(height: defaultLargePadding / 1);
const defaultSpacerVerticalMedium = SizedBox(height: defaultPadding / 1.6);

class ThemeHelper {
  ThemeData _getThemeData() {
    var colorScheme = ColorSchemes.primaryColorScheme;
    return ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor:Colors.white),
      visualDensity: VisualDensity.standard,
      colorScheme: ColorSchemes.primaryColorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: const InputDecorationTheme(
        
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: const BorderSide(
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.white;
        }),
        side: const BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray500,
      ),
    );
  }

  /// Returns the primary colors for the current theme.

  /// Returns the current theme data.
   ThemeData themeData() => _getThemeData();
  PrimaryColors themeColor() => _getThemeColors();
}
const defaultPaddings = 20.0;
const brownColor = Color(0xFF92969D);


class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        
        titleLarge: TextStyle(
          color: appTheme.gray90003,
          fontSize: 24,
          fontFamily: 'RobotoBold',
          fontWeight: FontWeight.w600,
        ),
     
        headlineSmall: TextStyle(
          color: appTheme.gray90003,
          fontSize: 20,
          fontFamily: 'RobotoReg',
          fontWeight: FontWeight.w600,
        ),
        
      );
}
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF13C279),
    primaryContainer: Color(0XFF292931),
    secondaryContainer: Color(0XFF48A8CF),

    // Error colors
    errorContainer: Color(0XFF5C5660),
    onError: Color(0X2D20AF90),
    onErrorContainer: Color(0XFF021639),

    // On colors(text colors)
    onPrimary: Color(0XFF061737),
    onPrimaryContainer: Color(0XFFE5E8EC),
  );
}
PrimaryColors get appTheme => ThemeHelper().themeColor();
PrimaryColors _getThemeColors() {
  return PrimaryColors();
}
  PrimaryColors themeColor() => _getThemeColors();

class PrimaryColors {
  // AmberAB
  Color get amberA200B5 => const Color(0XB5FFD43C);

  // Black
  Color get black900 => const Color(0XFF000000);

  // Blue
  Color get blue300 => const Color(0XFF6993FF);
  Color get blue700 => const Color(0XFF1D69CF);
  Color get blue800 => const Color.fromARGB(255, 8, 9, 10);
  Color get blue80001 => const Color(0XFF1C5EB7);

  // BlueGray
  Color get blueGray100 => const Color(0XFFD9D9D9);
  Color get blueGray200 => const Color(0XFFB7BDC7);
  Color get blueGray20001 => const Color(0XFFB7BEC8);
  Color get blueGray20002 => const Color(0XFFA6BDCA);
  Color get blueGray20003 => const Color(0XFFB2ACBC);
  Color get blueGray300 => const Color(0XFF98A5B3);
  Color get blueGray400 => const Color(0XFF8D8D8D);
  Color get blueGray40001 => const Color(0XFF8C8E9D);
  Color get blueGray50 => const Color(0XFFF2EFF4);
  Color get blueGray5001 => const Color(0XFFF1EFF4);
  Color get blueGray5002 => const Color(0XFFECF8F4);
  Color get blueGray5003 => const Color(0XFFE8ECF1);
  Color get blueGray5004 => const Color(0XFFE9EBEF);
  Color get blueGray900 => const Color(0XFF2F2F2F);

  // Cyan
  Color get cyan300 => const Color(0XFF50C1D9);
  Color get cyan900 => const Color(0XFF1D5171);
  Color get cyan90001 => const Color(0XFF185D79);

  // DeepOrange
  Color get deepOrange300 => const Color(0XFFFF9257);

  // DeepPurple
  Color get deepPurple200 => const Color(0XFFBDA0E2);
  Color get deepPurple400 => const Color(0XFF875EBB);

  // Gray
  Color get gray100 => const Color(0XFFECFBF4);
  Color get gray10 => const Color(0XFFE3E7EC);
  Color get gray10001 => const Color(0XFFF3F5F7);
  Color get gray10002 => const Color(0XFFF6F7F9);
  Color get gray10003 => const Color(0XFFF5F7F9);
  Color get gray300 => const Color(0XFFE6E6E6);
  Color get gray50 => const Color(0XFFF2FFF7);
  Color get gray500 => const Color(0XFF9C9C9C);
  Color get gray5001 => const Color(0XFFF1FAFF);
  Color get gray5002 => const Color(0XFFFFFAF4);
  Color get gray600 => const Color(0XFF717171);
  Color get gray60001 => const Color(0XFF838383);
  Color get gray700 => const Color(0XFF555555);
  Color get gray900 => const Color(0XFF26202E);
  Color get gray90001 => const Color(0XFF031739);
  Color get gray90002 => const Color(0XFF0D222A);
  Color get gray90003 => const Color(0XFF0E222B);
  Color get gray90004 => const Color(0XFF1C1C1C);

  // Green
  Color get green20033 => const Color(0X339BE1BF);
  Color get green2003301 => const Color(0X339ED5B4);
  Color get greenA700 => const Color(0XFF009C3E);
  Color get greenA70001 => const Color(0XFF08C375);
  Color get greenA70016 => const Color(0X1605FF00);

  // Indigo
  Color get indigo100 => const Color(0XFFC6D1E0);
  Color get indigo400 => const Color(0XFF407CCC);
  Color get indigoA100 => const Color(0XFF7B88FF);
  Color get indigoA200 => const Color(0XFF5D5FEF);

  // Orange
  Color get orange800 => const Color(0XFFD86713);

  // Pink
  Color get pink300 => const Color(0XFFEF5DA8);

  // Red
  Color get red300 => const Color(0XFFC0986C);
  Color get red400 => const Color(0XFFD65159);
  Color get red40001 => const Color(0XFFF35F60);
  Color get red40014 => const Color(0X14F46060);
  Color get red50 => const Color(0XFFFFF4EE);
  Color get redA400 => const Color(0XFFFF0431);
  Color get redA70016 => const Color(0X16FF0000);

  // Teal
  Color get teal300 => const Color(0XFF4494B5);
  Color get teal400 => const Color(0XFF23B693);
  Color get teal40001 => const Color(0XFF19C08E);
  Color get teal40002 => const Color(0XFF1AC08E);
  Color get teal40003 => const Color(0XFF23B793);

  // White
  Color get whiteA700 => const Color(0XFFFDFBFF);
  Color get whiteA70001 => const Color(0XFFFFFFFF);
}