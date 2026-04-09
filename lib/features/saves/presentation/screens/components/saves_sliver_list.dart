import 'package:trip_genie/core/manager/app_imports.dart';

class SavesSliverList extends StatefulWidget {
  const SavesSliverList({super.key, required this.state});
  final SavesLoaded state;

  @override
  State<SavesSliverList> createState() => _SavesSliverListState();
}

class _SavesSliverListState extends State<SavesSliverList> {
  int filterSelectedindex = 0;
  bool isSelected(int index) => filterSelectedindex == index;

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    final List<String> filtersList = [
      "All",
      ...widget.state.tripsList.map((trip) => trip.cityName).toSet(),
    ];
    final List<TripModel> filteredTrips =
        List<TripModel>.from(widget.state.tripsList)
            .where(
              (trip) => filterSelectedindex != 0
                  ? trip.cityName.capitalize ==
                        filtersList[filterSelectedindex].capitalize
                  : true,
            )
            .toList();
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                filtersList.length,
                (index) => Padding(
                  padding: EdgeInsets.only(right: AppSizes.w8),
                  child: ChoiceChip(
                    label: Text(filtersList[index]),
                    selected: isSelected(index),
                    showCheckmark: false,
                    onSelected: (_) {
                      setState(() => filterSelectedindex = index);
                    },
                    selectedColor: context.primary,
                    backgroundColor: context.secBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(
                        AppSizes.r1000,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.h8,
                      horizontal: AppSizes.w16,
                    ),
                    labelPadding: EdgeInsets.zero,
                    labelStyle: AppFonts.inter14SemiBold(context).copyWith(
                      color: isSelected(index)
                          ? context.secBackground
                          : context.thirdText,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverGap(AppSizes.h18),
        SliverList.separated(
          itemCount: filteredTrips.length,
          separatorBuilder: (_, _) => Gap(AppSizes.h8),
          itemBuilder: (context, index) {
            final TripModel trip = filteredTrips[index];
            return Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppSizes.w16),
              decoration: BoxDecoration(
                color: context.secBackground,
                borderRadius: BorderRadius.circular(AppSizes.r12),
                boxShadow: [
                  BoxShadow(
                    color: context.border,
                    offset: Offset(3, 3),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child:
                        trip.places[0].images != null &&
                            trip.places[0].images!.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: trip.places[0].images![0],
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
                          trip.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.inter16Medium(context).copyWith(
                            color: context.firstText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(AppSizes.h4),
                        Wrap(
                          spacing: AppSizes.h2,
                          runSpacing: AppSizes.h2,
                          children: [
                            _infoElement(
                              context,
                              Icons.location_on_rounded,
                              trip.cityName,
                            ),
                            _infoElement(
                              context,
                              Icons.calendar_month_rounded,
                              trip.createdAt.formatDate(),
                            ),
                            _infoElement(
                              context,
                              Icons.label_important_rounded,
                              "${trip.places.length} ${s.stops}",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: context.forthText),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Padding _infoElement(BuildContext context, IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(right: AppSizes.w8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSizes.w4,
        children: [
          Icon(icon, color: context.primary),
          Text(
            text,
            style: AppFonts.aBeeZee14Regular(context).copyWith(
              color: context.forthText,
              fontWeight: FontWeight.normal,
              fontSize: AppSizes.sp12,
            ),
          ),
        ],
      ),
    );
  }
}
