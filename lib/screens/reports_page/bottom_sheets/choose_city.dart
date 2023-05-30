// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/navigation/navigation_service.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/translation/locale_keys.g.dart';
import 'package:secim_tutanak_takip_2023cb/constants/enums/bloc_status.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/blocs/city/city_bloc.dart';

import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/city_model.dart';
import '../../../constants/sizes/sizes.dart';
import '../../../constants/style/text_styles.dart';
import '../providers/providers.dart';

class ChooseCityWidget extends StatelessWidget {
  const ChooseCityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CityBloc>(context).add(const CityEvent());
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        return BuildWidget(
          state: state,
        );
      },
    );
  }
}

class BuildWidget extends StatelessWidget {
  const BuildWidget({
    super.key,
    required this.state,
  });

  final CityState state;

  @override
  Widget build(BuildContext context) {
    
    List? filtered = state.cities
        ?.where((element) => element
            .toString()
            .toLowerCase()
            .contains(context.watch<SearchStringValueProviderCities>().getSearchTerm))
        .toList();
    return state.status == Status.success
        ? Padding(
            padding: const EdgeInsets.all(pagePadding),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    context.read<SearchStringValueProviderCities>().setSearchTerm =
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
                    itemCount: filtered?.length,
                    itemBuilder: (context, index) {
                      CityModel addressModel =
                          CityModel.fromJson(filtered?[index]);
                      return Card(
                        child: ListTile(
                          onTap: () {
                            context.read<ChooseCityProvider>().setCityValue =
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
          )
        : state.status == Status.loading
            ? const LoadingWidget()
            : const ErrorWidget();
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.errorText_listNotFound.tr(),
          style: contextTitleTextStyle,
          textAlign: TextAlign.center,
        ),
      ],
    ));
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator.adaptive(
              valueColor:
                  AlwaysStoppedAnimation(Theme.of(context).colorScheme.primary),
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
