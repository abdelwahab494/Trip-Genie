import 'package:trip_genie/core/manager/app_imports.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: AppSizes.w16),
            child: CircleAvatar(
              radius: AppSizes.r16,
              backgroundColor: Theme.of(context).colorScheme.surface,
              child: Icon(
                Icons.person,
                size: AppSizes.w16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return const Text('Loading...');
              }
              if (state is UserLoaded) {
                return RichText(
                  text: TextSpan(
                    text: "Hello, ",
                    style: AppFonts.inter16Medium(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                    children: [
                      TextSpan(
                        text: state.user.name ?? "User",
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
                await AuthRepoImpl(AuthService()).signOut();
              },
            ),
          ),
        ),
      ],
    );
  }
}
