import 'package:trip_genie/core/extensions/snack_bar_extension.dart';
import 'package:trip_genie/core/manager/app_imports.dart' hide AuthState;
import 'package:trip_genie/features/auth/presentation/cubit/auth_cubit.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with FormHelperMixin {
  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(title: Text(s.signUp)),
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
                        s.createAccount,
                        style: AppFonts.inter30Bold(context).copyWith(
                          fontSize: AppSizes.sp32,
                          color: context.firstText,
                        ),
                      ),
                      Gap(AppSizes.h10),
                      Text(
                        s.jointhemodernwayofexploringEgypt,
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
                              controller: nameC,
                              hint: s.enterYourName,
                              title: s.fullName,
                              fieldTypesEnum: TextFieldTypesEnum.text,
                              validator: (value) => nameValidator(value),
                            ),
                            Gap(AppSizes.h20),
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
                            Gap(AppSizes.h20),
                            CustomTextField(
                              controller: confirmPasswordC,
                              hint: s.confirmYourPassword,
                              title: s.confirmPassword,
                              fieldTypesEnum: TextFieldTypesEnum.password,
                              validator: (value) => confirmPasswordValidator(
                                value,
                                password: passwordC.text.trim(),
                                confirmPassword: confirmPasswordC.text.trim(),
                              ),
                            ),
                            Gap(AppSizes.h20),
                            BlocConsumer<AuthCubit, AuthState>(
                              listener: (context, state) async {
                                if (state is AuthError) {
                                  context.showError(state.message);
                                }
                                if (state is AuthSuccess) {
                                  final navigator = Navigator.of(context);
                                  final bool?
                                  result = await context.showActionDialog(
                                    title: s.accountCreated,
                                    contentText:
                                        s.wevesentyouaconfirmationemail,
                                    secContentText: s
                                        .checkyourinboxandclickthelinktoverifyyouraccount,
                                    thirdContentText: s.thenTryToLogin,
                                    action: s.ok,
                                  );
                                  if (result == true) {
                                    navigator.pop();
                                  }
                                }
                              },
                              builder: (context, state) {
                                if (state is AuthLoading) {
                                  return const LinearProgressIndicator();
                                }
                                return CustomFilledButton(
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      context.read<AuthCubit>().signUp(
                                        name: nameC.text.trim(),
                                        email: emailC.text.trim(),
                                        password: passwordC.text.trim(),
                                      );
                                    }
                                  },
                                  title: s.signUp,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Gap(AppSizes.h20),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: s.alreadyHaveAnAccount,
                              style: AppFonts.inter14SemiBold(
                                context,
                              ).copyWith(color: context.thirdText),
                            ),
                            TextSpan(text: "   "),
                            TextSpan(
                              text: s.login,
                              style: AppFonts.inter14SemiBold(
                                context,
                              ).copyWith(color: context.primary),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pop();
                                },
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
