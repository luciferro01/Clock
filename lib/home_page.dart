import 'package:clock_application/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'clock_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  var formattedTime = DateFormat('HH:mm').format(DateTime.now());
  var formattedDate = DateFormat('EEE, d MMM').format(DateTime.now());
  var timeZoneString =
      DateTime.now().timeZoneOffset.toString().split('.').first;
  var offSetSign = '+';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconMenu('Clock', 'assets/clock_icon.png', context),
              iconMenu('Alarm', 'assets/alarm_icon.png', context),
              iconMenu('Timer', 'assets/timer_icon.png', context),
              iconMenu('StopWatch', 'assets/stopwatch_icon.png', context),
            ],
          ),
          const VerticalDivider(
            color: Colors.white,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              color: const Color(0xFF2D2F41),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Text(
                      'Clock',
                      style: TextStyle(
                          fontFamily: 'avenir',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedTime,
                          style: const TextStyle(
                            fontFamily: 'avenir',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 64,
                          ),
                        ),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                              fontFamily: 'avenir',
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const Flexible(
                    flex: 4,
                    fit: FlexFit.loose,
                    child: Align(
                      alignment: Alignment.center,
                      child: ClockView(
                        size: 200,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'TimeZone',
                          style: TextStyle(
                            fontFamily: 'avenir',
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              'UTC $offSetSign$timeZoneString',
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'avenir',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton iconMenu(String title, String image, BuildContext context) {
    return TextButton(
      //  padding = EdgeInsets.symmetric(horizontal: 0, vertical: 14),
      onPressed: () {
        var menuInfo = Provider.of<MenuInfo>(context);
        menuInfo.updateMenuInfo(menuInfo);
      },
      child: Column(
        children: [
          Image.asset(
            image,
            scale: 1.5,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'avenir',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
    // );
  }
}
