import 'package:trip_genie/core/manager/app_imports.dart';

class AppFonts {
  const AppFonts._();
  
  static TextStyle inter30Bold(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!;
  
  static TextStyle inter14SemiBold(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall!;
  
  static TextStyle inter16Medium(BuildContext context) => Theme.of(context)
      .textTheme
      .titleSmall!
      .copyWith(fontSize: AppSizes.sp16, fontWeight: FontWeight.w500);
  
  static TextStyle inter24Bold(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!;
  
  static TextStyle aBeeZee4Bold(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!;
}
