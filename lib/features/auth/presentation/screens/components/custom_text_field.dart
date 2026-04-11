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
    this.maxLines = 1,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hint;
  final String? title;
  final TextFieldTypesEnum fieldTypesEnum;
  final bool readOnly;
  final bool showPastButton;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;

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
            ).copyWith(color: theme.colorScheme.tertiary),
          ),
        Gap(AppSizes.h8),
        TextFormField(
          inputFormatters: widget.inputFormatters,
          enabled: !widget.readOnly,
          controller: widget.controller,
          readOnly: widget.readOnly,
          validator: widget.validator,
          cursorColor: theme.colorScheme.primary,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: isPassword,
          maxLines: isPassword ? 1 : widget.maxLines,
          keyboardType: switch (widget.fieldTypesEnum) {
            TextFieldTypesEnum.text => TextInputType.text,
            TextFieldTypesEnum.email => TextInputType.emailAddress,
            TextFieldTypesEnum.password => TextInputType.visiblePassword,
            TextFieldTypesEnum.phone => TextInputType.phone,
            TextFieldTypesEnum.bio => TextInputType.multiline,
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,

            suffixIcon: widget.showPastButton
                ? IconButton(
                    icon: Icon(Icons.paste, color: Colors.grey[500]),
                    onPressed: () async {
                      final clipboardData = await Clipboard.getData(
                        'text/plain',
                      );
                      if (clipboardData != null && clipboardData.text != null) {
                        widget.controller.text = clipboardData.text!;
                      }
                    },
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
                      color: Colors.grey[500],
                    ),
                  )
                : null,
            errorStyle: AppFonts.inter14SemiBold(
              context,
            ).copyWith(color: theme.colorScheme.error, fontSize: AppSizes.sp10),
            hintText: widget.controller.text.isEmpty && widget.readOnly
                ? 'NOT SET'
                : widget.hint,
            hintStyle: AppFonts.inter16Medium(
              context,
            ).copyWith(color: Colors.grey, fontSize: AppSizes.sp12),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
              borderSide: BorderSide(
                color: theme.colorScheme.tertiary.withValues(alpha: 0.2),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
              borderSide: BorderSide(
                color: theme.colorScheme.tertiary.withValues(alpha: 0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
              borderSide: BorderSide(
                width: 2,
                color: theme.colorScheme.primary,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
              borderSide: BorderSide(width: 2, color: theme.colorScheme.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
              borderSide: BorderSide(width: 2, color: theme.colorScheme.error),
            ),
          ),
        ),
      ],
    );
  }
}
