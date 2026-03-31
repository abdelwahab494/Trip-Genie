import 'package:skeletonizer/skeletonizer.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class TravelTipsSection extends StatelessWidget {
  const TravelTipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<TravelTipsCubit, TravelTipsState>(
        builder: (context, state) {
          if (state is TravelTipsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleSection(title: "Travel Tips"),
                SizedBox(
                  height: AppSizes.h150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.tips.length,
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
                    itemBuilder: (context, index) {
                      final tip = state.tips[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TravelTipsDetailsScreen(tips: state.tips),
                            ),
                          );
                        },
                        child: SmartGuideCard(tip: tip, isLandscape: true),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is TravelTipsError) {
            return state.tips.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleSection(title: "Travel Tips"),
                      SizedBox(
                        height: AppSizes.h150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.tips.length,
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.w16,
                          ),
                          itemBuilder: (context, index) {
                            final tip = state.tips[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TravelTipsDetailsScreen(
                                          tips: state.tips,
                                        ),
                                  ),
                                );
                              },
                              child: SmartGuideCard(
                                tip: tip,
                                isLandscape: true,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : SizedBox.shrink();
          } else if (state is TravelTipsLoading) {
            return state.tips.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleSection(title: "Travel Tips"),
                      SizedBox(
                        height: AppSizes.h150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.tips.length,
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.w16,
                          ),
                          itemBuilder: (context, index) {
                            final tip = state.tips[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TravelTipsDetailsScreen(
                                          tips: state.tips,
                                        ),
                                  ),
                                );
                              },
                              child: SmartGuideCard(
                                tip: tip,
                                isLandscape: true,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Skeletonizer(
                    effect: ShimmerEffect(
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleSection(title: "Travel Tips"),
                        SizedBox(
                          height: AppSizes.h150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 4,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.w16,
                            ),
                            itemBuilder: (context, index) {
                              return SmartGuideCard(
                                tip: TravelTipModel(
                                  icon: "abc",
                                  title: "Loading...",
                                  description:
                                      "asdfsdafsadfnbsadklnfbksdamfncsdakl.nfaslkdmnfladk.sfn;lkdsfn",
                                ),
                                isLandscape: true,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
