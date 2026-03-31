import 'package:skeletonizer/skeletonizer.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class DurationView extends StatelessWidget {
  const DurationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
      child: ListView(
        children: [
          Text(
            "How long is your journey?",
            style: AppFonts.inter30Bold(
              context,
            ).copyWith(color: context.firstText),
          ),
          Gap(AppSizes.h12),
          Text(
            "Choose the duration that best fits your travel style and schedule.",
            style: AppFonts.inter16Medium(
              context,
            ).copyWith(fontWeight: FontWeight.normal, color: context.thirdText),
          ),
          Gap(AppSizes.h30),
          BlocBuilder<TripInfoCubit, TripInfoState>(
            builder: (context, state) {
              if (state is TripInfoLoading || state is TripInfoError) {
                return Skeletonizer(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: AppSizes.h400),
                    child: ListView.separated(
                      itemCount: 3,
                      separatorBuilder: (context, index) => Gap(AppSizes.h16),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.read<TripInfoCubit>().changeState(
                              selectedTripDuration: index,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: AppSizes.h16,
                              horizontal: AppSizes.w18,
                            ),
                            decoration: BoxDecoration(
                              color: context.primary.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(AppSizes.r12),
                              border: Border.all(
                                color: context.primary.withValues(alpha: 0.4),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              spacing: AppSizes.w16,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(AppSizes.w12),
                                  decoration: BoxDecoration(
                                    color: context.firstBackground,
                                    borderRadius: BorderRadius.circular(
                                      AppSizes.r12,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.access_time_filled,
                                    color: context.primary,
                                    size: AppSizes.w30,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Half Day",
                                    style: AppFonts.inter16Medium(context)
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: context.firstText,
                                        ),
                                  ),
                                ),
                                Radio<int>(
                                  activeColor: context.primary,
                                  value: 0,
                                  onChanged: (value) {},
                                  groupValue: null,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
              if (state is TripInfoLoaded) {
                return ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: AppSizes.h400),
                  child: ListView.separated(
                    itemCount: state.tripDurationsList.length,
                    separatorBuilder: (context, index) => Gap(AppSizes.h16),
                    itemBuilder: (context, index) {
                      final bool isSelected =
                          state.selectedTripDuration == index;
                      return InkWell(
                        onTap: () {
                          context.read<TripInfoCubit>().changeState(
                            selectedTripDuration: index,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: AppSizes.h16,
                            horizontal: AppSizes.w18,
                          ),
                          decoration: BoxDecoration(
                            color: context.primary.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(AppSizes.r12),
                            border: Border.all(
                              color: isSelected
                                  ? context.primary
                                  : context.primary.withValues(alpha: 0.4),
                              width: isSelected ? 3 : 1,
                            ),
                          ),
                          child: Row(
                            spacing: AppSizes.w16,
                            children: [
                              Container(
                                padding: EdgeInsets.all(AppSizes.w12),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? context.primary
                                      : context.firstBackground,
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.r12,
                                  ),
                                ),
                                child: Icon(
                                  Icons.access_time_filled,
                                  color: isSelected
                                      ? context.firstBackground
                                      : context.primary,
                                  size: AppSizes.w30,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  state.tripDurationsList[index],
                                  style: AppFonts.inter16Medium(context)
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: context.firstText,
                                      ),
                                ),
                              ),
                              Radio<int>(
                                activeColor: context.primary,
                                value: state.selectedTripDuration,
                                onChanged: (value) {},
                                groupValue: isSelected
                                    ? state.selectedTripDuration
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
