import 'package:trip_genie/core/manager/app_imports.dart';

class TopPrograssBar extends StatelessWidget {
  const TopPrograssBar({super.key, required this.pagesCount});
  final int pagesCount;

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h8,
      ),
      child: Column(
        children: [
          BlocBuilder<TripInfoCubit, TripInfoState>(
            builder: (context, state) {
              if (state is! TripInfoLoaded) {
                return SizedBox.shrink();
              }
              return Column(
                spacing: AppSizes.h8,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${s.step} ${state.currentPage + 1} ${s.Of} $pagesCount",
                        style: AppFonts.inter24Bold(context).copyWith(
                          fontSize: AppSizes.sp12,
                          color: context.thirdText,
                        ),
                      ),
                      Text(
                        "${(((state.currentPage + 1) / pagesCount) * 100).round()}% ${s.complete}",
                        style: AppFonts.inter14SemiBold(context).copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: AppSizes.sp12,
                          color: context.thirdText,
                        ),
                      ),
                    ],
                  ),
                  LinearProgressIndicator(
                    value: (state.currentPage + 1) / pagesCount,
                    color: context.primary,
                    minHeight: AppSizes.h6,
                  ),
                ],
              );
            },
          ),
          Gap(AppSizes.h8),
          Divider(color: context.forthText),
        ],
      ),
    );
  }
}
