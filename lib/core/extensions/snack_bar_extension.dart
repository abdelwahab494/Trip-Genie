import 'package:trip_genie/core/manager/app_imports.dart';

extension SnackBarExtension on BuildContext {
  void showSuccess(String message) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
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
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
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
}
