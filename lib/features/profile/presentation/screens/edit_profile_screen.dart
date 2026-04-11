import 'package:trip_genie/core/manager/app_imports.dart';
import 'package:trip_genie/features/profile/presentation/screens/components/edit_profile_screen_body.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with FormHelperMixin {
  @override
  void initState() {
    super.initState();
    final profile = context.read<ProfileCubit>().state.profile;
    if (profile != null) {
      nameC.text = profile.name ?? '';
      emailC.text = profile.email ?? '';
      phoneC.text = profile.phoneNumber ?? '';
      bioC.text = profile.bio ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return EditProfileScreenBody(
      nameC: nameC,
      emailC: emailC,
      phoneC: phoneC,
      bioC: bioC,
      formKey: formKey,
    );
  }
}
