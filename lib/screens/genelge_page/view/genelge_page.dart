import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/service/translation/locale_keys.g.dart';
import '../../../constants/sizes/sizes.dart';
import '../cubit/genelge_cubit.dart';
import '../model/genelge_model.dart';
import '../service/genelge_provider.dart';

class GenelgePage extends StatefulWidget {
  const GenelgePage({super.key});

  @override
  State<GenelgePage> createState() => _GenelgePageState();
}

class _GenelgePageState extends State<GenelgePage> {
  late final GenelgeCubit _genelgeCubit;
  GenelgeModel? genelgeModel;
  String searchTerm = "";

  @override
  void initState() {
    super.initState();
    _genelgeCubit = GenelgeCubit();
    _genelgeCubit.getList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _genelgeCubit,
      child: BlocConsumer<GenelgeCubit, GenelgeState>(
        listener: (context, state) {
          if (state.genelgeModel != null) {
            genelgeModel = state.genelgeModel;
          }
        },
        builder: (context, state) {
          return BuildScaffold(
            genelgeModel: genelgeModel ?? GenelgeModel(),
          );
        },
      ),
    );
  }
}

class BuildScaffold extends StatelessWidget {
  final GenelgeModel genelgeModel;
  const BuildScaffold({
    super.key,
    required this.genelgeModel,
  });

  @override
  Widget build(BuildContext context) {
    List<Genelge>? genelgeList = genelgeModel.genelge
        ?.where((element) => element
            .toJson()
            .values
            .toString()
            .toLowerCase()
            .contains(context.watch<SearchBarProviderGenelge>().getSearchTerm))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mainText_title.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: pagePadding),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: TextFormField(
                      onChanged: (value) {
                        context.read<SearchBarProviderGenelge>().setSearchTerm =
                            value.toLowerCase();
                      },
                      decoration: InputDecoration(
                          hintText: LocaleKeys.mainText_searchGenelge.tr(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.circular(buttonRadius)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.circular(buttonRadius))),
                    ),
                  ),
                ],
              ),
            ),
            Text(LocaleKeys.mainText_genelgePageContext.tr()),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: genelgeList?.length,
                itemBuilder: (context, index) {
                  Genelge? genelge = genelgeList?[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: pagePadding),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 232, 232, 232)),
                          borderRadius: BorderRadius.circular(buttonRadius)),
                      child: ExpansionTile(
                        collapsedBackgroundColor:
                            const Color.fromARGB(255, 250, 250, 250),
                        title: Text(genelge?.title ?? ""),
                        subtitle: Text(genelge?.subTitle ?? ""),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SelectableText(genelge?.context ?? ""),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
