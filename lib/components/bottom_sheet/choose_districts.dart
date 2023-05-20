import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/navigation/navigation_service.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/translation/locale_keys.g.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/cubit/reports_cubit.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/cubit/reports_state.dart';

import '../../constants/colors/constant_colors.dart';
import '../../constants/sizes/sizes.dart';
import '../../screens/reports_page/model/address_model.dart';
import '../../screens/reports_page/providers/providers.dart';

// ignore: must_be_immutable
class ChooseDistrictsWidget extends StatelessWidget {
  List districts;
  ChooseDistrictsWidget({super.key, required this.districts});

  @override
  Widget build(BuildContext context) {
    List? filtered = districts
        .where((element) => element
            .toString()
            .toLowerCase()
            .contains(context.watch<SearchStringValueProvider>().getSearchTerm))
        .toList();
    return BlocProvider<ReportsCubit>(
        create: (context) => ReportsCubit(),
        child: BlocConsumer<ReportsCubit, ReportsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return BuildPage(filtered: filtered);
          },
        ));
  }
}

class BuildPage extends StatelessWidget {
  const BuildPage({
    super.key,
    required this.filtered,
  });

  final List filtered;

  @override
  Widget build(BuildContext context) {
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
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                AddressModel addressModel = filtered[index];
                print(addressModel.name);
                return Card(
                  color: cardColors,
                  child: ListTile(
                    onTap: () {
                      context.read<ChooseDistrictProvider>().setDistrictValue =
                          addressModel;
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
