import 'package:evently/auth/login/login_screen.dart';
import 'package:evently/auth/register/register_screen.dart';
import 'package:evently/auth/reset_password/reset_password.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/app_language_provider.dart';
import 'package:evently/providers/app_theme_provider.dart';
import 'package:evently/ui/first_screen/first_screen.dart';
import 'package:evently/ui/home/home_screen.dart';
import 'package:evently/ui/home/tabs/profile/profile_tab.dart';
import 'package:evently/ui/onboarding/onboarding_screen.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLanguageProvider(),),
        ChangeNotifierProvider(create: (context) => AppThemeProvider(),),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return MaterialApp(
      locale: Locale(languageProvider.appLanguage),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginScreenRouteName,
        routes: {
          AppRoutes.onboardingRouteName: (context) => OnBoardingScreen(),
          AppRoutes.homeScreenRouteName: (context) => HomeScreen(),
          AppRoutes.profileRouteName: (context) => ProfileTab(),
          AppRoutes.firstScreenRouteName: (context) => FirstScreen(),
          AppRoutes.loginScreenRouteName: (context) => LoginScreen(),
          AppRoutes.registerScreenRouteName: (context) => RegisterScreen(),
          AppRoutes.resetPasswordRouteName: (context) => ResetPassword()
        },
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}
