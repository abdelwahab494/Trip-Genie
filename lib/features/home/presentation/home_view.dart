import 'package:trip_genie/core/manager/app_imports.dart';
import 'package:trip_genie/features/home/presentation/components/home_bottom_navigator_bar_component.dart';
import 'package:trip_genie/test_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<HomeCubit>().getCitiesOnce();
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
          // App Bar
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: AppSizes.w16),
                  child: CircleAvatar(
                    radius: AppSizes.r16,
                    backgroundColor: Theme.of(context).colorScheme.surface,

                    child: IconButton(
                      icon: Icon(Icons.person, size: AppSizes.w16),
                      color: Theme.of(context).colorScheme.primary,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MagicalSplashView(),
                          ),
                        );
                      },
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
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const TestView(),
                      //   ),
                      // );
                    },
                  ),
                ),
              ),
            ],
          ),

          // Header Section
          SliverToBoxAdapter(child: HeaderSectionComponent()),

          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoaded) {
                return SliverMainAxisGroup(
                  slivers: [
                    // Title
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: AppSizes.w20,
                          bottom: AppSizes.h8,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: AppSizes.w4,
                              height: AppSizes.h18,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(
                                  AppSizes.r2,
                                ),
                              ),
                            ),
                            Gap(AppSizes.w8),
                            Text(
                              state.isSearch
                                  ? "Search Results"
                                  : "Popular Cities",
                              style: AppFonts.inter16Medium(context).copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Empty State
                    if (state.isSearch && state.cities.isEmpty)
                      const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(child: Text("No cities found")),
                      )
                    else
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return CityCard(city: state.cities[index]);
                        }, childCount: state.cities.length),
                      ),
                  ],
                );
              } else if (state is HomeError) {
                return const SliverFillRemaining(
                  child: Center(child: Text("Failed to load cities")),
                );
              }

              return const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ],
      ),
    );
  }
}
