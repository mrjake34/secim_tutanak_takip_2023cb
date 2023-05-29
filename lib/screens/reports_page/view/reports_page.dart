// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/navigation/navigation_service.dart';
import 'package:secim_tutanak_takip_2023cb/constants/enums/bloc_status.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/blocs/ballotbox/fetch_ballot_boxes_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/bottom_sheets/choose_school.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/ballotbox_model.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/view/ballotbox_detail.dart';

import '../../../base/service/translation/locale_keys.g.dart';
import '../../../components/bottom_sheet/bottom_sheet_main.dart';
import '../../../components/buttons/main_elevated_button.dart';
import '../../../constants/sizes/sizes.dart';
import '../../../constants/style/text_styles.dart';
import '../blocs/reports/reports_bloc.dart';
import '../bottom_sheets/choose_city.dart';
import '../bottom_sheets/choose_districts.dart';
import '../bottom_sheets/choose_neighborhoods.dart';
import '../providers/providers.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<void> refreshPage() async {
    if (mounted) {
      setState(() {});
    }
    refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ReportsBloc>(context, listen: false).add(ServiceEnabled());
    return SmartRefresher(
      controller: refreshController,
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
        return refreshPage();
      },
      child: BlocBuilder<ReportsBloc, ReportsState>(
        builder: (context, state) {
          if (state.serviceStatus == Status.networkReady) {
            return Scaffold(
              body: BuildScaffold(
                state: state,
              ),
            );
          } else if (state.serviceStatus == Status.networkError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(pagePadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Icon(
                      Icons.info,
                      size: 50,
                      color: Theme.of(context).colorScheme.error,
                    )),
                    Text(
                      LocaleKeys.errorText_networkFailed.tr(),
                      style: contextTitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      LocaleKeys.errorText_networkFailedContext.tr(),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            );
          } else if (state.serviceStatus == Status.networkNotReady) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(pagePadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Icon(
                      Icons.info,
                      size: 50,
                      color: Theme.of(context).colorScheme.error,
                    )),
                    Text(
                      LocaleKeys.errorText_networkNotReady.tr(),
                      style: contextTitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      LocaleKeys.errorText_networkNotReadyContext.tr(),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(pagePadding),
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
              ),
            );
          }
        },
      ),
    );
  }
}

class BuildScaffold extends StatelessWidget {
  final ReportsState state;
  const BuildScaffold({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(pagePadding),
        child: Column(
          children: [
            CityField(),
            SizedBox(
              height: 10,
            ),
            DistrictsField(),
            SizedBox(
              height: 10,
            ),
            NeighborhoodField(),
            SizedBox(
              height: 10,
            ),
            SchoolField(),
            SizedBox(
              height: 20,
            ),
            FetchBallotBoxButton(),
            SizedBox(
              height: 20,
            ),
            BuildBallotBoxGrid(),
          ],
        ),
      ),
    );
  }
}

class BuildBallotBoxGrid extends StatelessWidget {
  const BuildBallotBoxGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchBallotBoxesBloc, FetchBallotBoxesState>(
      buildWhen: (previous, current) => previous.model != current.model,
      builder: (context, state) {
        if (state.status == Status.success) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.model?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              BallotBoxes ballotBox = BallotBoxes.fromJson(state.model?[index]);
              return GestureDetector(
                onTap: () {
                  NavigationService.instance.navigatorKey.currentState
                      ?.push(MaterialPageRoute(
                    builder: (context) => BallotBoxDetail(ballotBox: ballotBox),
                  ));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(pagePadding),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(pagePadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Image.asset("assets/images/papers.png")),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${ballotBox.ballotBoxNumber ?? 0}",
                          style: contextTitleTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class FetchBallotBoxButton extends StatelessWidget {
  const FetchBallotBoxButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MainElevatedButton(
              buttonFunction: () {
                BlocProvider.of<FetchBallotBoxesBloc>(context).add(
                    FetchBallotBoxesEvent(
                        schoolId: context
                                .read<ChooseSchoolProvider>()
                                .getSchoolValue
                                .id ??
                            0));
              },
              buttonWidget: Text(LocaleKeys.mainText_fetchBallotBoxes.tr())),
        ),
      ],
    );
  }
}

class SchoolField extends StatelessWidget {
  const SchoolField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(pagePadding),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          )),
      onTap: () {
        MainComponents().openBottomSheet(context, const ChooseSchoolWidget());
      },
      title: Text(context.watch<ChooseSchoolProvider>().getSchoolValue.name ??
          LocaleKeys.mainText_chooseSchool.tr()),
    );
  }
}

class NeighborhoodField extends StatelessWidget {
  const NeighborhoodField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(pagePadding),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          )),
      onTap: () {
        MainComponents()
            .openBottomSheet(context, const ChooseNeighborhoodWidget());
      },
      title: Text(context
              .watch<ChooseNeighborhoodProvider>()
              .getNeighborhoodValue
              .neighborName ??
          LocaleKeys.mainText_chooseNeighborhood.tr()),
    );
  }
}

class DistrictsField extends StatelessWidget {
  const DistrictsField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(pagePadding),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          )),
      onTap: () {
        MainComponents()
            .openBottomSheet(context, const ChooseDistrictsWidget());
      },
      title: Text(context
              .watch<ChooseDistrictProvider>()
              .getDistrictValue
              .districtName ??
          LocaleKeys.mainText_chooseDistrict.tr()),
    );
  }
}

class CityField extends StatelessWidget {
  const CityField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(pagePadding),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          )),
      onTap: () {
        MainComponents().openBottomSheet(context, const ChooseCityWidget());
      },
      title: Text(context.watch<ChooseCityProvider>().getCityValue.name ??
          LocaleKeys.mainText_chooseCity.tr()),
    );
  }
}
