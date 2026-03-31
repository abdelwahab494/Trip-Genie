import 'package:trip_genie/core/manager/app_imports.dart';

class TravelInfoScreen extends StatefulWidget {
  const TravelInfoScreen({super.key, required this.city});
  final CityModel city;

  @override
  State<TravelInfoScreen> createState() => _TravelInfoScreenState();
}

class _TravelInfoScreenState extends State<TravelInfoScreen> {
  final PageController pageController = PageController();
  final List<Widget> pages = [DurationView()];

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(s.personalizeYourTrip)),
      body: Column(
        children: <Widget>[
          TopPrograssBar(pagesCount: pages.length),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              onPageChanged: (value) {
                context.read<TripInfoCubit>().changeState(currentPage: value);
              },
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomActionButton(
        pageController: pageController,
        pagesLenght: pages.length,
      ),
    );
  }
}
