import 'package:trip_genie/core/manager/app_imports.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependency(String env) => getIt.init(environment: env);

abstract class InjectionEnv {
  static const String dev = 'dev';
}
