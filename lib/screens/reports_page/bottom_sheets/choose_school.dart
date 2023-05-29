import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/blocs/city/city_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/schools_model.dart';

import '../../../base/service/navigation/navigation_service.dart';
import '../../../base/service/translation/locale_keys.g.dart';
import '../../../constants/sizes/sizes.dart';
import '../blocs/reports/reports_bloc.dart';
import '../providers/providers.dart';

// ignore: must_be_immutable
class ChooseSchoolWidget extends StatelessWidget {
  const ChooseSchoolWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
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
          cityId: context.watch<CityBloc>().state.city?.id ?? 0,
        ));
    return BlocBuilder<ReportsBloc, ReportsState>(
      builder: (context, state) {
        return BuildPage(schools: state.schools);
      },
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
                SchoolsModel? schools = SchoolsModel.fromJson(filtered?[index]);
                return Card(
                  child: ListTile(
                    onTap: () {
                      context.read<ChooseSchoolProvider>().setSchoolValue =
                          schools;
                      NavigationService.instance.navigateToBack();
                    },
                    title: Text(schools.name ?? ""),
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
