import 'package:trip_genie/core/manager/app_imports.dart';

class BottomActionButton extends StatelessWidget {
  const BottomActionButton({
    super.key,
    required this.pageController,
    required this.pagesLenght,
  });
  final PageController pageController;
  final int pagesLenght;

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(
        AppSizes.w16,
        AppSizes.h10,
        AppSizes.h16,
        AppSizes.h50,
      ),
      child: FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: AppSizes.h20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(AppSizes.r12),
          ),
        ),
        child: Text(
          // state.currentPage != pagesLenght - 1
          true ? s.Continue : s.generateMyPlan,
          // style: AppFonts.inter16bold(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
