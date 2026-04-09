import 'package:trip_genie/core/manager/app_imports.dart';

class PlanContent extends StatefulWidget {
  const PlanContent({
    super.key,
    required this.state,
    required this.tripDuration,
  });
  final PlansLoaded state;
  final String tripDuration;

  PlanContent.skeleton({super.key})
    : state = PlansLoaded(
        cityName: "Cairo",
        planPlacesList: List.generate(
          5,
          (index) => PlacesModel(
            name: "Beautiful Tourist Spot",
            cityId: "cairo",
            regionId: "downtown",
            description:
                "A wonderful place with rich history and amazing views that you will definitely enjoy.",
            address: "Downtown Cairo, Egypt",
            lat: 30.0444,
            lng: 31.2357,
            images: ["https://placehold.co/600x400/png"],
            category: "Historical",
            openingHours: {
              "Saturday": "09:00 - 17:00",
              "Sunday": "09:00 - 17:00",
              "Monday": "09:00 - 17:00",
            },
            createdAt: DateTime.now(),
            visitTime: "90",
          ),
        ),
        category: '',
        tripDuration: '',
        placesList: [],
      ),
      tripDuration = "Full Day";

  @override
  State<PlanContent> createState() => _PlanContentState();
}

class _PlanContentState extends State<PlanContent> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: KpisRow(
            tripDuration: widget.tripDuration,
            stops: widget.state.planPlacesList.length,
          ),
        ),
        SliverGap(AppSizes.h20),
        widget.state.planPlacesList.isNotEmpty
            ? SliverToBoxAdapter(
                child: Stepper(
                  key: ValueKey(widget.state.planPlacesList.length),
                  physics: BouncingScrollPhysics(),
                  type: StepperType.vertical,
                  elevation: 0,
                  stepIconHeight: 40,
                  stepIconWidth: 40,
                  connectorColor: WidgetStateColor.resolveWith(
                    (states) => context.primary,
                  ),
                  stepIconBuilder: (stepIndex, stepState) {
                    if (stepState == StepState.complete) {
                      return Icon(Icons.check, color: context.secBackground);
                    }
                    return Icon(
                      Icons.location_on,
                      color: context.secBackground,
                    );
                  },
                  controlsBuilder: (context, details) {
                    return Row(
                      spacing: AppSizes.w14,
                      children: [
                        TextButton.icon(
                          onPressed: () async {
                            final PlansCubit cubit = context.read<PlansCubit>();
                            final PlacesModel? place =
                                await showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  isDismissible: true,
                                  builder: (context) {
                                    return TripReplaceSheet(
                                      visitTime: widget
                                          .state
                                          .planPlacesList[details.currentStep]
                                          .visitTime,
                                      cityName: widget.state.cityName,
                                      replacedPlace: widget
                                          .state
                                          .planPlacesList[details.currentStep]
                                          .name,
                                      places:
                                          List<PlacesModel>.from(
                                                widget.state.placesList,
                                              )
                                              .where(
                                                (place) => !widget
                                                    .state
                                                    .planPlacesList
                                                    .contains(place),
                                              )
                                              .toList(),
                                    );
                                  },
                                );
                            if (place != null) {
                              cubit.replaceInPlan(
                                widget.state.planPlacesList[details
                                    .currentStep],
                                place,
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.grey[600],
                            textStyle: TextStyle(
                              fontSize: AppSizes.sp13,
                              fontWeight: FontWeight.w500,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          icon: Icon(Icons.swap_horiz, size: AppSizes.r16),
                          label: Text(s.replace),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            final cubit = context.read<PlansCubit>();
                            cubit.removeFromPlan(details.stepIndex);

                            setState(() {
                              if (_currentStep >=
                                  widget.state.planPlacesList.length - 1) {
                                _currentStep =
                                    widget.state.planPlacesList.length - 2;
                              }
                              if (_currentStep < 0) _currentStep = 0;
                            });

                            context.showSuccess(s.placeRemovedSuccessfully);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: context.error,
                            textStyle: TextStyle(
                              fontSize: AppSizes.sp13,
                              fontWeight: FontWeight.w500,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          icon: Icon(Icons.clear_rounded, size: AppSizes.r16),
                          label: Text(s.remove),
                        ),
                      ],
                    );
                  },
                  steps: List.generate(widget.state.planPlacesList.length, (
                    index,
                  ) {
                    final PlacesModel place =
                        widget.state.planPlacesList[index];
                    return Step(
                      isActive: _currentStep >= index,
                      state: _currentStep > index
                          ? StepState.complete
                          : StepState.indexed,
                      title: Text(
                        place.name,
                        style: GoogleFonts.inter(
                          color: context.firstText,
                          fontWeight: FontWeight.w600,
                          fontSize: AppSizes.sp16,
                        ),
                      ),
                      subtitle: Text(
                        place.visitTime,
                        style: GoogleFonts.inter(
                          color: context.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.sp14,
                        ),
                      ),
                      content: Container(
                        margin: EdgeInsets.only(top: AppSizes.h8),
                        padding: EdgeInsets.all(AppSizes.w12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                imageUrl: place.images![0],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: AppSizes.h140,
                                errorWidget: (context, url, error) => Container(
                                  width: double.infinity,
                                  height: AppSizes.h140,
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.image_not_supported),
                                ),
                              ),
                            ),
                            SizedBox(height: AppSizes.h12),
                            Text(
                              place.description ?? "",
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontSize: AppSizes.sp14,
                                color: context.thirdText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  onStepTapped: (value) {
                    setState(() {
                      _currentStep = value;
                    });
                  },
                  currentStep: _currentStep,
                ),
              )
            : ErrorView(
                message: s.noplacesavailableforthisplan,
                onRetry: () => context.read<PlansCubit>().generatePlan(
                  cityName: widget.state.cityName,
                  category: widget.state.category,
                  tripDuration: widget.state.tripDuration,
                  placesList: widget.state.placesList,
                ),
                buttonLabel: s.tryAgain,
              ),
      ],
    );
  }
}
