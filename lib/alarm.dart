import 'package:clock_application/constants/constants.dart';
import 'package:clock_application/data.dart';
import 'package:clock_application/theme_data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class Alarm extends StatelessWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: khomePageColour,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Alarm',
              style: kheadingTextStyle,
            ),
            Expanded(
              child: ListView(
                  children: alarms.map<Widget>((alarm) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: alarm.gradientColors!,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: alarm.gradientColors!.last.withOpacity(0.4),
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: const Offset(4, 4),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.label,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Office',
                                  style: kheadingTextStyle,
                                ),
                              ],
                            ),
                          ),
                          Switch(
                            value: true,
                            onChanged: (bool value) {
                              // value = !value;
                            },
                            activeColor: Colors.white,
                          )
                        ],
                      ),
                      const Text(
                        'Mon - Fri',
                        style: kheadingTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            '7:00 AM',
                            style: TextStyle(
                              fontFamily: 'avenir',
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).followedBy([
                DottedBorder(
                  strokeWidth: 3,
                  color: CustomColors.clockOutline,
                  dashPattern: const [9, 6],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(24),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                      color: CustomColors.clockBG,
                    ),
                    // height: 100,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 30)),
                      onPressed: (() {}),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/add_alarm.png',
                            scale: 1.5,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Add Alarm'),
                        ],
                      ),
                    ),
                  ),
                )
              ]).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
