import 'package:trip_genie/core/extensions/snack_bar_extension.dart';
import 'package:trip_genie/core/manager/app_imports.dart' hide AuthState;
import 'package:trip_genie/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trip_genie/features/auth/presentation/screens/reset%20password/forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with FormHelperMixin {
  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        s.smartEgyptDay.toUpperCase(),
                        style: AppFonts.inter14SemiBold(
                          context,
                        ).copyWith(color: context.primary),
                      ),
                      Gap(AppSizes.h12),
                      Text(
                        s.welcomeBack,
                        style: AppFonts.inter30Bold(context).copyWith(
                          fontSize: AppSizes.sp36,
                          color: context.firstText,
                        ),
                      ),
                      Gap(AppSizes.h10),
                      Text(
                        s.loginToContinueYourJourney,
                        style: AppFonts.inter16Medium(context).copyWith(
                          color: context.thirdText,
                          fontWeight: FontWeight.normal,
                          fontSize: AppSizes.sp14,
                        ),
                      ),
                      Gap(AppSizes.h20),
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              controller: emailC,
                              hint: s.enterYourEmail,
                              title: s.email,
                              fieldTypesEnum: TextFieldTypesEnum.email,
                              validator: (value) => emailValidator(value),
                            ),
                            Gap(AppSizes.h20),
                            CustomTextField(
                              controller: passwordC,
                              hint: s.enterYourPassword,
                              title: s.password,
                              fieldTypesEnum: TextFieldTypesEnum.password,
                              validator: (value) => passwordValidator(value),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (c) => ForgetPasswordScreen(
                                        email: emailC.text.trim(),
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  s.forgotPassword,
                                  style: AppFonts.inter14SemiBold(context)
                                      .copyWith(
                                        color: context.primary,
                                        fontSize: AppSizes.sp12,
                                      ),
                                ),
                              ),
                            ),
                            Gap(AppSizes.h15),
                            BlocConsumer<AuthCubit, AuthState>(
                              listener: (context, state) {
                                if (state is AuthError) {
                                  context.showError(state.message);
                                }
                                if (state is AuthSuccess) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (c) => NavigationRoot(),
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                if (state is AuthLoading) {
                                  return Center(
                                    child: LinearProgressIndicator(),
                                  );
                                }
                                return CustomFilledButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      context.read<AuthCubit>().signIn(
                                        email: emailC.text.trim(),
                                        password: passwordC.text.trim(),
                                      );
                                    }
                                  },
                                  title: s.login,
                                );
                              },
                            ),
                            Gap(AppSizes.h20),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: s.dontHaveAnAccount,
                                    style: AppFonts.inter14SemiBold(
                                      context,
                                    ).copyWith(color: context.thirdText),
                                  ),
                                  TextSpan(text: "   "),
                                  TextSpan(
                                    text: s.signUp,
                                    style: AppFonts.inter14SemiBold(
                                      context,
                                    ).copyWith(color: context.primary),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (c) => SignupScreen(),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
