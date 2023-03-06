import 'package:flutter/material.dart';
import 'package:segunda_aplicaicon/models/models.dart';
import 'package:segunda_aplicaicon/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    // MenuOption(
    //   route: 'home',
    //   name: 'Home Screen',
    //   screen: const HomeScreen(),
    //   icon: Icons.home,
    // ),
    MenuOption(
      route: 'listview1',
      name: 'list view 1',
      screen: const ListViewScreen(),
      icon: Icons.list,
    ),
    MenuOption(
      route: 'listview2',
      name: 'list view 2',
      screen: const ListView2Screen(),
      icon: Icons.list_rounded,
    ),
    MenuOption(
      route: 'alert',
      name: 'Alertas',
      screen: const AlertScreen(),
      icon: Icons.warning_rounded,
    ),
    MenuOption(
      route: 'cards',
      name: 'tarjetas Cards',
      screen: const CardScreen(),
      icon: Icons.credit_card,
    ),
    MenuOption(
      route: 'avatar Circle',
      name: 'Avatar Circle',
      screen: const AvatarScreen(),
      icon: Icons.supervised_user_circle_outlined,
    ),
    MenuOption(
      route: 'animated screen',
      name: 'Animated screen',
      screen: const AnimatedScreen(),
      icon: Icons.animation_sharp,
    ),
    MenuOption(
      route: 'inputs',
      name: 'Text Inputs',
      screen: const InputsScreen(),
      icon: Icons.input_sharp,
    ),
    MenuOption(
      route: 'slider',
      name: 'Slider and checks',
      screen: const SliderScreen(),
      icon: Icons.image_aspect_ratio_sharp,
    ),
    MenuOption(
      route: 'listview_builder',
      name: 'InfiniteScrol & Pull to refresh',
      screen: const ListviewBuilderScreen(),
      icon: Icons.build_circle_outlined,
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'listview1': (BuildContext context) => const ListViewScreen(),
  //   'card_screen': (BuildContext context) => const CardScreen(),
  //   'alert_screen': (BuildContext context) => const AlertScreen(),
  //   'home2': (BuildContext context) => const ListView2Screen(),
  // };
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
