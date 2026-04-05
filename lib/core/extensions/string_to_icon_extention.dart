import 'package:trip_genie/core/manager/app_imports.dart';

extension StringToIconExtention on String {
  IconData get toIcon {
    switch (this) {
      case 'map':
        return Icons.map;
      case 'restaurant':
        return Icons.restaurant;
      case 'local_taxi':
        return Icons.local_taxi;
      case 'attach_money':
        return Icons.attach_money;
      case 'security':
        return Icons.security;
      case 'language':
        return Icons.language;
      case 'flight':
        return Icons.flight;
      case 'hotel':
        return Icons.hotel;
      case 'directions_walk':
        return Icons.directions_walk;
      case 'museum':
        return Icons.museum;
      case 'camera_alt':
        return Icons.camera_alt;
      case 'shopping_bag':
        return Icons.shopping_bag;
      default:
        return Icons.travel_explore;
    }
  }
}
