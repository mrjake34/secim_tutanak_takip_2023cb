import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/bloc/reports_status.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/schools_model_json.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/schools_test_model.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/service/ballotbox_service.dart';

import '../../../base/service/navigation/navigation_service.dart';
import '../../../base/service/translation/locale_keys.g.dart';
import '../../../constants/sizes/sizes.dart';
import '../bloc/reports_bloc.dart';
import '../providers/providers.dart';
import '../service/reports_service.dart';

// ignore: must_be_immutable
class ChooseSchoolWidget extends StatelessWidget {
  const ChooseSchoolWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportsBloc(
          service: ReportsService(),
          context: context,
          boxService: BallotBoxService()),
      child: BlocBuilder<ReportsBloc, ReportsState>(
        builder: (context, state) {
          if (state.status is StatusInitialize) {
            context.read<ReportsBloc>().add(SchoolsFetch(
                  neighborhoodId: context
                          .watch<ChooseNeighborhoodProvider>()
                          .getNeighborhoodValue
                          .neighborId ??
                      0,
                  districtId: context
                          .watch<ChooseDistrictProvider>()
                          .getDistrictValue
                          .districtId ??
                      0,
                  cityId:
                      context.watch<ChooseCityProvider>().getCityValue.id ?? 0,
                ));
          }
          return BuildPage(schools: state.schools);
        },
      ),
    );
  }
}

class BuildPage extends StatelessWidget {
  const BuildPage({
    super.key,
    required this.schools,
  });

  final List? schools;

  @override
  Widget build(BuildContext context) {
    List? filtered = schools
        ?.where((element) => element
            .toString()
            .toLowerCase()
            .contains(context.watch<SearchStringValueProvider>().getSearchTerm))
        .toList();
    return Padding(
      padding: const EdgeInsets.all(pagePadding),
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              context.read<SearchStringValueProvider>().setSearchTerm =
                  value.toLowerCase();
            },
            decoration: InputDecoration(
                hintText: LocaleKeys.mainText_chooseSchool.tr(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary))),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filtered?.length ?? 0,
              itemBuilder: (context, index) {
                SchoolsTest? schools = SchoolsTest.fromJson(filtered?[index]);
                return Card(
                  child: ListTile(
                    onTap: () {
                      context.read<ChooseSchoolProvider>().setSchoolValue =
                          schools;
                      NavigationService.instance.navigateToBack();
                    },
                    title: Text(schools.schoolName ?? ""),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
