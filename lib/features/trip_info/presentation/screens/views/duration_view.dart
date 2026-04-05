import 'package:skeletonizer/skeletonizer.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class DurationView extends StatelessWidget {
  const DurationView({super.key});

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              s.howlongisyourjourney,
              style: AppFonts.inter30Bold(
                context,
              ).copyWith(color: context.firstText),
            ),
          ),
          SliverGap(AppSizes.h12),
          SliverToBoxAdapter(
            child: Text(
              s.chooseTheDuration,
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
      itemCount: state.tripDurationsList.length,
      separatorBuilder: (_, __) => Gap(AppSizes.h14),
      itemBuilder: (context, index) {
        final isSelected = state.selectedDurationIndex == index;
        final durationText = state.tripDurationsList[index];

        return OptionCard(
          text: durationText,
          isSelected: isSelected,
          onTap: () => context.read<TripInfoCubit>().selectDuration(index),
          icon: Icons.access_time_filled,
        );
      },
    );
  }
}
