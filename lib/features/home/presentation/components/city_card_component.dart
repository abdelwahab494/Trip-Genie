import 'package:trip_genie/core/manager/app_imports.dart';
import 'package:trip_genie/core/shared/widgets/cached_image_widget.dart';

class CityCard extends StatelessWidget {
  final CityModel city;

  const CityCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.of(
      //   context,
      // ).push(MaterialPageRoute(builder: (c) => TripExploreView(citiesModel: city,))),
      child: Container(
        margin: EdgeInsets.only(
          bottom: AppSizes.h16,
          right: AppSizes.w16,
          left: AppSizes.w16,
        ),
        height: AppSizes.h400,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedImageWidget(imageUrl: city.images!.first),

            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.grey.shade900.withValues(alpha: 0.7),
                    Colors.grey.shade900.withValues(alpha: 0.9),
                  ],
                  stops: const [0.3, 0.6, 1.0],
                ),
              ),
            ),

            // Content
            Positioned(
              left: AppSizes.w16,
              right: AppSizes.w16,
              bottom: AppSizes.h16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(city.name, style: AppFonts.inter24Bold(context)),
                  Gap(AppSizes.h4),
                  Text(
                    city.description!,
                    style: AppFonts.aBeeZee4Bold(context),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(AppSizes.h12),
                  ExploreButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
