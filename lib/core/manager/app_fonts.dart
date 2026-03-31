import 'package:trip_genie/core/manager/app_imports.dart';

class AppFonts {
  const AppFonts._();

  static TextStyle inter30Bold(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!;

  static TextStyle inter14SemiBold(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall!;

  static TextStyle inter16Medium(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: AppSizes.sp16);

  static TextStyle inter24Bold(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!;

  static TextStyle aBeeZee4Bold(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!;

  static TextStyle aBeeZee14Regular(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!;
}
