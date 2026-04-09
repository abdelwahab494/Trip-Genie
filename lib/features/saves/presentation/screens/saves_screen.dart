import 'package:trip_genie/core/manager/app_imports.dart';

class SavesScreen extends StatelessWidget {
  const SavesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(s.savedPlans)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverGap(AppSizes.h24),
            SliverToBoxAdapter(child: SearchField(hintText: s.search)),
            SliverGap(AppSizes.h16),
            BlocConsumer<SavesCubit, SavesState>(
              listener: (context, state) {
                if (state is SavesSuccess) {
                  context.showSuccess(state.message);
                }
                if (state is SavesFailes) {
                  context.showError(state.message);
                }
              },
              buildWhen: (previous, current) =>
                  current is SavesLoaded || current is SavesError,
              builder: (context, state) {
                if (state is SavesError) {
                  return ErrorView(
                    message: state.message,
                    onRetry: () => context.read<SavesCubit>().loadTrips(),
                    buttonLabel: s.tryAgain,
                  );
                }
                if (state is SavesLoaded) {
                  if (state.tripsList.isEmpty) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(
                          s.noSavedTripsYet,
                          style: AppFonts.inter16Medium(context).copyWith(
                            color: context.firstText,
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.sp16,
                          ),
                        ),
                      ),
                    );
                  }
                  return SavesSliverList(state: state);
                }
                return SliverToBoxAdapter();
              },
            ),
          ],
        ),
      ),
    );
  }
}
