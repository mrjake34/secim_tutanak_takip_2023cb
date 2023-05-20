import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../base/service/navigation/navigation_service.dart';
import '../../../base/service/translation/locale_keys.g.dart';
import '../../../base/service/utils/utils.dart';
import '../../../constants/colors/constant_colors.dart';
import '../../../constants/navigation/navigation.dart';
import '../../../constants/sizes/sizes.dart';
import '../../../constants/style/text_styles.dart';
import '../../../constants/urls/urls.dart';
import '../cubit/resource_cubit.dart';
import '../cubit/resource_state.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({super.key});

  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  late final ResourceCubit _resourceCubit;

  @override
  void initState() {
    super.initState();
    _resourceCubit = ResourceCubit();
  }

  @override
  Widget build(BuildContext context) {
    final Size pageSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => _resourceCubit,
      child: BlocConsumer<ResourceCubit, ResourceState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BuildScaffold(
            pageSize: pageSize,
            resourceCubit: _resourceCubit,
          );
        },
      ),
    );
  }
}

class BuildScaffold extends StatelessWidget {
  const BuildScaffold({
    super.key,
    required this.pageSize,
    required this.resourceCubit,
  });
  final ResourceCubit resourceCubit;
  final Size pageSize;

  Future<void> openVideo() async {
    if (!await launchUrl(Uri.parse(youtubeVideoUrl),
        mode: LaunchMode.externalApplication)) {
      UtilsService.instance
          .errorSnackBar(LocaleKeys.errorText_errorWhileOpenYoutubeLink.tr());
    }
  }

  Future<void> openEdicationalLink() async {
    if (!await launchUrl(Uri.parse(edicationalSetUrl),
        mode: LaunchMode.externalNonBrowserApplication)) {
      UtilsService.instance.errorSnackBar(
          LocaleKeys.errorText_errorWhileOpenEducationalLink.tr());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(pagePadding),
        width: pageSize.width,
        child: Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  openVideo();
                },
                child: Container(
                  width: pageSize.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(buttonRadius),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/video.png",
                        height: pageSize.height * 0.15,
                      ),
                      Text(
                        LocaleKeys.mainText_howUseVideo.tr(),
                        style: contextTitleTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  openEdicationalLink();
                },
                child: Container(
                  width: pageSize.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(buttonRadius),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/papers.png",
                        height: pageSize.height * 0.15,
                      ),
                      Text(
                        LocaleKeys.mainText_electionDayDocuments.tr(),
                        style: contextTitleTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  NavigationService.instance
                      .navigateToPage(path: NavigationConstants.genelgePage);
                },
                child: Container(
                  width: pageSize.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(buttonRadius),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/resources-details.png",
                        height: pageSize.height * 0.15,
                      ),
                      Text(
                        LocaleKeys.mainText_135noDocument.tr(),
                        style: contextTitleTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
