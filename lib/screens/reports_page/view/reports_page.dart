import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/translation/locale_keys.g.dart';
import 'package:secim_tutanak_takip_2023cb/components/bottom_sheet/bottom_sheet_main.dart';
import 'package:secim_tutanak_takip_2023cb/components/bottom_sheet/choose_city.dart';
import 'package:secim_tutanak_takip_2023cb/components/buttons/main_elevated_button.dart';
import 'package:secim_tutanak_takip_2023cb/constants/sizes/sizes.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/providers/providers.dart';

import '../../../components/bottom_sheet/choose_districts.dart';
import '../../../constants/style/text_styles.dart';
import '../model/reports_model.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  List? cities;
  bool? isLoading;
  List? city;
  List<Districts>? districts;
  List? neighborhoods;
  List? schools;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size pageSize = MediaQuery.of(context).size;
    return Scaffold(
      body: BuildScaffold(
        pageSize: pageSize,
        isLoading: isLoading ?? false,
        districts: districts ?? [],
        neighborhoods: neighborhoods ?? [],
        schools: schools ?? [],
        cities: cities ?? [],
      ),
    );
  }
}

class BuildScaffold extends StatelessWidget {
  const BuildScaffold({
    super.key,
    required this.pageSize,
    required this.isLoading,
    required this.districts,
    required this.neighborhoods,
    required this.schools,
    required this.cities,
  });

  final Size pageSize;
  final bool isLoading;
  final List<Districts>? districts;
  final List? neighborhoods;
  final List? schools;
  final List? cities;

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? Padding(
            padding: const EdgeInsets.all(pagePadding),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary)),
                  height: 50,
                  child: ListTile(
                    onTap: () {
                      MainComponents()
                          .openBottomSheet(context, ChooseCityWidget());
                    },
                    title: Text(
                        context.watch<ChooseCityProvider>().getCityValue.name ??
                            LocaleKeys.mainText_chooseCity.tr()),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary)),
                  height: 50,
                  child: ListTile(
                    onTap: () {
                      // print(districts);
                      // if (districts!.isNotEmpty) {

                      // }
                      MainComponents()
                          .openBottomSheet(context, ChooseDistrictsWidget());
                    },
                    title: Text(context
                            .watch<ChooseDistrictProvider>()
                            .getDistrictValue
                            .name ??
                        LocaleKeys.mainText_chooseDistrict.tr()),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary)),
                  height: 50,
                  child: ListTile(
                    onTap: () {
                      MainComponents()
                          .openBottomSheet(context, ChooseCityWidget());
                    },
                    title: Text(context
                            .watch<ChooseNeighborhoodProvider>()
                            .getNeighborhoodValue
                            .name ??
                        LocaleKeys.mainText_chooseNeighborhood.tr()),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary)),
                  height: 50,
                  child: ListTile(
                    onTap: () {
                      MainComponents()
                          .openBottomSheet(context, ChooseCityWidget());
                    },
                    title: Text(context
                            .watch<ChooseSchoolProvider>()
                            .getSchoolValue
                            .name ??
                        LocaleKeys.mainText_chooseSchool.tr()),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MainElevatedButton(
                          buttonFunction: () {},
                          buttonWidget: Text(LocaleKeys.mainText_reports.tr())),
                    ),
                  ],
                )
              ],
            ),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(
                        Theme.of(context).colorScheme.primary),
                  ),
                ),
                Text(
                  LocaleKeys.mainText_loadingReportTitle.tr(),
                  style: contextTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  LocaleKeys.mainText_pleaseWaitContext.tr(),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
  }
}
