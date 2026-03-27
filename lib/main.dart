import 'core/manager/app_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await PrefsHelper.init();

  OneSignal.Debug.setLogLevel(OSLogLevel.none);
  OneSignal.initialize(Env.oneSignalKey);
  OneSignal.Notifications.requestPermission(true);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(url: Env.supabaseUrl, anonKey: Env.supabaseAnonKey);

  runApp(const MyApp());
}
