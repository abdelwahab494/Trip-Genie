import 'package:trip_genie/core/manager/app_imports.dart';

class HeaderSectionComponent extends StatelessWidget {
  const HeaderSectionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(
          AppSizes.w20,
          AppSizes.h24,
          AppSizes.w20,
          AppSizes.h8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(s.exploreSmartEgypt, style: AppFonts.inter30Bold(context)),
            Gap(AppSizes.h8),
            Text(
              s.selectyourcitytobeginyourjourney,
              style: AppFonts.inter16Medium(
                context,
              ).copyWith(color: context.primary),
            ),
            Gap(AppSizes.h16),
            // Search bar
            Container(
              width: AppSizes.w358,
              decoration: BoxDecoration(
                color: context.secBackground.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(AppSizes.r8),
              ),
              child: CustomTextFieldHome(
                onChanged: (value) {
                  context.read<HomeCubit>().searchCities(value);
                },
              ),
            ),
            Gap(AppSizes.h20),
          ],
        ),
      ),
    );
  }
}
