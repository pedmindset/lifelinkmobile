import 'package:flutter/material.dart';
import 'package:lifelink_app/src/screens/auth/login_screen.dart';
import 'package:lifelink_app/src/screens/events/register_event.dart';
import 'package:lifelink_app/src/utils/shared_utils.dart';
import 'package:lifelink_app/src/utils/spaces.dart';
import 'profile_notification.dart';

class ImageBackground extends StatelessWidget {
  const ImageBackground({
    Key? key,
    required this.backgroundImage,
    required this.containerGrowAnimation,
    required this.profileImage,
    // required this.month,
    // required this.selectbackward,
    // required this.selectforward,
  }) : super(key: key);
  final DecorationImage backgroundImage;
  final DecorationImage profileImage;
  // final VoidCallback selectbackward;
  // final VoidCallback selectforward;
  // final String month;
  final Animation<double> containerGrowAnimation;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final Orientation orientation = MediaQuery.of(context).orientation;
    bool isLandscape = orientation == Orientation.landscape;
    final isLog = PreferenceUtils.getBool(prefLoggedIn);

    return Stack(
      children: [
        Container(
          width: screenSize.width,
          height: screenSize.height / 2.4,
          decoration: BoxDecoration(
              image: backgroundImage,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12))),
        ),
        Container(
          width: screenSize.width,
          height: screenSize.height / 2.4,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: <Color>[
              Color.fromRGBO(110, 101, 103, 0.6),
              Color.fromRGBO(51, 51, 63, 0.9),
            ],
            stops: [0.2, 1.0],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.0, 1.0),
          )),
          child: isLandscape
              ? ListView(
                  children: <Widget>[
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Good " + greeting() + '!',
                          style: const TextStyle(
                              fontSize: 20,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Good " + greeting() + '!',
                          style: const TextStyle(
                              fontSize: 30.0,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                        ProfileNotification(
                          containerGrowAnimation: containerGrowAnimation,
                          profileImage: profileImage,
                        ),
                        // MonthView(
                        //   month: month,
                        //   selectbackward: selectbackward,
                        //   selectforward: selectforward,
                        // )
                      ],
                    )
                  ],
                )
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SpaceH44(),
                      Container(
                        alignment: Alignment.centerRight,
                        child: isLog
                            ? ProfileNotification(
                                containerGrowAnimation: containerGrowAnimation,
                                profileImage: profileImage,
                              )
                            : const SizedBox.shrink(),
                      ),

                      const SpaceH48(),
                      const Text(
                        "Portmore Fest",
                        style: TextStyle(
                            fontSize: 30.0,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.location_on_rounded,
                          color: Colors.yellow,
                        ),
                        title: Text(
                          'Suns Beach Result',
                          style: TextStyle(
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.calendar_today_rounded,
                            color: Colors.orange),
                        title: Text(
                          '14th - 22nd Feb, 2022',
                          style: TextStyle(
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            if (isLog) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const EventRegisterScreen()));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text('Account Not Found'),
                                        content: const Text(
                                          'Login / Register to access the platform',
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                              builder: (_) =>
                                                  const LoginScreen(),
                                            )),
                                            child: const Text(
                                              'Login',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: Colors.blue),
                                            ),
                                          ),
                                        ],
                                      ));
                            }
                          },
                          child: const Text('Register Now',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                      // MonthView(
                      //   month: month,
                      //   selectbackward: selectbackward,
                      //   selectforward: selectforward,
                      // )
                    ],
                  ),
                ),
        ),
      ],
    );
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }

    return 'Evening';
  }
}
