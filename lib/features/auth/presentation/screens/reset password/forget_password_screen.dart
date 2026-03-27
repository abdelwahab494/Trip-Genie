import 'package:trip_genie/core/extensions/colors_extension.dart';
import 'package:trip_genie/core/manager/app_imports.dart' hide AuthState;
import 'package:trip_genie/features/auth/presentation/cubit/auth_cubit.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key, required this.email});
  final String? email;

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with FormHelperMixin {
  @override
  void initState() {
    super.initState();
    emailC.text = widget.email ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);

    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.w20,
                vertical: AppSizes.h10,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      s.forgoryourpassword,
                      style: AppFonts.inter30Bold(context).copyWith(
                        fontSize: AppSizes.sp28,
                        color: context.firstText,
                      ),
                    ),
                    Gap(AppSizes.h10),
                    Text(
                      s.enteryouremailaddressbelowandwellsendyouaresettoken,
                      style: AppFonts.inter16Medium(context).copyWith(
                        color: context.thirdText,
                        fontWeight: FontWeight.normal,
                        fontSize: AppSizes.sp14,
                      ),
                    ),
                    Gap(AppSizes.h30),
                    CustomTextField(
                      controller: emailC,
                      hint: s.enterYourEmail,
                      title: s.email,
                      validator: (value) => emailValidator(value),
                      fieldTypesEnum: TextFieldTypesEnum.email,
                    ),
                    Gap(AppSizes.h15),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) async {
                        if (state is AuthError) {
                          context.showError(state.message);
                        }
                        if (state is AuthReset) {
                          final navigator = Navigator.of(context);
                          final bool? result = await context.showActionDialog(
                            title: s.checkYourEmail,
                            contentText: s.wevesentaresettokentoyouremail,
                            secContentText: s
                                .pleasecheckyourinboxandusethetokentoresetyourpassword,
                            action: s.ok,
                          );
                          if (result == true) {
                            navigator.push(
                              MaterialPageRoute(
                                builder: (c) => ResetPasswordScreen(
                                  email: emailC.text.trim(),
                                ),
                              ),
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
                              context.read<AuthCubit>().requestResetToken(
                                emailC.text.trim(),
                              );
                            }
                          },
                          title: s.sendResetToken,
                        );
                      },
                    ),
                    Gap(AppSizes.h15),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: s.alreadyhavea,
                            style: AppFonts.inter14SemiBold(
                              context,
                            ).copyWith(color: context.thirdText),
                          ),
                          TextSpan(text: " "),
                          TextSpan(
                            text: s.token,
                            style: AppFonts.inter14SemiBold(
                              context,
                            ).copyWith(color: context.primary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (c) => ResetPasswordScreen(
                                      email: emailC.text.trim(),
                                    ),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
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
