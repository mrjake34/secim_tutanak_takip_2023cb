// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/navigation/navigation_service.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/translation/locale_keys.g.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/bloc/reports_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/cubit/districts_cubit.dart';
import '../../constants/colors/constant_colors.dart';
import '../../constants/sizes/sizes.dart';
import '../../constants/style/text_styles.dart';
import '../../screens/reports_page/model/reports_model.dart';
import '../../screens/reports_page/providers/providers.dart';

class ChooseCityWidget extends StatelessWidget {
  ChooseCityWidget({super.key});

  DistrictsCubit districtsCubit = DistrictsCubit();

  bool isLoading = true;

  List? cities;

  @override
  Widget build(BuildContext context) {
    List? filtered = cities
        ?.where((element) => element
            .toString()
            .toLowerCase()
            .contains(context.watch<SearchStringValueProvider>().getSearchTerm))
        .toList();
    return BlocProvider(
      create: (context) => ReportsBloc(),
      child: BlocListener<ReportsBloc, ReportsState>(
          listener: (context, state) {
            isLoading = state.isLoading;
            cities = state.cities;
          },
          child:
              BuildWidget(filtered: filtered, districtsCubit: districtsCubit)),
    );
  }
}

class BuildWidget extends StatelessWidget {
  const BuildWidget({
    super.key,
    required this.filtered,
    required this.districtsCubit,
  });

  final List? filtered;
  final bool isLoading = true;
  final DistrictsCubit districtsCubit;

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Padding(
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
                    itemCount: filtered?.length ?? 0,
                    itemBuilder: (context, index) {
                      AddressModel addressModel =
                          AddressModel.fromJson(filtered?[index]);
                      return Card(
                        color: cardColors,
                        child: ListTile(
                          onTap: () {
                            context.read<ChooseCityProvider>().setCityValue =
                                addressModel;
                            districtsCubit.getListDistricts(addressModel.id);

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
