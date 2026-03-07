import 'core/manager/app_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://opcjgwvwwuaamumuvtwk.supabase.co',
    anonKey: 'sb_publishable_agK9qiHQxmWWXR4yMGakKA_XO8i1BSt',
  );
  // Gemini.init(apiKey: "AIzaSyABlVOiQmaO8VFsUFlufaIrlxyGhPLRKvk");
  runApp(const MyApp());
}
