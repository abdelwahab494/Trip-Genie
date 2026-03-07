import 'package:trip_genie/core/manager/app_imports.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: Colors.grey.shade200,
        child: const Center(
          child: CircularProgressIndicator(
            // color: AppColors.primary,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey.shade300,
        child: const Icon(
          Icons.broken_image_outlined,
          size: 40,
          color: Colors.grey,
        ),
      ),
    );
  }
}
