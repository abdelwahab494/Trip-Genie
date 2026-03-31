import 'package:trip_genie/core/manager/app_imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getCitiesOnce();
    context.read<TravelTipsCubit>().getTravelTips();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserCubit>(),
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              context.read<HomeCubit>().getCitiesOnce(),
              context.read<TravelTipsCubit>().getTravelTips(),
            ]);
          },
          child: CustomScrollView(
            // physics: const BouncingScrollPhysics(),
            slivers: [
              // 1. App Bar
              HomeSliverAppBar(),

              // 2. Header / Search Section
              HeaderSectionComponent(),

              // 3. Popular Cities Section
              PopularCitiesSection(),

              // 4. Smart Guide / Travel Tips Section
              TravelTipsSection(),

              // Bottom Padding
              SliverGap(AppSizes.h24),
            ],
          ),
        ),
      ),
    );
  }
}
