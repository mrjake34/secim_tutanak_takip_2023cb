import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../base/service/translation/locale_keys.g.dart';
import '../../reports_page/view/reports_page.dart';
import '../../resource_page/view/resource_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> refreshPage() async {
    setState(() {});
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      ReportsPage(),
      const ResourcePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
          activeColorPrimary: Theme.of(context).colorScheme.primary,
          activeColorSecondary: Theme.of(context).colorScheme.primary,
          inactiveColorPrimary: Theme.of(context).colorScheme.primary,
          inactiveColorSecondary: Theme.of(context).colorScheme.primary,
          icon: const Icon(Icons.upload_file),
          title: LocaleKeys.mainText_reports.tr()),
      PersistentBottomNavBarItem(
          activeColorPrimary: Theme.of(context).colorScheme.primary,
          activeColorSecondary: Theme.of(context).colorScheme.primary,
          inactiveColorPrimary: Theme.of(context).colorScheme.primary,
          inactiveColorSecondary: Theme.of(context).colorScheme.primary,
          icon: const Icon(Icons.help_center_outlined),
          title: LocaleKeys.mainText_resource.tr()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mainText_title.tr()),
      ),
      body: PersistentTabView(
        context,
        backgroundColor: Theme.of(context).colorScheme.surface,
        screens: _buildScreens(),
        items: _navBarItems(),
        controller: _controller,
        navBarStyle: NavBarStyle.style3,
      ),
    );
  }
}
