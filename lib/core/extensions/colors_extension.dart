import 'package:trip_genie/core/manager/app_imports.dart';

extension ColorsExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get primary => colorScheme.primary;

  Color get firstBackground => colorScheme.surface;

  Color get secBackground => colorScheme.surfaceBright;

  Color get firstText => colorScheme.tertiary;

  Color get sectText => colorScheme.tertiaryFixed;

  Color get thirdText => colorScheme.onTertiary;

  Color get forthText => colorScheme.onTertiaryFixed;

  Color get border => colorScheme.outline;
}
