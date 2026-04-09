import 'package:trip_genie/core/manager/app_imports.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, this.onChanged, required this.hintText});
  final void Function(String)? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,

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
