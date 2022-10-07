import 'package:clock_application/enums.dart';

import 'menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock, title: 'Clock', image: 'assets/clock_icon.png'),
  MenuInfo(MenuType.stopWatch,
      title: 'StopWatch', image: 'assets/stopwatch_icon.png'),
  MenuInfo(MenuType.timer, title: 'Timer', image: 'assets/timer_icon.png'),
  MenuInfo(MenuType.alarm, title: 'Alarm', image: 'assets/alarm_icon.png'),
];
