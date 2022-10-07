import 'package:clock_application/enums.dart';
import 'package:clock_application/modals/alarm_info.dart';
import 'package:clock_application/theme_data.dart';

import 'menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock, title: 'Clock', image: 'assets/clock_icon.png'),
  MenuInfo(MenuType.stopWatch,
      title: 'StopWatch', image: 'assets/stopwatch_icon.png'),
  MenuInfo(MenuType.timer, title: 'Timer', image: 'assets/timer_icon.png'),
  MenuInfo(MenuType.alarm, title: 'Alarm', image: 'assets/alarm_icon.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(
    DateTime.now().add(const Duration(hours: 1)),
    true,
    description: 'Office',
    gradientColors: GradientColors.fire,
  ),
  AlarmInfo(
    DateTime.now().add(const Duration(hours: 3)),
    true,
    description: 'Home',
    gradientColors: GradientColors.sky,
  ),
];
