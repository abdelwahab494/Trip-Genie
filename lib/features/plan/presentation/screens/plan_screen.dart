import 'package:skeletonizer/skeletonizer.dart';
import 'package:trip_genie/core/manager/app_imports.dart';
import 'package:trip_genie/features/plan/presentation/screens/components/plan_content.dart';
import 'package:trip_genie/features/plan/presentation/screens/components/plan_error.dart';

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
      child: Scaffold(
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
              BlocBuilder<PlansCubit, PlansState>(
                builder: (context, state) {
                  if (state is PlansLoading) {
                    return SliverSkeletonizer(child: PlanContent.skeleton());
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
      ),
    );
  }
}
