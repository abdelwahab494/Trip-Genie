import 'package:flutter_gemini/flutter_gemini.dart';

import 'core/manager/app_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://dbkqsmuwrlngryjpvjgx.supabase.co',
    anonKey: 'sb_publishable_XSAurIex_QX1J56ejomTMA_S2ndZYAD',
  );
  Gemini.init(apiKey: "AIzaSyABlVOiQmaO8VFsUFlufaIrlxyGhPLRKvk");
  runApp(const MyApp());
}
