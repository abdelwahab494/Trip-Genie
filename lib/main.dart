import 'core/manager/app_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://dbkqsmuwrlngryjpvjgx.supabase.co',
    anonKey: 'sb_publishable_XSAurIex_QX1J56ejomTMA_S2ndZYAD',
  );
  runApp(const MyApp());
}
