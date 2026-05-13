import 'package:trip_genie/core/manager/app_imports.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (prev, curr) =>
                  prev.isUploadingImage != curr.isUploadingImage ||
                  prev.profile?.imagePath != curr.profile?.imagePath,
              builder: (context, state) {
                final imagePath = state.profile?.imagePath;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      spacing: 2,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRoutes.viewProfile,
                          ),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.surface,
                            child: state.isUploadingImage
                                ? SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 1.5,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                  )
                                : imagePath != null && imagePath.isNotEmpty
                                ? ClipOval(
                                    child: Image.network(
                                      imagePath,
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => Icon(
                                        Icons.person,
                                        size: AppSizes.w16,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                    ),
                                  )
                                : Icon(
                                    Icons.person,
                                    size: AppSizes.w16,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                state.profile?.name ?? 'User',
                                style: AppFonts.inter14SemiBold(context)
                                    .copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                              ),
                              Gap(AppSizes.h4),
                              Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                state.profile?.bio ?? 'User',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.normal,
                                  fontSize: AppSizes.sp12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.viewProfile),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.w12,
                          vertical: AppSizes.h6,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(AppSizes.r8),
                        ),
                        child: Text(
                          'View Profile',
                          style: AppFonts.inter14SemiBold(context).copyWith(
                            color: Colors.white,
                            fontSize: AppSizes.sp12,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
