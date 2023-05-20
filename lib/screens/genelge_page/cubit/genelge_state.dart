part of 'genelge_cubit.dart';

@immutable
class GenelgeState {
    const GenelgeState({this.isLoading = false, this.genelgeModel});
  final bool isLoading;
  final GenelgeModel? genelgeModel;

  GenelgeState copyWith({
    final bool? isLoading,
    final GenelgeModel? genelgeModel,
  }) {
    return GenelgeState(isLoading: isLoading ?? this.isLoading, genelgeModel: genelgeModel ?? this.genelgeModel);
  }
}

