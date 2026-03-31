import 'package:trip_genie/core/manager/app_imports.dart';

class TravelTipsDetailsScreen extends StatelessWidget {
  final List<TravelTipModel> tips;

  const TravelTipsDetailsScreen({super.key, required this.tips});

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(s.travelTips)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(AppSizes.h10),
            Text(
              s.smartGuide,
              style: AppFonts.inter24Bold(
                context,
              ).copyWith(color: context.firstText),
            ),
            Gap(AppSizes.h8),
            Text(
              s.essentialinformationforyourjourneythroughEgypt,
              style: AppFonts.inter14SemiBold(context).copyWith(
                color: context.thirdText,
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
