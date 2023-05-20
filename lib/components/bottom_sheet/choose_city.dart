import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/navigation/navigation_service.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/translation/locale_keys.g.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/cubit/reports_cubit.dart';

import '../../constants/colors/constant_colors.dart';
import '../../constants/sizes/sizes.dart';
import '../../screens/reports_page/model/address_model.dart';
import '../../screens/reports_page/providers/providers.dart';

class ChooseCityWidget extends StatelessWidget {
  final List cities;
  const ChooseCityWidget({super.key, required this.cities});

  @override
  Widget build(BuildContext context) {
    List? filtered = cities
        .where((element) => element
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
                hintText: LocaleKeys.mainText_chooseCity.tr(),
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
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                AddressModel addressModel =
                    AddressModel.fromJson(filtered[index]);
                return Card(
                  color: cardColors,
                  child: ListTile(
                    onTap: () {
                      context.read<ChooseCityProvider>().setCityValue =
                          addressModel;
                      ReportsCubit().getListDistricts(addressModel.id ?? 0);
                      NavigationService.instance.navigateToBack();
                    },
                    title: Text(addressModel.name ?? ""),
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
