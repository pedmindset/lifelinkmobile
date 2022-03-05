import 'package:flutter/material.dart';
import 'package:lifelink_app/src/screens/events/event_detail.dart';

class ListData extends StatelessWidget {
  const ListData({
    Key? key,
    required this.margin,
    required this.subtitle,
    required this.title,
    required this.width,
    required this.image,
  }) : super(key: key);
  final EdgeInsets margin;
  final double width;
  final String title;
  final String subtitle;
  final DecorationImage image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const EventDetailScreen()));
      },
      child: Container(
        alignment: Alignment.center,
        margin: margin,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
                width: 1.0, color: Color.fromRGBO(204, 204, 204, 0.3)),
            bottom: BorderSide(
                width: 1.0, color: Color.fromRGBO(204, 204, 204, 0.3)),
          ),
        ),
        child: Row(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(
                    left: 20.0, top: 10.0, bottom: 10.0, right: 20.0),
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  image: image,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
