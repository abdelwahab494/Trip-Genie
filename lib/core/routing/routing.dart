import 'package:trip_genie/core/manager/app_imports.dart';
import 'package:trip_genie/core/routing/routes.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
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
