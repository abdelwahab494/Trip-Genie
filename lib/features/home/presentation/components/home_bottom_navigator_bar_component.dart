import 'package:trip_genie/core/manager/app_imports.dart';

class HomeBottomNavigationBarComponent extends StatefulWidget {
  const HomeBottomNavigationBarComponent({super.key});

  @override
  State<HomeBottomNavigationBarComponent> createState() =>
      _HomeBottomNavigationBarComponentState();
}

class _HomeBottomNavigationBarComponentState
    extends State<HomeBottomNavigationBarComponent> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.r25),
          topRight: Radius.circular(AppSizes.r25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 25,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(
            context,
          ).colorScheme.secondary.withValues(alpha: 0.6),
          items: [
            _buildNavItem(Icons.home_outlined, Icons.home_rounded, 0),
            _buildNavItem(Icons.explore_outlined, Icons.explore_rounded, 1),
            _buildNavItem(Icons.bookmark_outline, Icons.bookmark_rounded, 2),
            _buildNavItem(Icons.settings_outlined, Icons.settings_rounded, 3),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    IconData activeIcon,
    int index,
  ) {
    bool isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(isSelected ? 4 : 0),
        child: Icon(isSelected ? activeIcon : icon, size: isSelected ? 30 : 26),
      ),
      label: '',
    );
  }
}
