import 'package:trip_genie/core/manager/app_imports.dart' hide AuthState;
import 'package:trip_genie/features/auth/presentation/cubit/auth_cubit.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String? email;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    with FormHelperMixin {
  @override
  void initState() {
    super.initState();
    if (widget.email != null) {
      emailC.text = widget.email!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    final ThemeData theme = Theme.of(context);

    return BlocProvider(
      create: (context) => AuthCubit(AuthRepoImpl(AuthService())),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: LightColors.secBackground,
          appBar: AppBar(
            backgroundColor: LightColors.secBackground,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
              icon: Icon(Icons.arrow_back, color: theme.colorScheme.primary),
            ),
            titleSpacing: 0,
            title: Text(
              s.resetPassword,
              style: AppFonts.inter16Medium(
                context,
              ).copyWith(color: theme.colorScheme.onSurface),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Gap(AppSizes.h20),
                    Text(
                      s.createnewpassword,
                      style: AppFonts.inter30Bold(
                        context,
                      ).copyWith(fontSize: AppSizes.sp28),
                    ),
                    Gap(AppSizes.h10),
                    Text(
                      s.enteryourresettokenfromyouremailandsetanewpassword,
                      style: AppFonts.inter16Medium(context).copyWith(
                        color: theme.colorScheme.tertiary,
                        fontWeight: FontWeight.normal,
                        fontSize: AppSizes.sp14,
                      ),
                    ),
                    Gap(AppSizes.h25),
                    CustomTextField(
                      controller: nameC,
                      hint: s.resetToken,
                      validator: (value) => nameValidator(value),
                      showPastButton: true,
                    ),
                    Gap(AppSizes.h15),
                    CustomTextField(
                      controller: emailC,
                      readOnly: emailC.text.trim().isNotEmpty,
                      hint: s.enterYourEmail,
                      validator: (value) => emailValidator(value),
                      fieldTypesEnum: TextFieldTypesEnum.email,
                    ),
                    Gap(AppSizes.h15),
                    CustomTextField(
                      controller: passwordC,
                      hint: s.newPassword,
                      validator: (value) => passwordValidator(value),
                      fieldTypesEnum: TextFieldTypesEnum.password,
                    ),
                    Gap(AppSizes.h15),
                    CustomTextField(
                      controller: confirmPasswordC,
                      hint: s.confirmPassword,
                      validator: (value) => confirmPasswordValidator(
                        value,
                        password: passwordC.text.trim(),
                        confirmPassword: confirmPasswordC.text.trim(),
                      ),
                      fieldTypesEnum: TextFieldTypesEnum.password,
                    ),
                    Gap(AppSizes.h25),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) async {
                        if (state is AuthError) {
                          context.showError(state.message);
                        }
                        if (state is AuthReset) {
                          final navigator = Navigator.of(context);
                          final bool? result = await context.showActionDialog(
                            title: s.passwordResetSuccessful,
                            contentText:
                                s.yourpasswordhasbeenupdatedsuccessfully,
                            secContentText: s
                                .youcannowuseyournewpasswordtologintoyouraccount,
                            action: s.login,
                          );
                          if (result == true) {
                            navigator.pushAndRemoveUntil(
                              MaterialPageRoute(builder: (c) => LoginScreen()),
                              (route) => false,
                            );
                          }
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return Center(child: LinearProgressIndicator());
                        }
                        return CustomFilledButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthCubit>().verifyAndUpdatePassword(
                                email: emailC.text.trim(),
                                resetToken: nameC.text.trim(),
                                password: passwordC.text.trim(),
                              );
                            }
                          },
                          title: s.resetPassword,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
