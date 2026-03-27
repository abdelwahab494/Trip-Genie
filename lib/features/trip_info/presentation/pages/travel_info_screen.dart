import 'package:trip_genie/core/manager/app_imports.dart';
import 'package:trip_genie/features/trip_info/presentation/components/bottom_action_button.dart';
import 'package:trip_genie/features/trip_info/presentation/components/top_prograss_bar.dart';

class TravelInfoScreen extends StatefulWidget {
  const TravelInfoScreen({super.key, required this.city});
  final CityModel city;

  @override
  State<TravelInfoScreen> createState() => _TravelInfoScreenState();
}

class _TravelInfoScreenState extends State<TravelInfoScreen> {
  final PageController pageController = PageController();
  final List<Widget> pages = [];

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(s.personalizeYourTrip.toUpperCase())),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
            sliver: TopPrograssBar(pagesCount: pages.length),
          ),
          SliverGap(AppSizes.h20),
          SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              child: PageView.builder(
                controller: pageController,
                itemCount: pages.length,
                onPageChanged: (value) {},
                itemBuilder: (context, index) {
                  return pages[index];
                },
              ),
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
