import 'package:get/get.dart';

import 'app_route.dart';
import 'binding/province_binding.dart';
import 'page/province_page.dart';

class AppPage {
  static const kInitial = AppRoute.kProvinceRoute;
  static final routes = [
    GetPage(
      name: AppRoute.kProvinceRoute,
      page: () => const ProvincePage(),
      bindings: [
        ProvinceBinding(),
      ],
    ),
  ];
}
