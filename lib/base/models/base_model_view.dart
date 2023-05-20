import '../service/cache/shared_service.dart';
import '../service/navigation/navigation_service.dart';
import '../service/utils/utils.dart';

mixin class BaseModelView {

  SharedManager sharedManager = SharedManager.instance;
  NavigationService navService = NavigationService.instance;
  UtilsService utils = UtilsService.instance;
}