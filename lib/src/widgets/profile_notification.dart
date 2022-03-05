import 'package:flutter/material.dart';

class ProfileNotification extends StatelessWidget {
  const ProfileNotification(
      {Key? key,
      required this.containerGrowAnimation,
      required this.profileImage})
      : super(key: key);
  final Animation<double> containerGrowAnimation;
  final DecorationImage profileImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: containerGrowAnimation.value * 60,
          height: containerGrowAnimation.value * 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: profileImage,
          ),
        ),
        Container(
          width: containerGrowAnimation.value * 30,
          height: containerGrowAnimation.value * 30,
          margin: const EdgeInsets.only(
            left: 40.0,
          ),
          child: Center(
            child: Text("3",
                style: TextStyle(
                    fontSize: containerGrowAnimation.value * 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)),
          ),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(80, 210, 194, 1.0),
          ),
        ),
      ],
    );
  }
}
