
import 'package:flutter/material.dart';

@immutable
class ResourceState {
  final bool isLoading;

  const ResourceState({this.isLoading = true});

    ResourceState copyWith({
    final bool? isLoading,
  }) {
    return ResourceState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
