import 'package:trip_genie/core/manager/app_imports.dart';

class TripReplaceSheet extends StatelessWidget {
  const TripReplaceSheet({
    super.key,
    required this.visitTime,
    required this.cityName,
    required this.replacedPlace,
    required this.places,
  });
  final String visitTime;
  final String cityName;
  final String replacedPlace;
  final List<PlacesModel> places;

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        minWidth: double.infinity,
      ),
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
      decoration: BoxDecoration(
        color: context.secBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.r20),
          topRight: Radius.circular(AppSizes.r20),
        ),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: AppSizes.w1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: AppSizes.w60,
              height: AppSizes.h5,
              margin: EdgeInsets.symmetric(
                horizontal: AppSizes.w16,
                vertical: AppSizes.h8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.r1000),
                color: context.border,
              ),
            ),
          ),
          Gap(AppSizes.h8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                s.alternativePlaces,
                style: AppFonts.inter24Bold(
                  context,
                ).copyWith(color: context.primary, fontSize: AppSizes.sp20),
              ),
              CloseButton(),
            ],
          ),
          Gap(AppSizes.h8),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.w16,
              vertical: AppSizes.h8,
            ),
            decoration: BoxDecoration(
              color: context.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSizes.r8),
              border: BorderDirectional(
                start: BorderSide(width: 3, color: context.primary),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RichText(
                  text: TextSpan(
                    style: AppFonts.inter14SemiBold(
                      context,
                    ).copyWith(color: context.firstText),
                    children: [
                      TextSpan(text: s.suggestionsforyour),
                      TextSpan(text: " "),
                      TextSpan(
                        text: visitTime.capitalize,
                        style: AppFonts.inter14SemiBold(
                          context,
                        ).copyWith(color: context.primary),
                      ),
                      TextSpan(text: " "),
                      TextSpan(text: s.tripin),
                      TextSpan(text: " "),
                      TextSpan(
                        text: cityName,
                        style: AppFonts.inter14SemiBold(
                          context,
                        ).copyWith(color: context.primary),
                      ),
                    ],
                  ),
                ),
                Gap(AppSizes.h4),
                Text(
                  s.replacingyourmissedslotat + replacedPlace,
                  style: AppFonts.inter14SemiBold(context).copyWith(
                    // color: context.primary.withValues(alpha: 0.5),
                    color: context.forthText,
                    fontSize: AppSizes.sp12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Gap(AppSizes.h16),
          Expanded(
            child: ListView.separated(
              itemCount: places.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final PlacesModel place = places[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: place.images != null && place.images!.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: place.images![0],
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  width: 80,
                                  height: 80,
                                  color: Colors.grey[300],
                                ),
                                errorWidget: (context, url, error) => Container(
                                  width: 80,
                                  height: 80,
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.image_not_supported),
                                ),
                              )
                            : Container(
                                width: 80,
                                height: 80,
                                color: Colors.grey[300],
                                child: const Icon(Icons.image_not_supported),
                              ),
                      ),
                      Gap(AppSizes.w12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              place.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppFonts.inter16Medium(context).copyWith(
                                color: context.firstText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gap(AppSizes.h4),
                            if (place.description != null &&
                                place.description!.isNotEmpty)
                              Text(
                                place.description!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppFonts.inter14SemiBold(context)
                                    .copyWith(
                                      color: context.forthText,
                                      fontSize: AppSizes.sp12,
                                    ),
                              ),
                            Gap(AppSizes.h6),
                            if (place.category != null &&
                                place.category!.isNotEmpty)
                              Row(
                                children: [
                                  Icon(
                                    Icons.map_rounded,
                                    size: AppSizes.r16,
                                    color: context.primary,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    place.category!.capitalize,
                                    style: AppFonts.inter14SemiBold(context)
                                        .copyWith(
                                          color: context.primary,
                                          fontWeight: FontWeight.w500,
                                          fontSize: AppSizes.sp12,
                                        ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 4),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(place);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context.primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.w20,
                              vertical: AppSizes.h10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            s.add,
                            style: TextStyle(
                              fontSize: AppSizes.sp14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
