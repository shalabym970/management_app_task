import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:getx_mvc_templet/app/modules/root/bindings/root_binding.dart';
import 'package:getx_mvc_templet/app/modules/root/views/root_view.dart';

import '../middleware/auth_middleware.dart';

import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import 'app_routes.dart';

class ThemeAppPages {
  static final routes = [
    GetPage(
        name: Routes.login,
        page: () => const LoginView(),
        binding: LoginBinding(),
        middlewares: [AuthMiddleware()],
        transition: Transition.zoom),
    GetPage(
      name: Routes.root,
      page: () => RootView(),
      binding: RootBinding(),
    ),
  ];
}
