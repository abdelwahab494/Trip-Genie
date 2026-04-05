import 'package:skeletonizer/skeletonizer.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return SliverAppBar(
      floating: true,
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: AppSizes.w16),
            child: CircleAvatar(
              radius: AppSizes.r16,
              backgroundColor: context.secBackground,
              child: Icon(
                Icons.person,
                size: AppSizes.w16,
                color: context.primary,
              ),
            ),
          ),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return Skeletonizer(
                  effect: ShimmerEffect(
              baseColor: Colors.grey.shade500,
              highlightColor: Colors.white,
            ),
                  child: RichText(
                    text: TextSpan(
                      text: s.hello,
                      style: AppFonts.inter16Medium(
                        context,
                      ).copyWith(color: context.firstText),
                      children: [
                        TextSpan(
                          text: s.user,
                          style: AppFonts.inter16Medium(context).copyWith(
                            color: context.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (state is UserLoaded) {
                return RichText(
                  text: TextSpan(
                    text: s.hello,
                    style: AppFonts.inter16Medium(
                      context,
                    ).copyWith(color: context.firstText),
                    children: [
                      TextSpan(
                        text: state.user.name ?? s.user,
                        style: AppFonts.inter16Medium(context).copyWith(
                          color: context.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return RichText(
                text: TextSpan(
                  text: s.hello,
                  style: AppFonts.inter16Medium(
                    context,
                  ).copyWith(color: context.firstText),
                  children: [
                    TextSpan(
                      text: "...",
                      style: AppFonts.inter16Medium(context).copyWith(
                        color: context.primary,
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
            backgroundColor: context.secBackground,
            child: IconButton(
              icon: Icon(Icons.notifications, size: AppSizes.w16),
              color: context.primary,
              onPressed: () async {
                await AuthRepoImpl(AuthService()).signOut();
                if (context.mounted) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (c) => LoginScreen()),
                    (route) => false,
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
