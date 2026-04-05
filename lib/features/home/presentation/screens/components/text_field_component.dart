import 'package:trip_genie/core/manager/app_imports.dart';

class CustomTextFieldHome extends StatelessWidget {
  const CustomTextFieldHome({super.key, this.onChanged});
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Search for a city..",

        hintStyle: AppFonts.inter16Medium(context).copyWith(
          color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
          fontWeight: FontWeight.w300,
        ),
        prefixIcon: Icon(Icons.search, size: 18, color: context.primary),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: AppSizes.h14),
      ),
    );
  }
}
