import 'package:trip_genie/core/manager/app_imports.dart';

class KpisRow extends StatelessWidget {
  const KpisRow({super.key, required this.tripDuration, required this.stops});
  final String tripDuration;
  final int stops;

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: AppSizes.h16,
      children: [
        Container(
          padding: EdgeInsets.all(AppSizes.w16),
          decoration: BoxDecoration(
            color: context.secBackground,
            borderRadius: BorderRadius.circular(AppSizes.r12),
            border: Border.all(
              color: context.primary.withValues(alpha: 0.4),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 5,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.totalDuration.toUpperCase(),
                  style: GoogleFonts.inter(
                    color: context.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.sp12,
                  ),
                ),
                Text(
                  tripDuration,
                  style: AppFonts.inter24Bold(
                    context,
                  ).copyWith(color: context.firstText),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(AppSizes.w16),
          decoration: BoxDecoration(
            color: context.secBackground,
            borderRadius: BorderRadius.circular(AppSizes.r12),
            border: Border.all(
              color: context.primary.withValues(alpha: 0.4),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 5,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.totalStops.toUpperCase(),
                  style: GoogleFonts.inter(
                    color: context.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.sp12,
                  ),
                ),
                Text(
                  "$stops stops",
                  style: AppFonts.inter24Bold(
                    context,
                  ).copyWith(color: context.firstText),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
