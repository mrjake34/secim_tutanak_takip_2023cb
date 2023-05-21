import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/navigation/navigation_service.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/translation/locale_keys.g.dart';

import '../../constants/colors/constant_colors.dart';
import '../../constants/sizes/sizes.dart';
import '../../screens/reports_page/cubit/districts_cubit.dart';
import '../../screens/reports_page/model/reports_model.dart';
import '../../screens/reports_page/providers/providers.dart';

// ignore: must_be_immutable
class ChooseDistrictsWidget extends StatelessWidget {
  ChooseDistrictsWidget({
    super.key,
  });
  List<Districts>? _districts;
  @override
  Widget build(BuildContext context) {
    print("List _districts $_districts");
    List<Districts>? filtered = _districts
        ?.where((element) => element
            .toString()
            .toLowerCase()
            .contains(context.watch<SearchStringValueProvider>().getSearchTerm))
        .toList();
    return BlocProvider(
      create: (context) => DistrictsCubit(),
      child: BlocConsumer<DistrictsCubit, DistrictsState>(
        listener: (context, state) {
          print("State ${state.districts?.length}");
          _districts = state.districts;
        },
        builder: (context, state) {
          return BuildPage(filtered: filtered);
        },
      ),
    );
  }
}

class BuildPage extends StatelessWidget {
  const BuildPage({
    super.key,
    required this.filtered,
  });

  final List<Districts>? filtered;

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
              itemCount: filtered?.length ?? 0,
              itemBuilder: (context, index) {
                Districts? districts = filtered?[index];
                return Card(
                  color: cardColors,
                  child: ListTile(
                    onTap: () {
                      context.read<ChooseDistrictProvider>().setDistrictValue =
                          districts ?? Districts();
                      NavigationService.instance.navigateToBack();
                    },
                    title: Text(districts?.name ?? ""),
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
