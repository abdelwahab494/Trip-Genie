import 'package:trip_genie/core/manager/app_imports.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
  });
  final String imageUrl;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      placeholder: (context, url) => Container(
        color: context.forthText.withValues(alpha: 0.2),
        child: const Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => Container(
        color: context.forthText.withValues(alpha: 0.3),
        child: Icon(
          Icons.broken_image_outlined,
          size: 40,
          color: context.forthText,
        ),
      ),
    );
  }
}
