import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/blocs/neighborhoods/neighborhoods_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/neighborhood_model.dart';

import '../../../base/service/navigation/navigation_service.dart';
import '../../../base/service/translation/locale_keys.g.dart';
import '../../../constants/sizes/sizes.dart';

import '../providers/providers.dart';

// ignore: must_be_immutable
class ChooseNeighborhoodWidget extends StatelessWidget {
  const ChooseNeighborhoodWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NeighborhoodsBloc>(context).add(NeighborhoodsEvent(
        cityId: context.watch<ChooseCityProvider>().getCityValue.id,
        districtsId: context
            .watch<ChooseDistrictProvider>()
            .getDistrictValue
            .districtId));
    return BlocBuilder<NeighborhoodsBloc, NeighborhoodsState>(
      builder: (context, state) {
        if (state.model?.isNotEmpty ?? false) {
          return BuildPage(state: state);
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
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

  final NeighborhoodsState state;

  @override
  Widget build(BuildContext context) {
    List? filtered = state.model
        ?.where((element) => element
            .toString()
            .toLowerCase()
            .contains(context.watch<SearchStringValueProviderNeighborhoods>().getSearchTerm))
        .toList();
    return Padding(
      padding: const EdgeInsets.all(pagePadding),
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              context.read<SearchStringValueProviderNeighborhoods>().setSearchTerm =
                  value.toLowerCase();
            },
            decoration: InputDecoration(
                hintText: LocaleKeys.mainText_chooseNeighborhood.tr(),
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
                NeighborhoodModel? neighborhoods =
                    NeighborhoodModel.fromJson(filtered?[index]);
                return Card(
                  child: ListTile(
                    onTap: () {
                      context
                          .read<ChooseNeighborhoodProvider>()
                          .setNeightborhoodValue = neighborhoods;
                      NavigationService.instance.navigateToBack();
                    },
                    title: Text(neighborhoods.neighborName ?? ""),
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
