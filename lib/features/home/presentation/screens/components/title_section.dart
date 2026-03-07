import 'package:trip_genie/core/manager/app_imports.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppSizes.w20, bottom: AppSizes.h12),
      child: Row(
        children: [
          Container(
            width: AppSizes.w4,
            height: AppSizes.h18,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(AppSizes.r2),
            ),
          ),
          Gap(AppSizes.w8),
          Text(
            title,
            style: AppFonts.inter16Medium(context).copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
