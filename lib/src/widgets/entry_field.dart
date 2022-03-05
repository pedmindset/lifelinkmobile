import 'package:flutter/material.dart';

import '../utils/sizes.dart';

class EntryField extends StatelessWidget {
  const EntryField(
      {Key? key,
      required this.title,
      required this.label,
      required this.isPassword})
      : super(key: key);
  final String title;
  final String label;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(
          //   title,
          //   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          TextField(
            obscureText: isPassword,
            style: const TextStyle(fontSize: Sizes.textSize_16),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: label,
              floatingLabelStyle: const TextStyle(fontSize: Sizes.textSize_14),
              fillColor: const Color(0xfff3f3f4),
              filled: true,
            ),
          )
        ],
      ),
    );
  }
}
