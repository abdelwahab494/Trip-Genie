import 'dart:io';
import 'package:trip_genie/core/manager/app_imports.dart';

class EditProfileScreenBody extends StatefulWidget {
  const EditProfileScreenBody({
    super.key,
    required this.nameC,
    required this.emailC,
    required this.phoneC,
    required this.bioC,
    required this.formKey,
    this.phoneValidator,
  });

  final TextEditingController nameC;
  final TextEditingController emailC;
  final TextEditingController phoneC;
  final TextEditingController bioC;
  final GlobalKey<FormState> formKey;
  final String? Function(String?)? phoneValidator;

  @override
  State<EditProfileScreenBody> createState() => _EditProfileScreenBodyState();
}

class _EditProfileScreenBodyState extends State<EditProfileScreenBody> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (prev, curr) =>
          prev.updateSuccess != curr.updateSuccess ||
          prev.errorMessage != curr.errorMessage ||
          prev.imageErrorMessage != curr.imageErrorMessage,
      listener: (context, state) {
        if (state.updateSuccess) {
          Navigator.of(context).pop();
        }
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
        if (state.imageErrorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.imageErrorMessage!)));
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: theme.scaffoldBackgroundColor,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.close),
            color: theme.colorScheme.tertiary,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            s.editProfile,
            style: AppFonts.inter14SemiBold(context).copyWith(
              fontSize: AppSizes.sp16,
              color: theme.colorScheme.tertiary,
            ),
          ),

          actions: [
            BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (prev, curr) => prev.isUpdating != curr.isUpdating,
              builder: (context, state) {
                if (state.isUpdating) {
                  return const Padding(
                    padding: EdgeInsets.all(14),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                }
                return IconButton(
                  onPressed: () {
                    if (widget.formKey.currentState!.validate()) {
                      final updatedModel = context
                          .read<ProfileCubit>()
                          .state
                          .profile!
                          .copyWith(
                            name: widget.nameC.text.trim(),
                            phoneNumber: widget.phoneC.text.trim(),
                            bio: widget.bioC.text.trim(),
                          );
                      context.read<ProfileCubit>().updateProfile(updatedModel);
                    }
                  },
                  icon: Icon(Icons.check, color: theme.colorScheme.primary),
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.w20,
              vertical: AppSizes.h16,
            ),
            child: Form(
              key: widget.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ProfileHeaderSection(
                    isViewProfile: false,
                    onChangePicture: () async {
                      final ProfileCubit profileCubit = context.read<ProfileCubit>();
                      final source = await showModalBottomSheet<ImageSource>(
                        context: context,
                        builder: (_) => SafeArea(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.camera_alt_outlined),
                                title: Text('camera'),
                                onTap: () =>
                                    Navigator.pop(context, ImageSource.camera),
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.photo_library_outlined,
                                ),
                                title: Text('gallery'),
                                onTap: () =>
                                    Navigator.pop(context, ImageSource.gallery),
                              ),
                            ],
                          ),
                        ),
                      );

                      if (source == null || !mounted) return;

                      final XFile? image = await _picker.pickImage(
                        source: source,
                        imageQuality: 70,
                      );

                      if (image != null && mounted) {
                        final userId = profileCubit
                            .state
                            .userId!;
                        profileCubit.uploadProfileImage(
                          File(image.path),
                          userId,
                        );
                      }
                    },
                  ),
                  Gap(AppSizes.h28),
                  EditProfileTextFieldsSection(
                    nameC: widget.nameC,
                    emailC: widget.emailC,
                    phoneC: widget.phoneC,
                    bioC: widget.bioC,
                    formKey: widget.formKey,
                    phoneValidator: widget.phoneValidator,
                  ),
                  Gap(AppSizes.h20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
