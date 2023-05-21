// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/navigation/navigation_service.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/translation/locale_keys.g.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/bloc/reports_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/bloc/reports_status.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/service/reports_service.dart';
import '../../../constants/colors/constant_colors.dart';
import '../../../constants/sizes/sizes.dart';
import '../../../constants/style/text_styles.dart';
import '../model/reports_model.dart';
import '../providers/providers.dart';

class ChooseCityWidget extends StatelessWidget {
  ChooseCityWidget({super.key});

  final ReportsService service = ReportsService();

  @override
  Widget build(BuildContext context) {
    final bloc = ReportsBloc(service: ReportsService(), context: context);
    return BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<ReportsBloc, ReportsState>(
          builder: (context, state) {
            if (state.status is StatusInitialize) {
              context.read<ReportsBloc>().add(CitiesFetch());
            }
            return BuildWidget(
              service: service,
              state: state,
              bloc: bloc,
            );
          },
        ));
  }
}

class BuildWidget extends StatelessWidget {
  const BuildWidget({
    super.key,
    required this.service,
    required this.state,
    required this.bloc,
  });

  final ReportsService service;
  final ReportsState state;
  final ReportsBloc bloc;

  @override
  Widget build(BuildContext context) {
    List? filtered = state.cities
        .where((element) => element
            .toString()
            .toLowerCase()
            .contains(context.watch<SearchStringValueProvider>().getSearchTerm))
        .toList();
    return state.status is ReportSuccess
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
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      AddressModel addressModel =
                          AddressModel.fromJson(filtered[index]);
                      print(addressModel);
                      return Card(
                        color: cardColors,
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
        : state.status is ReportLoading
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
