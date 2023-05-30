import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/blocs/districts/districts_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/district_model.dart';

import '../../../base/service/navigation/navigation_service.dart';
import '../../../base/service/translation/locale_keys.g.dart';
import '../../../constants/sizes/sizes.dart';
import '../providers/providers.dart';

class ChooseDistrictsWidget extends StatelessWidget {
  const ChooseDistrictsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DistrictsBloc>(context).add(DistrictsEvent(
        cityId: context.watch<ChooseCityProvider>().getCityValue.id ?? 0));
    return BlocBuilder<DistrictsBloc, DistrictsState>(
      builder: (context, state) {
        if (state.districts?.isNotEmpty ?? false) {
          return BuildPage(state: state);
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive()
          );
        }
      },
    );
  }
}

class BuildPage extends StatelessWidget {
  const BuildPage({
    super.key,
    required this.state,
  });

  final DistrictsState state;

  @override
  Widget build(BuildContext context) {
    List? filtered = state.districts
        ?.where((element) => element
            .toString()
            .toLowerCase()
            .contains(context.watch<SearchStringValueProviderDistricts>().getSearchTerm))
        .toList();
    return Padding(
      padding: const EdgeInsets.all(pagePadding),
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              context.read<SearchStringValueProviderDistricts>().setSearchTerm =
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
