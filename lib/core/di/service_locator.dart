import 'package:trip_genie/core/manager/app_imports.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  authInjection();
  homeInjection();
  profileInjection();
  travelTipsInjection();
  tripInfoInjection();
  planInjection();
}
