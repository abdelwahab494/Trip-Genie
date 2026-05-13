import 'package:trip_genie/core/manager/app_imports.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({
    super.key,
    this.onChangePicture,
    this.isViewProfile = false,
  });

  final void Function()? onChangePicture;
  final bool isViewProfile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (prev, curr) =>
                  prev.isUploadingImage != curr.isUploadingImage ||
                  prev.profile?.imagePath != curr.profile?.imagePath,
              builder: (context, state) {
                if (state.isUploadingImage) {
                  return const CircleAvatar(
                    radius: 40,
                    child: CircularProgressIndicator(),
                  );
                }

                final imagePath = state.profile?.imagePath;

                return CircleAvatar(
                  radius: 40,
                  child: imagePath != null && imagePath.isNotEmpty
                      ? ClipOval(
                          child: Image.network(
                            imagePath,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.person, size: 26),
                          ),
                        )
                      : const Icon(Icons.person, size: 26),
                );
              },
            ),

            if (!isViewProfile)
              GestureDetector(
                onTap: onChangePicture,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: theme.colorScheme.primary,
                  child: const Icon(Icons.edit, color: Colors.white, size: 14),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
