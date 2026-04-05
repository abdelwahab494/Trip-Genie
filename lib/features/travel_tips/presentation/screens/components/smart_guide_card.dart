import 'package:trip_genie/core/manager/app_imports.dart';

class SmartGuideCard extends StatelessWidget {
  final TravelTipModel tip;
  final bool isLandscape;

  const SmartGuideCard({
    super.key,
    required this.tip,
    this.isLandscape = false,
  });

  @override
  Widget build(BuildContext context) {
    // If it's landscape (HomeScreen), wrap it in a Gesture and use a Column
    if (isLandscape) {
      return Container(
        width: 260, // Landscape specific width
        margin: EdgeInsets.only(right: AppSizes.w12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.secBackground,
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildIcon(context), _buildText(context, maxLines: 2)],
        ),
      );
    }

    // Otherwise, return your exact Vertical style for the DetailsView
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.h16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.secBackground,
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIcon(context),
          Gap(AppSizes.w16),
          Expanded(child: _buildText(context, maxLines: 10)),
        ],
      ),
    );
  }

  // --- Helper to keep your EXACT icon style ---
  Widget _buildIcon(BuildContext context) {
    return Container(
      width: AppSizes.w40,
      height: AppSizes.w40,
      decoration: BoxDecoration(
        color: context.primary,
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
      child: Icon(
        tip.icon.isNotEmpty ? tip.icon.toIcon : Icons.lightbulb_outline,
        color: context.secBackground,
        size: AppSizes.w28,
      ),
    );
  }

  // --- Helper to keep your EXACT text style ---
  Widget _buildText(BuildContext context, {required int maxLines}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tip.title.isNotEmpty ? tip.title : S.of(context).travelTips,
          style: AppFonts.inter16Medium(
            context,
          ).copyWith(color: context.firstText, fontWeight: FontWeight.bold),
        ),
        Gap(AppSizes.h4),
        Text(
          tip.description.isNotEmpty
              ? tip.description
              : S.of(context).nodescriptionavailable,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: AppFonts.aBeeZee14Regular(
            context,
          ).copyWith(color: context.forthText, height: 1.4),
        ),
      ],
    );
  }

  // IconData _getIconForCategory(String category) {
  //   if (category.contains("Currency")) return Icons.payments_outlined;
  //   if (category.contains("Time")) return Icons.wb_sunny_outlined;
  //   if (category.contains("Transportation")) {
  //     return Icons.directions_bus_outlined;
  //   }
  //   if (category.contains("Culture")) return Icons.temple_hindu_outlined;
  //   if (category.contains("Connectivity")) return Icons.wifi;
  //   return Icons.lightbulb_outline;
  // }
}
