import 'package:skeletonizer/skeletonizer.dart';
import 'package:trip_genie/core/manager/app_imports.dart';
import 'package:trip_genie/core/networking/gemini_service/travel_tip_model.dart';

import 'package:trip_genie/features/home/presentation/components/home_bottom_navigator_bar_component.dart';
import 'package:trip_genie/features/travel_tips/data/travel_tips_cubit/cubit/travel_tips_cubit.dart';
import 'package:trip_genie/features/travel_tips/presentation/components/smart_guide_card_component.dart';
import 'package:trip_genie/features/travel_tips/presentation/travel_tip_details_view.dart.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<HomeCubit>().getCitiesOnce();
    context.read<TravelTipsCubit>().getHomeTips();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const HomeBottomNavigationBarComponent(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: AppSizes.w16),
                  child: CircleAvatar(
                    radius: AppSizes.r16,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: Icon(
                      Icons.person,
                      size: AppSizes.w16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Hello, ",
                    style: AppFonts.inter16Medium(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                    children: [
                      TextSpan(
                        text: "Saeid",
                        style: AppFonts.inter16Medium(context).copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: AppSizes.w16),
                child: CircleAvatar(
                  radius: AppSizes.r16,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  child: IconButton(
                    icon: Icon(Icons.notifications, size: AppSizes.w16),
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),

          // 2. Header / Search Section
          SliverToBoxAdapter(child: HeaderSectionComponent()),

          // 3. Popular Cities Section
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoaded) {
                return SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(
                        context,
                        state.isSearch ? "Search Results" : "Popular Cities",
                      ),
                      if (state.isSearch && state.cities.isEmpty)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text("No cities found"),
                          ),
                        )
                      else
                        SizedBox(
                          height: AppSizes.h200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.cities.length,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.w16,
                            ),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: CityCard(city: state.cities[index]),
                              );
                            },
                          ),
                        ),
                      Gap(AppSizes.h24),
                    ],
                  ),
                );
              } else if (state is HomeError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      state.message,
                      style: AppFonts.inter14SemiBold(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.error),
                    ),
                  ),
                );
              } else {
                return SliverSkeletonizer(
                
                  effect: ShimmerEffect(
                    baseColor: Colors.grey.shade500,
                    highlightColor: Colors.white,
                  ),
                  child: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle(context, "Popular Cities"),

                        SizedBox(
                          height: AppSizes.h200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 4,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.w16,
                            ),
                            itemBuilder: (context, index) {
                              return CityCard(
                                city: CityModel(
                                  name: "Loading...",
                                  description:
                                      "Please wait while we fetch the data.",
                                  images: [
                                    "https://operaparallele.org/wp-content/uploads/2023/09/Placeholder_Image.png",
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Gap(AppSizes.h24),
                      ],
                    ),
                  ),
                );
              }
            },
          ),

          // 4. Smart Guide / Travel Tips Section
          // SliverToBoxAdapter(child: _buildSectionTitle(context, "Travel Tips")),
          SliverToBoxAdapter(
            child: BlocBuilder<TravelTipsCubit, TravelTipsState>(
              builder: (context, state) {
                if (state is TravelTipsLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(context, "Travel Tips"),
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
                                        TravelTipsDetailsView(tips: state.tips),
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
                  );
                }
                // Fallback while AI is loading
                return Skeletonizer(
                  effect: ShimmerEffect(
                    baseColor: Colors.grey.shade500,
                    highlightColor: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(context, "Travel Tips"),
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
                                category: "Loading...",
                                description:
                                    "Please wait while we fetch the data.",
                              ),
                              isLandscape: true,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Bottom Padding
          SliverToBoxAdapter(child: Gap(AppSizes.h24)),
        ],
      ),
    );
  }

  // Reusable Section Title Widget
  Widget _buildSectionTitle(BuildContext context, String title) {
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
