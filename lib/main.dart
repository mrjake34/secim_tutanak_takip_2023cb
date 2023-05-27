import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base/service/navigation/navigation_route.dart';
import 'base/service/navigation/navigation_service.dart';
import 'base/service/translation/translation_service.dart';
import 'base/service/utils/utils.dart';
import 'screens/genelge_page/service/genelge_provider.dart';
import 'screens/home_page/view/home_page.dart';
import 'screens/reports_page/providers/providers.dart';
import 'theme/theme_dark.dart';
import 'theme/theme_light.dart';

void main() {
  runApp(EasyLocalization(
      path: "assets/translation",
      supportedLocales: TranslationManager.instance!.supportedLocales,
      startLocale: TranslationManager.instance!.trLocale,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchBarProviderGenelge(),
        ),
        ChangeNotifierProvider(
            create: (context) => SearchStringValueProvider()),
        ChangeNotifierProvider(create: (context) => ChooseCityProvider()),
        ChangeNotifierProvider(create: (context) => ChooseDistrictProvider()),
        ChangeNotifierProvider(
            create: (context) => ChooseNeighborhoodProvider()),
        ChangeNotifierProvider(create: (context) => ChooseSchoolProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Seçim Tutanak Takip 2023',
          theme: lightTheme,
          darkTheme: darkTheme,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          navigatorKey: NavigationService.instance.navigatorKey,
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          scaffoldMessengerKey: UtilsService.instance.messengerKey,
          home: const HomePage()),
    );
  }
}
