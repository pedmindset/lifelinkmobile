import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'calender_cell.dart';

class Calender extends StatelessWidget {
  Calender({Key? key, required this.margin}) : super(key: key);

  final EdgeInsets margin;
  final List<String> week = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
  final List arrayDay = [];

  final SwiperController swiperController = SwiperController();

  int totaldays(int month) {
    if (month == 2) {
      return (28);
    } else if (month == 4 || month == 6 || month == 9 || month == 11) {
      return (30);
    } else {
      return (31);
    }
  }

  @override
  Widget build(BuildContext context) {
    int element = DateTime.now().day - DateTime.now().weekday;
    int totalDay = totaldays(DateTime.now().month);
    for (var i = 0; i < 7; i++) {
      if (element > totalDay) element = 1;
      arrayDay.add(element);
      element++;
    }
    var i = -1;
    return Container(
      margin: margin,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom:
              BorderSide(width: 1.0, color: Color.fromRGBO(204, 204, 204, 1.0)),
        ),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: week.map((String week) {
            ++i;
            return CalenderCell(
                week: week,
                day: arrayDay[i].toString(),
                today: arrayDay[i] != DateTime.now().day ? false : true);
          }).toList()),
    );
  }
}
