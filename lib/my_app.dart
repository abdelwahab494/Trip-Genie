import 'package:trip_genie/core/manager/app_imports.dart';
import 'package:trip_genie/core/routing/routing.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) =>
              HomeCubit(HomeRepoImp(citiesDatabase: CitiesDatabase())),
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
