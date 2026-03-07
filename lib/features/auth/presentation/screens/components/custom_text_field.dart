import 'package:trip_genie/core/manager/app_imports.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.validator,
    required this.hint,
    required this.title,
    this.fieldTypesEnum = TextFieldTypesEnum.text,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hint;
  final String title;
  final TextFieldTypesEnum fieldTypesEnum;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isPassword;
  @override
  void initState() {
    super.initState();
    isPassword = widget.fieldTypesEnum == TextFieldTypesEnum.password;
  }

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    final ThemeData theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.title,
          style: AppFonts.inter14SemiBold(
            context,
          ).copyWith(color: theme.colorScheme.tertiary),
        ),
        Gap(AppSizes.h8),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          cursorColor: theme.colorScheme.primary,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: isPassword,
          keyboardType: switch (widget.fieldTypesEnum) {
            TextFieldTypesEnum.text => TextInputType.text,
            TextFieldTypesEnum.email => TextInputType.emailAddress,
            TextFieldTypesEnum.password => TextInputType.visiblePassword,
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            suffixIcon: widget.fieldTypesEnum == TextFieldTypesEnum.password
                ? IconButton(
                    onPressed: () => setState(() => isPassword = !isPassword),
                    style: IconButton.styleFrom(padding: EdgeInsets.zero),
                    tooltip: isPassword ? s.showPassword : s.hidePassword,
                    icon: Icon(
                      isPassword
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                    ),
                  )
                : null,
            errorStyle: AppFonts.inter14SemiBold(
              context,
            ).copyWith(color: theme.colorScheme.error, fontSize: AppSizes.sp10),
            hintText: widget.hint,
            hintStyle: AppFonts.inter16Medium(
              context,
            ).copyWith(color: Colors.grey, fontSize: AppSizes.sp12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
              borderSide: BorderSide(
                color: Theme.of(
                  context,
                ).colorScheme.tertiary.withValues(alpha: 0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
              borderSide: BorderSide(
                width: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
              borderSide: BorderSide(
                width: 2,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
              borderSide: BorderSide(
                width: 2,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
