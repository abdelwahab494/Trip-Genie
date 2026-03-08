import 'package:trip_genie/core/manager/app_imports.dart';

extension DialogsExtension on BuildContext {
  Future<bool?> showActionDialog({
    required String title,
    required String contentText,
    String? secContentText,
    String? thirdContentText,
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
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                contentText,
                style: AppFonts.inter14SemiBold(context).copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: AppSizes.sp12,
                ),
              ),
              if (secContentText != null)
                Text(
                  secContentText,
                  style: AppFonts.inter14SemiBold(context).copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: AppSizes.sp12,
                  ),
                ),
              if (thirdContentText != null)
                Text(
                  thirdContentText,
                  style: AppFonts.inter14SemiBold(context).copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: AppSizes.sp12,
                  ),
                ),
            ],
          ),
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
