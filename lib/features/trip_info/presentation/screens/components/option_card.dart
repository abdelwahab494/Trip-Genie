import 'package:trip_genie/core/manager/app_imports.dart';

class OptionCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isSkeleton;
  final IconData icon;

  const OptionCard({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.isSkeleton = false,
    required this.icon
  });

  const OptionCard.skeleton({super.key})
    : text = "Half Day",
      isSelected = false,
      onTap = _dummyOnTap,
      isSkeleton = true,
      icon = Icons.access_time_filled;

  static void _dummyOnTap() {}

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? context.primary
        : context.primary.withValues(alpha: 0.4);
    final borderWidth = isSelected ? 3.0 : 1.0;
    final iconBgColor = isSelected ? context.primary : context.firstBackground;
    final iconColor = isSelected ? context.firstBackground : context.primary;

    return InkWell(
      onTap: isSkeleton ? null : onTap,
      borderRadius: BorderRadius.circular(AppSizes.r12),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.h12,
          horizontal: AppSizes.w18,
        ),
        decoration: BoxDecoration(
          color: context.primary.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(AppSizes.r12),
          border: Border.all(color: color, width: borderWidth),
        ),
        child: Row(
          spacing: AppSizes.w16,
          children: [
            Container(
              padding: EdgeInsets.all(AppSizes.w12),
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(AppSizes.r12),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: AppSizes.w30,
              ),
            ),
            Expanded(
              child: Text(
                text.capitalize,
                style: AppFonts.inter16Medium(context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.firstText,
                ),
              ),
            ),
            Radio<int>(
              activeColor: context.primary,
              value: isSelected ? 1 : 0,
              groupValue: isSelected ? 1 : null,
              onChanged: (_) {},
            ),
          ],
        ),
      ),
    );
  }
}
