import 'package:trip_genie/core/manager/app_imports.dart';
import 'package:trip_genie/features/saves/di/saves_injection.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  authInjection();
  homeInjection();
  profileInjection();
  travelTipsInjection();
  tripInfoInjection();
  planInjection();
  savesInjection();
}
