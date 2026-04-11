import 'package:trip_genie/core/manager/app_imports.dart';

class ViewProfileScreenBody extends StatefulWidget {
  const ViewProfileScreenBody({super.key});

  @override
  State<ViewProfileScreenBody> createState() => _ViewProfileScreenBodyState();
}

class _ViewProfileScreenBodyState extends State<ViewProfileScreenBody> {
  @override
  Widget build(BuildContext context) {
    // final userId = context.read<ProfileCubit>().state.userId;
    final s = S.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: theme.colorScheme.tertiary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          s.profile,
          style: AppFonts.inter14SemiBold(context).copyWith(
            fontSize: AppSizes.sp16,
            color: theme.colorScheme.tertiary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.editProfile),
            child: Text(
              s.edit,
              style: AppFonts.inter14SemiBold(context).copyWith(
                color: theme.colorScheme.primary,
                fontSize: AppSizes.sp14,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null && state.profile == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Please try again'),
                  Gap(AppSizes.h16),
                  CustomFilledButton(
                    title: s.retry,
                    onPressed: () =>
                        context.read<ProfileCubit>().getProfile(),
                  ),
                ],
              ),
            );
          }

          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.w20,
                vertical: AppSizes.h16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ProfileHeaderSection(isViewProfile: true),
                  Gap(AppSizes.h28),
                  ViewProfileTextfieldsSection(),
                  Gap(AppSizes.h20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
