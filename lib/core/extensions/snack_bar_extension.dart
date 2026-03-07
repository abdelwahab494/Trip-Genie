import 'package:trip_genie/core/manager/app_imports.dart';

extension SnackBarExtension on BuildContext {
  void showSuccess(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          spacing: AppSizes.w10,
          children: [
            Icon(Icons.check_circle_outline, color: Colors.white),
            Flexible(
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppSizes.sp12,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        margin: EdgeInsets.symmetric(
          horizontal: AppSizes.w16,
          vertical: AppSizes.h8,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
        elevation: 0,
      ),
    );
  }

  void showError(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          spacing: AppSizes.w10,
          children: [
            Icon(Icons.error_outline, color: Colors.white),
            Flexible(
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppSizes.sp12,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        margin: EdgeInsets.symmetric(
          horizontal: AppSizes.w16,
          vertical: AppSizes.h8,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
        elevation: 0,
      ),
    );
  }

  Future<bool?> showActionDialog({
    required String title,
    required String contentText,
    required String action,
  }) {
    return showDialog<bool?>(
      context: this,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: AppSizes.sp24,
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
          content: Text(
            contentText,
            style: AppFonts.inter14SemiBold(context).copyWith(
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: AppSizes.sp12,
            ),
          ),
          // contentTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
          //   color: LightColors.textPrimary,
          //   fontSize: AppSizes.sp12,
          // ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).textTheme.bodyMedium!.color,
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: AppSizes.sp16,
                ),
              ),
              child: Text(action),
            ),
          ],
          backgroundColor: LightColors.background,
          contentPadding: EdgeInsetsGeometry.fromLTRB(
            AppSizes.w25,
            AppSizes.h12,
            AppSizes.w25,
            AppSizes.h12,
          ),
          actionsPadding: EdgeInsetsGeometry.fromLTRB(
            AppSizes.w25,
            AppSizes.h0,
            AppSizes.w25,
            AppSizes.h16,
          ),
        );
      },
    );
  }
}
