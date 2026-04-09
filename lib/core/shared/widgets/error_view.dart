import 'package:trip_genie/core/manager/app_imports.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.message,
    required this.onRetry,
    required this.buttonLabel,
  });
  final String message;
  final String buttonLabel;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        spacing: AppSizes.h20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: AppFonts.inter16Medium(context).copyWith(
              color: context.firstText,
              fontWeight: FontWeight.bold,
              fontSize: AppSizes.sp16,
            ),
          ),
          FilledButton.tonalIcon(
            onPressed: onRetry,
            style: FilledButton.styleFrom(
              backgroundColor: context.primary,
              foregroundColor: context.secBackground,
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.h10,
                horizontal: AppSizes.w25,
              ),
              shape: RoundedSuperellipseBorder(
                borderRadius: BorderRadiusGeometry.circular(AppSizes.r500),
                side: BorderSide(width: 3, color: context.primary),
              ),
              iconSize: AppSizes.r25,
            ),
            label: Text(buttonLabel),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
