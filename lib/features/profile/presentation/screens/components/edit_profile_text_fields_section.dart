import 'package:flutter/services.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class EditProfileTextFieldsSection extends StatelessWidget {
  final TextEditingController nameC;
  final TextEditingController emailC;
  final TextEditingController phoneC;
  final TextEditingController bioC;
  final GlobalKey<FormState> formKey;
  final String? Function(String?)? phoneValidator;

  const EditProfileTextFieldsSection({
    super.key,
    required this.nameC,
    required this.emailC,
    required this.phoneC,
    required this.bioC,
    required this.formKey,
    this.phoneValidator,
  });

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);

    return BlocBuilder<ProfileCubit, ProfileState>(

      buildWhen: (prev, curr) =>
          prev.isUpdating != curr.isUpdating ||
          prev.profile != curr.profile,
      builder: (context, state) {
        if (state.profile == null) {
          return Center(child: Text(state.errorMessage ?? 'No Profile Found'));
        }

        final bool locked = state.isUpdating;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: nameC,
              readOnly: locked,
              fieldTypesEnum: TextFieldTypesEnum.text,
              showPastButton: true,
              title: s.username,
              hint: s.enterYourName,
            ),
            Gap(AppSizes.h16),
            CustomTextField(
              controller: emailC,
              readOnly: true,
              fieldTypesEnum: TextFieldTypesEnum.email,
              showPastButton: false,
              title: s.email,
              hint: '',
            ),
            Gap(AppSizes.h16),
            CustomTextField(
              controller: phoneC,
              readOnly: locked,
              fieldTypesEnum: TextFieldTypesEnum.phone,
              showPastButton: true,
              title: s.phoneNumber,
              hint: s.phonePlaceholder,
              validator: phoneValidator,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11),
              ],
            ),
            Gap(AppSizes.h16),
            CustomTextField(
              controller: bioC,
              readOnly: locked,
              fieldTypesEnum: TextFieldTypesEnum.bio,
              showPastButton: true,
              title: s.bio,
              hint: s.bioPlaceholder,
              maxLines: 4,
            ),
          ],
        );
      },
    );
  }
}