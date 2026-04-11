import 'package:skeletonizer/skeletonizer.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: AppSizes.w16),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (prev, curr) =>
                  prev.isUploadingImage != curr.isUploadingImage ||
                  prev.profile?.imageUrl != curr.profile?.imageUrl,
              builder: (context, state) {
                final imageUrl = state.profile?.imageUrl;
                return GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: CircleAvatar(
                    radius: AppSizes.r16,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: state.isUploadingImage
                        ? SizedBox(
                            width: AppSizes.w16,
                            height: AppSizes.w16,
                            child: CircularProgressIndicator(
                              strokeWidth: 1.5,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          )
                        : imageUrl != null && imageUrl.isNotEmpty
                        ? ClipOval(
                            child: Image.network(
                              imageUrl,
                              width: AppSizes.r16 * 2,
                              height: AppSizes.r16 * 2,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Icon(
                                Icons.person,
                                size: AppSizes.w16,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          )
                        : Icon(
                            Icons.person,
                            size: AppSizes.w16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                  ),
                );
              },
            ),
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Skeletonizer(
                  effect: ShimmerEffect(
                    baseColor: Colors.grey.shade500,
                    highlightColor: Colors.white,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: "Hello, ",
                      style: AppFonts.inter16Medium(context).copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      children: [
                        TextSpan(
                          text: "User",
                          style: AppFonts.inter16Medium(context).copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (state.profile != null) {
                return RichText(
                  text: TextSpan(
                    text: "Hello, ",
                    style: AppFonts.inter16Medium(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                    children: [
                      TextSpan(
                        text: state.profile!.name!.isNotEmpty
                            ? state.profile!.name!
                            : "user",
                        style: AppFonts.inter16Medium(context).copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return RichText(
                text: TextSpan(
                  text: "Trip",
                  style: AppFonts.inter16Medium(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                  children: [
                    TextSpan(
                      text: "Genie",
                      style: AppFonts.inter16Medium(context).copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: AppSizes.w16),
          child: CircleAvatar(
            radius: AppSizes.r16,
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: IconButton(
              icon: Icon(Icons.notifications, size: AppSizes.w16),
              color: Theme.of(context).colorScheme.primary,
              onPressed: () async {
                AuthService().signOut();
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
            ),
          ),
        ),
      ],
    );
  }
}
