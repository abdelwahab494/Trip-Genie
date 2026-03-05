import 'package:trip_genie/core/manager/app_imports.dart';
import 'package:trip_genie/core/networking/gemini_service/gemini_service.dart';
import 'package:trip_genie/core/routing/routing.dart';
import 'package:trip_genie/features/travel_tips/data/repo/travel_tips_repo_imp.dart';
import 'package:trip_genie/features/travel_tips/data/travel_tips_cubit/cubit/travel_tips_cubit.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeCubit(HomeRepoImp(citiesDatabase: CitiesDatabase(), geminiService: GeminiService(), )), // Pass the GeminiService to the HomeRepoImp
            ),
            BlocProvider(
                create: (context) => TravelTipsCubit(TravelTipsRepoImpl( GeminiService() )), // Pass the GeminiService to the TravelTipsRepoImp
              ),
           
          ],
          child: MaterialApp(
            onGenerateRoute: Routing.generateRoute,
            title: 'Trip Genie',
            locale: const Locale("en"),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: getLightTheme(),
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home: HomeView(),
          ),
        );
      },
    );
  }
}
