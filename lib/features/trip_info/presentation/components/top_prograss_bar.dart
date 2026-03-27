import 'package:trip_genie/core/manager/app_imports.dart';

class TopPrograssBar extends StatelessWidget {
  const TopPrograssBar({super.key, required this.pagesCount});
  final int pagesCount;

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            spacing: AppSizes.h8,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${s.step} {state.currentPage + 1} ${s.Of} $pagesCount",
                    // style: AppFonts.inter12bold(context),
                  ),
                  Text(
                    "{(((state.currentPage + 1) / pagesCount) * 100).round()}% ${s.complete}",
                    // style: AppFonts.inter12reqular(context),
                  ),
                ],
              ),
              LinearProgressIndicator(
                // value: (state.currentPage + 1) / pagesCount,
                value: 0.3,
                color: Theme.of(context).colorScheme.primary,
                minHeight: AppSizes.h6,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(child: Divider(color: Colors.grey.shade100)),
      ],
    );
  }
}
