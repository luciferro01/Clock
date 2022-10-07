import 'package:clock_application/data.dart';
import 'package:clock_application/enums.dart';
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
      body: SafeArea(
        child: Row(
          children: [
            Container(
              color: const Color.fromARGB(72, 69, 73, 106),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: menuItems.map((e) => iconMenu(e)).toList(),
              ),
            ),
            const VerticalDivider(
              width: 0,
              // thickness: ,
              indent: 60,
              endIndent: 60,
              color: Colors.white,
            ),
            Expanded(
              child: Consumer<MenuInfo>(
                builder: (context, value, child) {
                  if (value.menuType != MenuType.clock) return Container();
                  return Container(
                    padding: const EdgeInsets.all(32),
                    color: const Color(0xFF2D2F41),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SizedBox(height: 32),
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Consumer<MenuInfo> iconMenu(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (context, value, child) {
        return TextButton(
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            backgroundColor: currentMenuInfo.menuType == value.menuType
                ? const Color.fromARGB(110, 32, 39, 73)
                : Colors.transparent,
          ),
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenuInfo(currentMenuInfo);
          },
          child: Column(
            children: [
              Image.asset(
                currentMenuInfo.image!,
                scale: 1.5,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                currentMenuInfo.title!,
                style: const TextStyle(
                  fontFamily: 'avenir',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
    // );
  }
}
