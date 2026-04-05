// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Smart Egypt Day`
  String get smartEgyptDay {
    return Intl.message(
      'Smart Egypt Day',
      name: 'smartEgyptDay',
      desc: '',
      args: [],
    );
  }

  /// `Explore Smart Egypt`
  String get exploreSmartEgypt {
    return Intl.message(
      'Explore Smart Egypt',
      name: 'exploreSmartEgypt',
      desc: '',
      args: [],
    );
  }

  /// `Select your city to begin your journey.`
  String get selectyourcitytobeginyourjourney {
    return Intl.message(
      'Select your city to begin your journey.',
      name: 'selectyourcitytobeginyourjourney',
      desc: '',
      args: [],
    );
  }

  /// `Search cities...`
  String get searchcities {
    return Intl.message(
      'Search cities...',
      name: 'searchcities',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'searchForcity..' key

  /// `Trip Genie`
  String get tripGenie {
    return Intl.message(
      'Trip Genie',
      name: 'tripGenie',
      desc: '',
      args: [],
    );
  }

  /// `Search for a city..`
  String get searchForACity {
    return Intl.message(
      'Search for a city..',
      name: 'searchForACity',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Login to continue your journey`
  String get loginToContinueYourJourney {
    return Intl.message(
      'Login to continue your journey',
      name: 'loginToContinueYourJourney',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get enterYourPassword {
    return Intl.message(
      'Enter Your Password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Join the modern way of exploring Egypt`
  String get jointhemodernwayofexploringEgypt {
    return Intl.message(
      'Join the modern way of exploring Egypt',
      name: 'jointhemodernwayofexploringEgypt',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Name`
  String get enterYourName {
    return Intl.message(
      'Enter Your Name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Your Password`
  String get confirmYourPassword {
    return Intl.message(
      'Confirm Your Password',
      name: 'confirmYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Show Password`
  String get showPassword {
    return Intl.message(
      'Show Password',
      name: 'showPassword',
      desc: '',
      args: [],
    );
  }

  /// `Hide Password`
  String get hidePassword {
    return Intl.message(
      'Hide Password',
      name: 'hidePassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Name.`
  String get pleaseEnterYourName {
    return Intl.message(
      'Please Enter Your Name.',
      name: 'pleaseEnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `This Field Is Required!`
  String get thisFieldIsRequired {
    return Intl.message(
      'This Field Is Required!',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Email.`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please Enter Your Email.',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email Format!`
  String get invalidEmailFormat {
    return Intl.message(
      'Invalid Email Format!',
      name: 'invalidEmailFormat',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Password.`
  String get pleaseEnterYourPassword {
    return Intl.message(
      'Please Enter Your Password.',
      name: 'pleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password should be 8 chars or more!`
  String get passwordshouldbe8charsormore {
    return Intl.message(
      'Password should be 8 chars or more!',
      name: 'passwordshouldbe8charsormore',
      desc: '',
      args: [],
    );
  }

  /// `Please Confirm Your Password.`
  String get pleaseConfirmYourPassword {
    return Intl.message(
      'Please Confirm Your Password.',
      name: 'pleaseConfirmYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password doesn't match`
  String get passworddoesntmatch {
    return Intl.message(
      'Password doesn\'t match',
      name: 'passworddoesntmatch',
      desc: '',
      args: [],
    );
  }

  /// `Account Created!`
  String get accountCreated {
    return Intl.message(
      'Account Created!',
      name: 'accountCreated',
      desc: '',
      args: [],
    );
  }

  /// `We’ve sent you a confirmation email.`
  String get wevesentyouaconfirmationemail {
    return Intl.message(
      'We’ve sent you a confirmation email.',
      name: 'wevesentyouaconfirmationemail',
      desc: '',
      args: [],
    );
  }

  /// `Check your inbox and click the link to verify your account.`
  String get checkyourinboxandclickthelinktoverifyyouraccount {
    return Intl.message(
      'Check your inbox and click the link to verify your account.',
      name: 'checkyourinboxandclickthelinktoverifyyouraccount',
      desc: '',
      args: [],
    );
  }

  /// `Then Try To Login.`
  String get thenTryToLogin {
    return Intl.message(
      'Then Try To Login.',
      name: 'thenTryToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Forgor your Password?`
  String get forgoryourpassword {
    return Intl.message(
      'Forgor your Password?',
      name: 'forgoryourpassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address below and we'll send you a reset token.`
  String get enteryouremailaddressbelowandwellsendyouaresettoken {
    return Intl.message(
      'Enter your email address below and we\'ll send you a reset token.',
      name: 'enteryouremailaddressbelowandwellsendyouaresettoken',
      desc: '',
      args: [],
    );
  }

  /// `Send Reset Token`
  String get sendResetToken {
    return Intl.message(
      'Send Reset Token',
      name: 'sendResetToken',
      desc: '',
      args: [],
    );
  }

  /// `Already have a`
  String get alreadyhavea {
    return Intl.message(
      'Already have a',
      name: 'alreadyhavea',
      desc: '',
      args: [],
    );
  }

  /// ` Token?`
  String get token {
    return Intl.message(
      ' Token?',
      name: 'token',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Token`
  String get resetToken {
    return Intl.message(
      'Reset Token',
      name: 'resetToken',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create new password`
  String get createnewpassword {
    return Intl.message(
      'Create new password',
      name: 'createnewpassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your reset token from your email and set a new password.`
  String get enteryourresettokenfromyouremailandsetanewpassword {
    return Intl.message(
      'Enter your reset token from your email and set a new password.',
      name: 'enteryourresettokenfromyouremailandsetanewpassword',
      desc: '',
      args: [],
    );
  }

  /// `Check Your Email`
  String get checkYourEmail {
    return Intl.message(
      'Check Your Email',
      name: 'checkYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `We've sent a reset token to your email.`
  String get wevesentaresettokentoyouremail {
    return Intl.message(
      'We\'ve sent a reset token to your email.',
      name: 'wevesentaresettokentoyouremail',
      desc: '',
      args: [],
    );
  }

  /// `Please check your inbox and use the token to reset your password.`
  String get pleasecheckyourinboxandusethetokentoresetyourpassword {
    return Intl.message(
      'Please check your inbox and use the token to reset your password.',
      name: 'pleasecheckyourinboxandusethetokentoresetyourpassword',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset Successful`
  String get passwordResetSuccessful {
    return Intl.message(
      'Password Reset Successful',
      name: 'passwordResetSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been updated successfully.`
  String get yourpasswordhasbeenupdatedsuccessfully {
    return Intl.message(
      'Your password has been updated successfully.',
      name: 'yourpasswordhasbeenupdatedsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `You can now use your new password to log in to your account.`
  String get youcannowuseyournewpasswordtologintoyouraccount {
    return Intl.message(
      'You can now use your new password to log in to your account.',
      name: 'youcannowuseyournewpasswordtologintoyouraccount',
      desc: '',
      args: [],
    );
  }

  /// `Personalize Your Trip`
  String get personalizeYourTrip {
    return Intl.message(
      'Personalize Your Trip',
      name: 'personalizeYourTrip',
      desc: '',
      args: [],
    );
  }

  /// `Step`
  String get step {
    return Intl.message(
      'Step',
      name: 'step',
      desc: '',
      args: [],
    );
  }

  /// `of`
  String get Of {
    return Intl.message(
      'of',
      name: 'Of',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get complete {
    return Intl.message(
      'Complete',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Generate My Plan`
  String get generateMyPlan {
    return Intl.message(
      'Generate My Plan',
      name: 'generateMyPlan',
      desc: '',
      args: [],
    );
  }

  /// `Hello, `
  String get hello {
    return Intl.message(
      'Hello, ',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Search Results`
  String get searchResults {
    return Intl.message(
      'Search Results',
      name: 'searchResults',
      desc: '',
      args: [],
    );
  }

  /// `Popular Cities`
  String get popularCities {
    return Intl.message(
      'Popular Cities',
      name: 'popularCities',
      desc: '',
      args: [],
    );
  }

  /// `Travel Tips`
  String get travelTips {
    return Intl.message(
      'Travel Tips',
      name: 'travelTips',
      desc: '',
      args: [],
    );
  }

  /// `Smart Guide`
  String get smartGuide {
    return Intl.message(
      'Smart Guide',
      name: 'smartGuide',
      desc: '',
      args: [],
    );
  }

  /// `Essential information for your journey through Egypt.`
  String get essentialinformationforyourjourneythroughEgypt {
    return Intl.message(
      'Essential information for your journey through Egypt.',
      name: 'essentialinformationforyourjourneythroughEgypt',
      desc: '',
      args: [],
    );
  }

  /// `No description available`
  String get nodescriptionavailable {
    return Intl.message(
      'No description available',
      name: 'nodescriptionavailable',
      desc: '',
      args: [],
    );
  }

  /// `No cities found`
  String get nocitiesfound {
    return Intl.message(
      'No cities found',
      name: 'nocitiesfound',
      desc: '',
      args: [],
    );
  }

  /// `Login Required`
  String get loginRequired {
    return Intl.message(
      'Login Required',
      name: 'loginRequired',
      desc: '',
      args: [],
    );
  }

  /// `How long is your journey?`
  String get howlongisyourjourney {
    return Intl.message(
      'How long is your journey?',
      name: 'howlongisyourjourney',
      desc: '',
      args: [],
    );
  }

  /// `Choose the duration that best fits your travel style and schedule.`
  String get chooseTheDuration {
    return Intl.message(
      'Choose the duration that best fits your travel style and schedule.',
      name: 'chooseTheDuration',
      desc: '',
      args: [],
    );
  }

  /// `Half Day`
  String get halfDay {
    return Intl.message(
      'Half Day',
      name: 'halfDay',
      desc: '',
      args: [],
    );
  }

  /// `Full Day`
  String get fullDay {
    return Intl.message(
      'Full Day',
      name: 'fullDay',
      desc: '',
      args: [],
    );
  }

  /// `Multi Day`
  String get multiDay {
    return Intl.message(
      'Multi Day',
      name: 'multiDay',
      desc: '',
      args: [],
    );
  }

  /// `What's your travel style?`
  String get whatsyourtravelstyle {
    return Intl.message(
      'What\'s your travel style?',
      name: 'whatsyourtravelstyle',
      desc: '',
      args: [],
    );
  }

  /// `Choose the persona that best fits your journey in Egypt. We'll tailor your itinerary based on this choice.`
  String get choosethepersona {
    return Intl.message(
      'Choose the persona that best fits your journey in Egypt. We\'ll tailor your itinerary based on this choice.',
      name: 'choosethepersona',
      desc: '',
      args: [],
    );
  }

  /// `Trip Plan`
  String get tripPlan {
    return Intl.message(
      'Trip Plan',
      name: 'tripPlan',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Total Stops`
  String get totalStops {
    return Intl.message(
      'Total Stops',
      name: 'totalStops',
      desc: '',
      args: [],
    );
  }

  /// `Total Duration`
  String get totalDuration {
    return Intl.message(
      'Total Duration',
      name: 'totalDuration',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
