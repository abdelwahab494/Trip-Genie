import 'package:trip_genie/core/manager/app_imports.dart';

class BottomActionButton extends StatelessWidget {
  final PageController pageController;
  final int pagesCount;
  const BottomActionButton({
    super.key,
    required this.pageController,
    required this.pagesCount,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(
        AppSizes.w16,
        AppSizes.h10,
        AppSizes.h16,
        AppSizes.h40,
      ),
      child: BlocBuilder<TripInfoCubit, TripInfoState>(
        builder: (context, state) {
          if (state is! TripInfoLoaded) {
            return FilledButton(onPressed: null, child: Text(s.Continue));
          }

          final isLastStep = state.currentStep == pagesCount - 1;
          return FilledButton(
            onPressed: () {
              if (!isLastStep) {
                context.read<TripInfoCubit>().updateStep(
                  step: state.currentStep + 1,
                );
              } else {
                context.read<TripInfoCubit>().startPlan();
              }
            },
            child: Text(isLastStep ? s.generateMyPlan : s.Continue),
          );
        },
      ),
    );
  }
}
