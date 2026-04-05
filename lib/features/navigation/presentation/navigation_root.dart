import 'package:trip_genie/core/manager/app_imports.dart';

class NavigationRoot extends StatefulWidget {
  const NavigationRoot({super.key});

  @override
  State<NavigationRoot> createState() => _NavigationRootState();
}

class _NavigationRootState extends State<NavigationRoot> {
  int currentIndex = 0;
  bool isSelected(int index) => currentIndex == index;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: ScreensEnum.values.map((e) => e.screen).toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: ScreensEnum.values.asMap().entries.map((entry) {
            final index = entry.key;
            final e = entry.value;
            return BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.w18,
                  vertical: AppSizes.h8,
                ),
                margin: EdgeInsets.only(bottom: AppSizes.w4, top: AppSizes.h4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.r500),
                  color: isSelected(index)
                      ? context.primary.withValues(alpha: 0.2)
                      : Colors.transparent,
                ),
                child: Icon(
                  isSelected(index) ? e.selectedIcon : e.unSelectedIcon,
                ),
              ),
              label: e.lable,
              tooltip: e.lable,
            );
          }).toList(),
        ),
      ),
    );
  }
}
