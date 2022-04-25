import '../../util/exports.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    return ThemeData(
      primaryColor: AppColors.colorPrimary,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColors.buttonBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.buttonRadius),
          ),
          elevation: 0,
          minimumSize: Size(250, Dimens.buttonHeight),
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: Dimens.fontSize14,
          ),
        ),
      ),
    );
  }

  static ThemeData get dark {
    return light;
  }
}
