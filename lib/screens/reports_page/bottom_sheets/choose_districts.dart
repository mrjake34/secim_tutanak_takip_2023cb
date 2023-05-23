import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/bloc/reports_status.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/district_model.dart';

import '../../../base/service/navigation/navigation_service.dart';
import '../../../base/service/translation/locale_keys.g.dart';
import '../../../constants/sizes/sizes.dart';
import '../bloc/reports_bloc.dart';
import '../providers/providers.dart';
import '../service/ballotbox_service.dart';
import '../service/reports_service.dart';

// ignore: must_be_immutable
class ChooseDistrictsWidget extends StatelessWidget {
  const ChooseDistrictsWidget({
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
            context.read<ReportsBloc>().add(DistrictsFetch(
                cityId:
                    context.watch<ChooseCityProvider>().getCityValue.id ?? 0));
          }
          return BuildPage(districts: state.districts);
        },
      ),
    );
  }
}

class BuildPage extends StatelessWidget {
  const BuildPage({
    super.key,
    required this.districts,
  });

  final List? districts;

  @override
  Widget build(BuildContext context) {
    List? filtered = districts
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
                hintText: LocaleKeys.mainText_chooseDistrict.tr(),
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
                DistrictModel? districts =
                    DistrictModel.fromJson(filtered?[index]);
                return Card(
                  child: ListTile(
                    onTap: () {
                      context.read<ChooseDistrictProvider>().setDistrictValue =
                          districts;
                      NavigationService.instance.navigateToBack();
                    },
                    title: Text(districts.districtName ?? ""),
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
