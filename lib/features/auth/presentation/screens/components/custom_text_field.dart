import 'package:flutter/services.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.validator,
    required this.hint,
    this.title,
    this.fieldTypesEnum = TextFieldTypesEnum.text,
    this.readOnly = false,
    this.showPastButton = false,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hint;
  final String? title;
  final TextFieldTypesEnum fieldTypesEnum;
  final bool readOnly;
  final bool showPastButton;

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
        if (widget.title != null)
          Text(
            widget.title!,
            style: AppFonts.inter14SemiBold(
              context,
            ).copyWith(color: context.sectText),
          ),
        Gap(AppSizes.h8),
        TextFormField(
          controller: widget.controller,
          readOnly: widget.readOnly,
          validator: widget.validator,
          cursorColor: context.primary,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: isPassword,
          keyboardType: switch (widget.fieldTypesEnum) {
            TextFieldTypesEnum.text => TextInputType.text,
            TextFieldTypesEnum.email => TextInputType.emailAddress,
            TextFieldTypesEnum.password => TextInputType.visiblePassword,
          },
          // style: theme.textTheme.bodyLarge!.copyWith(color: context.firstText),
          decoration: InputDecoration(
            filled: true,
            fillColor: context.secBackground,
            suffixIcon: widget.showPastButton
                ? IconButton(
                    onPressed: () async {
                      final clipboardData = await Clipboard.getData(
                        'text/plain',
                      );
                      if (clipboardData != null && clipboardData.text != null) {
                        widget.controller.text = clipboardData.text!;
                      }
                    },
                    icon: Icon(Icons.paste, color: context.forthText),
                  )
                : widget.fieldTypesEnum == TextFieldTypesEnum.password
                ? IconButton(
                    onPressed: () => setState(() => isPassword = !isPassword),
                    style: IconButton.styleFrom(padding: EdgeInsets.zero),
                    tooltip: isPassword ? s.showPassword : s.hidePassword,
                    icon: Icon(
                      isPassword
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      color: context.forthText,
                    ),
                  )
                : null,
            errorStyle: AppFonts.inter14SemiBold(
              context,
            ).copyWith(color: theme.colorScheme.error, fontSize: AppSizes.sp10),
            hintText: widget.hint,
            hintStyle: AppFonts.inter16Medium(
              context,
            ).copyWith(color: context.forthText, fontSize: AppSizes.sp12),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
              borderSide: BorderSide(color: context.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
              borderSide: BorderSide(color: context.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
              borderSide: BorderSide(width: 2, color: context.primary),
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
