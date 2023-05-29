import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/blocs/ballotbox/fetch_ballot_boxes_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/blocs/city/city_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/blocs/districts/districts_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/blocs/neighborhoods/neighborhoods_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/blocs/reports/reports_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/blocs/schools/schools_bloc.dart';

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
      child: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => ReportsBloc(),
        ),
        BlocProvider(
          create: (context) => FetchBallotBoxesBloc(),
        ),
        BlocProvider(
          create: (context) => CityBloc(),
        ),
        BlocProvider(
          create: (context) => DistrictsBloc(),
        ),
        BlocProvider(
          create: (context) => NeighborhoodsBloc(),
        ),
        BlocProvider(
          create: (context) => SchoolsBloc(),
        ),
      ], child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchBarProviderGenelge(),
        ),
        ChangeNotifierProvider(
            create: (context) => SearchStringValueProvider()),
        ChangeNotifierProvider(create: (context) => ChooseDistrictProvider()),
        ChangeNotifierProvider(
            create: (context) => ChooseNeighborhoodProvider()),
        ChangeNotifierProvider(create: (context) => ChooseSchoolProvider()),
        ChangeNotifierProvider(create: (context) => ChooseCityProvider()),
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
