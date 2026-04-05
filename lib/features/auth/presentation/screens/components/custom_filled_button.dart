import 'package:trip_genie/core/manager/app_imports.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: AppSizes.h8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(AppSizes.r12),
        ),
        textStyle: AppFonts.inter24Bold(
          context,
        ).copyWith(color: context.secBackground, fontSize: AppSizes.sp14),
      ),
      child: Text(title),
    );
  }
}
