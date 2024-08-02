import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
part 'a_router.gr.dart';


@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
@LazySingleton()
class ARouter extends _$ARouter {
 @override
  List<AutoRoute> get routes => [];
}