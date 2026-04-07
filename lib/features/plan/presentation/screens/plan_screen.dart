import 'package:skeletonizer/skeletonizer.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({
    super.key,
    required this.cityName,
    required this.tripDuration,
    required this.tripStyle,
    required this.placesList,
  });
  final String cityName;
  final String tripDuration;
  final String tripStyle;
  final List<PlacesModel> placesList;

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return BlocProvider(
      create: (context) => getIt<PlansCubit>()
        ..generatePlan(
          cityName: widget.cityName,
          category: widget.tripStyle,
          tripDuration: widget.tripDuration,
          placesList: widget.placesList,
        ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text(s.tripPlan)),
            body: Padding(
              padding: EdgeInsets.fromLTRB(
                AppSizes.w16,
                AppSizes.h20,
                AppSizes.w16,
                AppSizes.h0,
              ),
              child: CustomScrollView(
                slivers: [
                  BlocConsumer<PlansCubit, PlansState>(
                    listener: (context, state) {
                      if (state is PlansLocalSuccess) {
                        context.showSuccess(state.message);
                      }
                      if (state is PlansLocalError) {
                        context.showError(state.message);
                      }
                    },
                    buildWhen: (previous, current) =>
                        current is PlansLoaded ||
                        current is PlansLoading ||
                        current is PlansError,
                    builder: (context, state) {
                      if (state is PlansLoading) {
                        return SliverSkeletonizer(
                          child: PlanContent.skeleton(),
                        );
                      }
                      if (state is PlansError) {
                        return PlanError(
                          message: state.message,
                          onRetry: () async =>
                              await context.read<PlansCubit>().generatePlan(
                                cityName: widget.cityName,
                                category: widget.tripStyle,
                                tripDuration: widget.tripDuration,
                                placesList: widget.placesList,
                              ),
                          buttonLabel: s.regenerate,
                        );
                      }
                      if (state is PlansLoaded) {
                        return PlanContent(
                          state: state,
                          tripDuration: widget.tripDuration,
                        );
                      }
                      return SliverToBoxAdapter(child: const SizedBox());
                    },
                  ),
                ],
              ),
            ),
            resizeToAvoidBottomInset: true,
            bottomNavigationBar: BottomActionsButtons(
              onRegenerate: () => context.read<PlansCubit>().generatePlan(
                cityName: widget.cityName,
                category: widget.tripStyle,
                tripDuration: widget.tripDuration,
                placesList: widget.placesList,
              ),
            ),
          );
        },
      ),
    );
  }
}
