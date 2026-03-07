import 'package:trip_genie/core/manager/app_imports.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    shadow: LightColors.primary.withValues(alpha: 0.5),
    seedColor: LightColors.primary,
    primary: LightColors.primary,
    onPrimary: LightColors.onPrimary,
    secondary: LightColors.secondary,
    surface: LightColors.surface,
    tertiary: LightColors.grey,
  ),
  scaffoldBackgroundColor: LightColors.background,
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
  // Add custom appBar styling if needed
  appBarTheme: const AppBarTheme(
    backgroundColor: LightColors.background,
    elevation: 0,
    foregroundColor: LightColors.onSurface,
  ),
);
