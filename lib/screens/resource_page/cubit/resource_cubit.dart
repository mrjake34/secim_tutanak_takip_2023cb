import 'package:flutter_bloc/flutter_bloc.dart';

import 'resource_state.dart';

class ResourceCubit extends Cubit<ResourceState> {
  ResourceCubit() : super(ResourceState());
}
