import 'package:trip_genie/core/manager/app_imports.dart';

class ViewProfileTextfieldsSection extends StatelessWidget {
  const ViewProfileTextfieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final profile = state.profile;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ViewProfileField(title: s.username, value: profile?.name),
            Gap(AppSizes.h16),
            _ViewProfileField(
              title: s.email,
              value: profile?.email,
            
              showAddButton: false,
            ),
            Gap(AppSizes.h16),
            _ViewProfileField(
              title: s.phoneNumber,
              value: profile?.phoneNumber,
            ),
            Gap(AppSizes.h16),
            _ViewProfileField(title: s.bio, value: profile?.bio,),
            Gap(AppSizes.h16),
          ],
        );
      },
    );
  }
}

class _ViewProfileField extends StatelessWidget {
  const _ViewProfileField({
    required this.title,
    required this.value,
   
    this.showAddButton = true,
  });

  final String title;
  final String? value;
 
  final bool showAddButton;

  bool get _isEmpty => value == null || value!.trim().isEmpty;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.inter14SemiBold(
            context,
          ).copyWith(color: theme.colorScheme.tertiary),
        ),
        Gap(AppSizes.h8),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
             
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.w12,
                vertical: AppSizes.h12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSizes.r8),
                border: Border.all(
                  color: theme.colorScheme.tertiary.withValues(alpha: 0.2),
                ),
              ),
              child: Text(
                textAlign: TextAlign.start,
                _isEmpty ? 'NOT SET' : value!,
            
                style: AppFonts.inter16Medium(
                  context,
                ).copyWith(fontSize: AppSizes.sp14, color: Colors.grey),
              ),
            ),

          
            if (_isEmpty && showAddButton)
              Positioned(
                right: AppSizes.w10,
                child: InkWell(
                  onTap: () =>    Navigator.of(context).pushNamed(AppRoutes.editProfile),
                  child: Container(
                    padding: EdgeInsets.all(AppSizes.h4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(AppSizes.r8),
                    ),
                    child: Text(
                      'Add +',
                      style: AppFonts.inter16Medium(
                        context,
                      ).copyWith(color: theme.colorScheme.primary),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
