import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/translation/locale_keys.g.dart';
import 'package:secim_tutanak_takip_2023cb/components/bottom_sheet/bottom_sheet_main.dart';
import 'package:secim_tutanak_takip_2023cb/constants/colors/constant_colors.dart';
import 'package:secim_tutanak_takip_2023cb/constants/style/text_styles.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/ballotbox_model.dart';

class BallotBoxDetail extends StatelessWidget {
  final BallotBoxes ballotBox;
  const BallotBoxDetail({super.key, required this.ballotBox});

  @override
  Widget build(BuildContext context) {
    String bulluredImage =
        ballotBox.cmResult?.imageUrl?.replaceAll("raw", "blurred-min") ?? "";
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${ballotBox.ballotBoxNumber} ${LocaleKeys.mainText_ballotBoxNo.tr()}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Text(LocaleKeys.mainText_schoolName.tr()),
              trailing: Text(ballotBox.schoolName ?? ""),
            ),
            const Divider(
              color: dividerColor,
            ),
            ListTile(
              leading: Text(LocaleKeys.mainText_totalVotes.tr()),
              trailing: Text("${ballotBox.cmResult?.totalVote ?? 0}"),
            ),
            const Divider(
              color: dividerColor,
            ),
            ListTile(
              leading: Text(LocaleKeys.mainText_erdogan.tr()),
              trailing: Text("${ballotBox.cmResult?.votes?.i1 ?? 0}"),
            ),
            const Divider(
              color: dividerColor,
            ),
            ListTile(
              leading: Text(LocaleKeys.mainText_kilicdaroglu.tr()),
              trailing: Text("${ballotBox.cmResult?.votes?.i2 ?? 0}"),
            ),
            GestureDetector(
              onTap: () {
                MainComponents().openBottomSheetNoScrollable(
                  context,
                  InteractiveViewer(
                    child: Image.network(
                      bulluredImage,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text(
                            LocaleKeys.mainText_reportImageError.tr(),
                            style: contextTitleTextStyle,
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              child: Image.network(
                bulluredImage,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(
                      LocaleKeys.mainText_reportImageError.tr(),
                      style: contextTitleTextStyle,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
