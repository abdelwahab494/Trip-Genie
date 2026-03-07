import 'package:trip_genie/core/manager/app_imports.dart';

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
              create: (context) => HomeCubit(
                HomeRepoImpl(citiesDatabaseService: CitiesDatabaseService()),
              ), // Pass the GeminiService to the HomeRepoImpl
            ),
            BlocProvider(
              create: (context) => TravelTipsCubit(
                TravelTipsRepoImpl(TravelTipsService()),
              ), // Pass the GeminiService to the TravelTipsRepoImp
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
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home: AuthGate(),
          ),
        );
      },
    );
  }
}
