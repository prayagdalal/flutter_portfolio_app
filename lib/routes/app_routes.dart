import 'package:get/get.dart';
import 'package:portfolio/core/app_export.dart';
import 'package:portfolio/presentation/home_screen/binding/home_binding.dart';

class AppRoutes {
  static String homeScreen = '/home_screen';
  static String initialRoute = '/initialRoute';
  static List<GetPage> pages = [
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    )
  ];
}
