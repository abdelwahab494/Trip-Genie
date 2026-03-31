import 'package:trip_genie/core/manager/app_imports.dart';

class BottomActionButton extends StatelessWidget {
  const BottomActionButton({
    super.key,
    required this.pageController,
    required this.pagesLenght,
  });
  final PageController pageController;
  final int pagesLenght;

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(
        AppSizes.w16,
        AppSizes.h10,
        AppSizes.h16,
        AppSizes.h50,
      ),
      child: BlocBuilder<TripInfoCubit, TripInfoState>(
        builder: (context, state) {
          if (state is! TripInfoLoaded) {
            return const SizedBox();
          }
          return FilledButton(
            onPressed: () {
              pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              state.currentPage != pagesLenght - 1
                  ? s.Continue
                  : s.generateMyPlan,
            ),
          );
        },
      ),
    );
  }
}
