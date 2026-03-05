import 'package:trip_genie/core/manager/app_imports.dart';
import 'package:trip_genie/core/networking/gemini_service/travel_tip_model.dart';


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
    // If it's landscape (HomeView), wrap it in a Gesture and use a Column
    if (isLandscape) {
      return Container(
        width: 260, // Landscape specific width
        margin: EdgeInsets.only(right: AppSizes.w12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIcon(context),
            const Spacer(),
            _buildText(context, maxLines: 2),
          ],
        ),
      );
    }

    // Otherwise, return your exact Vertical style for the DetailsView
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.h16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
      height: AppSizes.h40,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
      child: Icon(
        _getIconForCategory(tip.category),
        color: Theme.of(context).colorScheme.onPrimary,
        size: 24,
      ),
    );
  }

  // --- Helper to keep your EXACT text style ---
  Widget _buildText(BuildContext context, {required int maxLines}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tip.category,
          style: AppFonts.inter16Medium(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(AppSizes.h4),
        Text(
          tip.description,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: AppFonts.aBeeZee4Bold(context).copyWith(
            color: Colors.grey,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  IconData _getIconForCategory(String category) {
    if (category.contains("Currency")) return Icons.payments_outlined;
    if (category.contains("Time")) return Icons.wb_sunny_outlined;
    if (category.contains("Transportation")) return Icons.directions_bus_outlined;
    if (category.contains("Culture")) return Icons.temple_hindu_outlined;
    if (category.contains("Connectivity")) return Icons.wifi;
    return Icons.lightbulb_outline;
  }
}