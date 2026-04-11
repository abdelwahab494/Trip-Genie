import 'package:trip_genie/core/manager/app_imports.dart';

import 'package:trip_genie/features/profile/presentation/screens/components/view_profile_screen_body.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({super.key});

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return ViewProfileScreenBody();
  }
}
