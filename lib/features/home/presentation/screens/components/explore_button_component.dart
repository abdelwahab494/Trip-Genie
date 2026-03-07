import 'package:trip_genie/core/manager/app_imports.dart';

class ExploreButton extends StatelessWidget {
  const ExploreButton({super.key});

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(AppSizes.r8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            blurRadius: 3,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            s.explore,
            style: AppFonts.inter14SemiBold(
              context,
            ).copyWith(fontStyle: FontStyle.italic),
          ),
          Gap(AppSizes.w6),
          Icon(Icons.arrow_forward, color: Colors.white, size: 14),
        ],
      ),
    );
  }
}
