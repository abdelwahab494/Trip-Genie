import 'package:trip_genie/core/manager/app_imports.dart';

mixin FormHelperMixin<T extends StatefulWidget> on State<T> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController confirmPasswordC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailC.dispose();
    passwordC.dispose();
    confirmPasswordC.dispose();
  }

  String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).thisFieldIsRequired;
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).pleaseEnterYourEmail;
    }
    if (!value.endsWith("@gmail.com")) {
      return S.of(context).invalidEmailFormat;
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).pleaseEnterYourPassword;
    }
    if (value.length < 8) {
      return S.of(context).passwordshouldbe8charsormore;
    }
    return null;
  }

  String? confirmPasswordValidator(
    String? value, {
    required String? password,
    required String? confirmPassword,
  }) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).pleaseConfirmYourPassword;
    }
    if (password != confirmPassword) {
      return S.of(context).passworddoesntmatch;
    }
    return null;
  }
}
