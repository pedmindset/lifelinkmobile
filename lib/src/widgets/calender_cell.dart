import 'package:flutter/material.dart';

class CalenderCell extends StatelessWidget {
  const CalenderCell(
      {Key? key, required this.week, required this.day, required this.today})
      : super(key: key);

  final String week;
  final String day;
  final bool today;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          week,
          style: const TextStyle(
              color: Color.fromRGBO(204, 204, 204, 1.0),
              fontSize: 12.0,
              fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
          child: Container(
            width: 35.0,
            height: 35.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: today
                    ? const Color.fromRGBO(204, 204, 204, 0.3)
                    : Colors.transparent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  day,
                  style: const TextStyle(
                      fontSize: 12.0, fontWeight: FontWeight.w400),
                ),
                today
                    ? Container(
                        padding: const EdgeInsets.only(top: 3.0),
                        width: 3.0,
                        height: 3.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(247, 64, 106, 1.0)),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
