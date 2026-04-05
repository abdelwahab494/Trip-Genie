import 'package:trip_genie/core/manager/app_imports.dart';
import 'package:trip_genie/features/plan/presentation/screens/plan_screen.dart';
import 'package:trip_genie/features/trip_info/presentation/screens/views/category_view.dart';

class TravelInfoScreen extends StatelessWidget {
  final CityModel city;
  const TravelInfoScreen({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    final pages = [const DurationView(), const CategoryView()];

    return BlocProvider(
      create: (_) => getIt<TripInfoCubit>()..getPlacesForCity(city.id!),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text(S.of(context).personalizeYourTrip)),
            body: Column(
              children: [
                const TopPrograssBar(pagesCount: 2),
                Expanded(
                  child: BlocListener<TripInfoCubit, TripInfoState>(
                    listener: (context, state) {
                      if (state is TripInfoLoaded) {
                        pageController.animateToPage(
                          state.currentStep,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                      if (state is TripStartPLan) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => PlanScreen(
                              cityName: city.name,
                              tripDuration: state.tripDuration,
                              tripStyle: state.tripStyle,
                              placesList: state.placesList,
                            ),
                          ),
                        );
                      }
                    },
                    child: PageView.builder(
                      controller: pageController,
                      onPageChanged: (value) =>
                          context.read<TripInfoCubit>().updateStep(step: value),
                      itemCount: pages.length,
                      itemBuilder: (_, index) => pages[index],
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomActionButton(
              pageController: pageController,
              pagesCount: pages.length,
            ),
          );
        },
      ),
    );
  }
}
