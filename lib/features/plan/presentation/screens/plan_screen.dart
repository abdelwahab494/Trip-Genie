import 'package:trip_genie/core/manager/app_imports.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({
    super.key,
    required this.tripDuration,
    required this.tripStyle,
    required this.placesList,
  });
  final String tripDuration;
  final String tripStyle;
  final List<PlacesModel> placesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
