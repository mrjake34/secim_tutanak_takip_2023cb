import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/translation/locale_keys.g.dart';

import '../../../base/service/navigation/navigation_service.dart';
import '../../../constants/enums/bloc_status.dart';
import '../../../constants/sizes/sizes.dart';
import '../../../constants/style/text_styles.dart';
import '../blocs/ballotbox/fetch_ballot_boxes_bloc.dart';
import '../model/ballotbox_model.dart';
import '../providers/providers.dart';
import 'ballotbox_detail.dart';

class BuildBallotBoxGrid extends StatelessWidget {
  const BuildBallotBoxGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FetchBallotBoxesBloc>(context).add(FetchBallotBoxesEvent(
        schoolId: context.read<ChooseSchoolProvider>().getSchoolValue.id ?? 0));
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mainText_reports.tr()),
      ),
      body: BlocBuilder<FetchBallotBoxesBloc, FetchBallotBoxesState>(
        builder: (context, state) {
          print("State ${state.model}");
          if (state.status == Status.success) {
            print("Grid ${state.model}");
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.model?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                BallotBoxes ballotBox =
                    BallotBoxes.fromJson(state.model?[index]);
                return GestureDetector(
                  onTap: () {
                    NavigationService.instance.navigatorKey.currentState
                        ?.push(MaterialPageRoute(
                      builder: (context) =>
                          BallotBoxDetail(ballotBox: ballotBox),
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
      ),
    );
  }
}
