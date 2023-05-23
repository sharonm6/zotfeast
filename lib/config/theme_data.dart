import 'package:flutter/material.dart';
import 'color_constants.dart';

class ThemeConfig {
  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
        background: ColorConstants.zotfeastBrownLight,
        cardBackground: ColorConstants.zotfeastBrown,
        primaryText: Colors.black,
        secondaryText: ColorConstants.zotfeastBrownLight,
        accentColor: ColorConstants.zotfeastGreen,
        divider: ColorConstants.zotfeastBrown,
        buttonBackground: ColorConstants.zotfeastBrownDark,
        buttonText: Colors.white,
        disabled: ColorConstants.zotfeastGrey,
        error: Colors.red,
      );

  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    required Color secondaryText,
    required Color accentColor,
    required Color divider,
    required Color buttonBackground,
    required Color buttonText,
    required Color cardBackground,
    required Color disabled,
    required Color error,
  }) {
    const baseTextTheme = Typography.whiteMountainView;

    return ThemeData(
      brightness: brightness,
      canvasColor: background,
      cardColor: background,
      dividerColor: divider,
      dividerTheme: DividerThemeData(
        color: divider,
        space: 1,
        thickness: 1,
      ),
      cardTheme: CardTheme(
        color: cardBackground,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.black))),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(16)))),
      primaryColor: accentColor,
      iconTheme: IconThemeData(
        color: secondaryText,
        size: 20.0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorConstants.zotfeastBrownDark,
        selectedItemColor: ColorConstants.zotfeastBrownLight,
        unselectedItemColor: ColorConstants.zotfeastBrownLight,
        selectedLabelStyle: TextStyle(
          color: ColorConstants.zotfeastBrownLight,
          fontFamily: 'Lato',
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: TextStyle(
          color: ColorConstants.zotfeastBrownLight,
          fontFamily: 'Lato',
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(
          color: ColorConstants.zotfeastBrownLight,
          size: 28.0,
        ),
        unselectedIconTheme: IconThemeData(
          color: ColorConstants.zotfeastBrownLight,
          size: 28.0,
        ),
      ),

      // buttonTheme: ButtonThemeData(
      //   textTheme: ButtonTextTheme.primary,
      //   colorScheme: ColorScheme(
      //     brightness: brightness,
      //     primary: accentColor,
      //     secondary: accentColor,
      //     surface: background,
      //     background: background,
      //     error: error,
      //     onPrimary: buttonText,
      //     onSecondary: buttonText,
      //     onSurface: buttonText,
      //     onBackground: buttonText,
      //     onError: buttonText,
      //   ),
      //   padding: const EdgeInsets.all(16.0),
      // ),
      // inputDecorationTheme: InputDecorationTheme(
      //   errorStyle: TextStyle(color: error),
      //   labelStyle: TextStyle(
      //     fontFamily: '',
      //     fontWeight: FontWeight.w600,
      //     fontSize: 16.0,
      //     color: primaryText.withOpacity(0.5),
      //   ),
      //   hintStyle: TextStyle(
      //     color: secondaryText,
      //     fontSize: 13.0,
      //     fontWeight: FontWeight.w300,
      //   ),
      // ),
      fontFamily: '',
      textTheme: TextTheme(
        headlineMedium: baseTextTheme.headlineMedium?.copyWith(
          fontFamily: 'PlayfairDisplay',
          color: primaryText,
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: baseTextTheme.titleLarge?.copyWith(
          fontFamily: 'Georgia',
          color: primaryText,
          fontSize: 23,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: baseTextTheme.titleMedium?.copyWith(
          fontFamily: 'Georgia',
          color: primaryText,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        labelLarge: baseTextTheme.labelLarge?.copyWith(
          fontFamily: 'Lato',
          color: secondaryText,
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: baseTextTheme.labelSmall?.copyWith(
          fontFamily: 'Lato',
          color: ColorConstants.zotfeastGrey,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: baseTextTheme.bodyLarge?.copyWith(
          fontFamily: 'Georgia',
          color: primaryText,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(
          fontFamily: 'Georgia',
          color: primaryText,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      // textSelectionTheme: TextSelectionThemeData(
      //   cursorColor: accentColor,
      //   selectionColor: accentColor,
      //   selectionHandleColor: accentColor,
      // ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: accentColor, brightness: brightness)
          .copyWith(background: background)
          .copyWith(error: error),
    );
  }
}
