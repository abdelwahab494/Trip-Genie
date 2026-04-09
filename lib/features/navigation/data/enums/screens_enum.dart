import 'package:trip_genie/core/manager/app_imports.dart';

enum ScreensEnum {
  home(
    lable: "Home",
    screen: HomeScreen(),
    selectedIcon: Icons.home_rounded,
    unSelectedIcon: Icons.home_outlined,
  ),
  explore(
    lable: "Explore",
    screen: Scaffold(),
    selectedIcon: Icons.explore_rounded,
    unSelectedIcon: Icons.explore_outlined,
  ),
  saves(
    lable: "Saves",
    screen: SavesScreen(),
    selectedIcon: Icons.bookmark_rounded,
    unSelectedIcon: Icons.bookmark_outline,
  ),
  settings(
    lable: "Settings",
    screen: Scaffold(),
    selectedIcon: Icons.settings_rounded,
    unSelectedIcon: Icons.settings_outlined,
  );

  final String lable;
  final Widget screen;
  final IconData selectedIcon;
  final IconData unSelectedIcon;

  const ScreensEnum({
    required this.lable,
    required this.screen,
    required this.selectedIcon,
    required this.unSelectedIcon,
  });
}
