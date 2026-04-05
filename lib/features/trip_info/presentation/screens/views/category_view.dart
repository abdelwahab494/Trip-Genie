import 'package:skeletonizer/skeletonizer.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              s.whatsyourtravelstyle,
              style: AppFonts.inter30Bold(
                context,
              ).copyWith(color: context.firstText),
            ),
          ),
          SliverGap(AppSizes.h12),
          SliverToBoxAdapter(
            child: Text(
              s.choosethepersona,
              style: AppFonts.inter16Medium(context).copyWith(
                fontWeight: FontWeight.normal,
                color: context.thirdText,
              ),
            ),
          ),
          SliverGap(AppSizes.h20),

          BlocBuilder<TripInfoCubit, TripInfoState>(
            builder: (context, state) {
              if (state is TripInfoLoading || state is TripInfoError) {
                return _buildSkeleton();
              }

              if (state is TripInfoLoaded) {
                return _buildDurationsList(state);
              }

              return SliverToBoxAdapter(child: const SizedBox.shrink());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSkeleton() {
    return SliverSkeletonizer(
      child: SliverList.separated(
        itemCount: 3,
        separatorBuilder: (_, __) => Gap(AppSizes.h16),
        itemBuilder: (_, index) => OptionCard.skeleton(),
      ),
    );
  }

  Widget _buildDurationsList(TripInfoLoaded state) {
    return SliverList.separated(
      itemCount: state.tripCategories.length,
      separatorBuilder: (_, __) => Gap(AppSizes.h14),
      itemBuilder: (context, index) {
        final isSelected = state.selectedStyleIndex == index;
        final durationText = state.tripCategories[index];

        return OptionCard(
          text: durationText,
          isSelected: isSelected,
          onTap: () => context.read<TripInfoCubit>().selectStyle(index),
          icon: Icons.explore,
        );
      },
    );
  }
}
