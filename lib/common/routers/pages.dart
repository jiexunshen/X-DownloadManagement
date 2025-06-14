
import 'package:get/get.dart';

import '../../pages/index.dart';
import 'names.dart';

class RoutePages {
  static List<GetPage> list = [
      GetPage(
        name: RouteNames.login,
        page: () => const LoginPage(),
      ),
      GetPage(
        name: RouteNames.main,
        page: () => const MainPage(),
      ),
  ];
}
