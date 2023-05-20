import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/json/constants_json.dart';
import '../model/genelge_model.dart';

part 'genelge_state.dart';

class GenelgeCubit extends Cubit<GenelgeState> {
  GenelgeCubit() : super(const GenelgeState(isLoading: true));

    Future<void> getList() async {
    final json = await rootBundle.loadString(ConstantsJson.genelgeJson);
    final jsonDecoded = jsonDecode(json);
    GenelgeModel  genelgeService = GenelgeModel.fromJson(jsonDecoded);
    emit(state.copyWith(isLoading: false, genelgeModel: genelgeService));
  }
}
