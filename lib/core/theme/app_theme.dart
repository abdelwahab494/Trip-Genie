import 'package:trip_genie/core/manager/app_imports.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // brightness: Brightness.light,
    // colorScheme: ColorScheme.fromSeed(
    //   shadow: LightColors.primary.withValues(alpha: 0.5),
    //   seedColor: LightColors.primary,
    //   primary: LightColors.primary,
    //   onPrimary: LightColors.onPrimary,
    //   secondary: LightColors.secondary,
    //   surface: LightColors.surface,
    //   tertiary: LightColors.grey,
    // ),
    primaryColor: LightColors.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: LightColors.primary,
      brightness: Brightness.light,
      // Primary
      primary: LightColors.primary,
      // Backgrounds
      surface: LightColors.firstBackground,
      surfaceBright: LightColors.secBackground,
      // Text
      tertiary: LightColors.firstText,
      tertiaryFixed: LightColors.secText,
      onTertiary: LightColors.thirdText,
      onTertiaryFixed: LightColors.forthText,
      // Border
      outline: LightColors.border,
    ),
    scaffoldBackgroundColor: LightColors.firstBackground,
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(foregroundColor: LightColors.firstText),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        fontSize: AppSizes.sp30,
        fontWeight: FontWeight.bold,
        color: LightColors.textPrimary,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: AppSizes.sp24,
        fontWeight: FontWeight.bold,
        color: LightColors.onPrimary,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: AppSizes.sp16,
        fontWeight: FontWeight.w500,
        color: LightColors.onPrimary,
      ),
      bodySmall: GoogleFonts.aBeeZee(
        fontSize: AppSizes.sp14,
        color: LightColors.textDescription.withValues(alpha: 0.8),
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: AppSizes.sp14,
        fontWeight: FontWeight.w600,
        color: LightColors.onPrimary,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: LightColors.firstBackground,
      elevation: 0,
      scrolledUnderElevation: 0,
      foregroundColor: LightColors.firstText,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
        color: LightColors.firstText,
        fontWeight: FontWeight.bold,
        fontSize: AppSizes.sp18,
      ),
    ),
    splashFactory: NoSplash.splashFactory,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      borderRadius: BorderRadius.circular(AppSizes.r500),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: AppSizes.h16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(AppSizes.r12),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: AppSizes.sp14,
          fontWeight: FontWeight.bold,
          color: LightColors.secBackground,
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData();
}
