import 'package:skeletonizer/skeletonizer.dart';
import 'package:trip_genie/core/extensions/snack_bar_extension.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class BottomActionsButtons extends StatelessWidget {
  const BottomActionsButtons({super.key, required this.onRegenerate});
  final VoidCallback onRegenerate;

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return BlocConsumer<PlansCubit, PlansState>(
      listener: (context, state) {
        if (state is PlansLocalSuccess) {
          context.showSuccess(state.message);
        }
        if (state is PlansLocalError) {
          context.showError(state.message);
        }
      },
      builder: (context, state) {
        if (state is PlansError) {
          return SizedBox.shrink();
        }
        return Skeletonizer(
          enabled: state is PlansLoading,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
              AppSizes.w16,
              AppSizes.h10,
              AppSizes.w16,
              AppSizes.h30,
            ),
            decoration: BoxDecoration(
              color: context.secBackground,
              border: Border.all(
                color: context.primary.withValues(alpha: 0.4),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: Offset(0, -3),
                ),
              ],
            ),
            child: Row(
              spacing: AppSizes.w16,
              children: [
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: onRegenerate,
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: context.primary,
                      textStyle: AppFonts.inter16Medium(context).copyWith(
                        color: context.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      padding: EdgeInsets.symmetric(vertical: AppSizes.h16),
                      shape: RoundedSuperellipseBorder(
                        borderRadius: BorderRadiusGeometry.circular(
                          AppSizes.r12,
                        ),
                        side: BorderSide(width: 3, color: context.primary),
                      ),
                      iconSize: AppSizes.r25,
                    ),
                    label: Text(s.regenerate),
                    icon: Icon(Icons.refresh_rounded),
                  ),
                ),
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: () async {
                      if (state is PlansLoaded) {
                        await context.read<PlansCubit>().savePlan(
                          TripModel(
                            name: "Test 1",
                            places: state.planPlacesList,
                          ),
                        );
                      }
                    },
                    style: FilledButton.styleFrom(
                      iconSize: AppSizes.r25,
                      backgroundColor: context.primary,
                      foregroundColor: context.secBackground,
                      textStyle: AppFonts.inter16Medium(context).copyWith(
                        color: context.secBackground,
                        fontWeight: FontWeight.bold,
                      ),
                      padding: EdgeInsets.symmetric(vertical: AppSizes.h16),
                      shape: RoundedSuperellipseBorder(
                        borderRadius: BorderRadiusGeometry.circular(
                          AppSizes.r12,
                        ),
                        side: BorderSide(width: 3, color: context.primary),
                      ),
                    ),
                    label: Text(s.savePlan),
                    icon: Icon(Icons.bookmark_add),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
