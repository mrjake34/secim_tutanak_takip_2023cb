import 'package:flutter/material.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/view/ballotbox_list.dart';

import '../../../constants/navigation/navigation.dart';
import '../../../screens/genelge_page/view/genelge_page.dart';
import '../../../screens/home_page/view/home_page.dart';
import '../../../screens/not_found_page/not_found_page.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstants.homePage:
        return normalNavigate(const HomePage(), NavigationConstants.homePage);
      case NavigationConstants.genelgePage:
        return normalNavigate(
            const GenelgePage(), NavigationConstants.genelgePage);
            case NavigationConstants.ballotBoxes:
        return normalNavigate(
            const BuildBallotBoxGrid(), NavigationConstants.ballotBoxes);
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const NotFoundPage());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName,
      {Object? object}) {
    return MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: pageName, arguments: object));
  }
}
