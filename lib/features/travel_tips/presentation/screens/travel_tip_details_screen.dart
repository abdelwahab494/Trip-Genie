import 'package:trip_genie/core/manager/app_imports.dart';

class TravelTipsDetailsScreen extends StatelessWidget {
  final List<TravelTipModel> tips;

  const TravelTipsDetailsScreen({super.key, required this.tips});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Text(
          "Travel Tips",
          style: AppFonts.inter16Medium(
            context,
          ).copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(AppSizes.h10),
            Text(
              "Smart Guide",
              style: AppFonts.inter24Bold(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            Gap(AppSizes.h8),
            Text(
              "Essential information for your journey through Egypt.",
              style: AppFonts.inter14SemiBold(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
            Gap(AppSizes.h24),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tips.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: SmartGuideCard(tip: tips[index], isLandscape: false),
                );
              },
            ),
            Gap(AppSizes.h20),
          ],
        ),
      ),
    );
  }
}
