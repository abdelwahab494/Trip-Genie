import 'package:trip_genie/core/manager/app_imports.dart';

import 'package:trip_genie/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:trip_genie/features/profile/presentation/screens/view_profile_screen.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );
      case AppRoutes.viewProfile:
        return MaterialPageRoute(builder: (context) => ViewProfileScreen());
      case AppRoutes.editProfile:
        return MaterialPageRoute(builder: (context) => EditProfileScreen());
      default:
        return MaterialPageRoute(builder: (context) => NoRouteView());
    }
  }
}

class NoRouteView extends StatelessWidget {
  const NoRouteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('No Route Found')));
  }
}
