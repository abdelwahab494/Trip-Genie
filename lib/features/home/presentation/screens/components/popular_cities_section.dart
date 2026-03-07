import 'package:skeletonizer/skeletonizer.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class PopularCitiesSection extends StatelessWidget {
  const PopularCitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoaded) {
                  return SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleSection(
                          title: state.isSearch
                              ? "Search Results"
                              : "Popular Cities",
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
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
                          TitleSection(title: "Popular Cities"),

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
    );
  }
}