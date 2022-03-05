import 'package:flutter/material.dart';
import 'package:lifelink_app/src/utils/constutils.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

import '../utils/spaces.dart';
import '../widgets/bezier_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = ConstUtils.getSize(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SizedBox(
        child: Column(
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height * .3,
              decoration: BoxDecoration(
                color: Colors.green[800],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Stack(children: [
                Positioned(top: 40, left: 0, child: _backButton()),
                Positioned(
                    top: -screenSize.height * .15,
                    right: -screenSize.width * .4,
                    child: const BezierContainer()),
                SizedBox(
                  width: screenSize.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.lightBlue[400],
                        ),
                        child: Icon(
                          Icons.person,
                          size: 56,
                          color: Colors.blue[800],
                        ),
                      ),
                      const SpaceH16(),
                      Text(
                        'Username'.toUpperCase(),
                        style: const TextStyle(
                            letterSpacing: 2,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ]),
            ),
            const SpaceH36(),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    trailing: const Icon(Icons.chevron_right),
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.green),
                      child: const Center(
                          child: Icon(
                        Icons.view_list_outlined,
                        size: 20,
                        color: Colors.white,
                      )),
                    ),
                    title: const Text('My Events'),
                  ),
                  ListTile(
                    onTap: () {},
                    trailing: const Icon(Icons.chevron_right),
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue),
                      child: const Center(
                          child: Icon(
                        Icons.contact_phone_rounded,
                        size: 20,
                        color: Colors.white,
                      )),
                    ),
                    title: const Text('Contact us'),
                  ),
                  ListTile(
                    onTap: () => _logout(),
                    trailing: const Icon(Icons.chevron_right),
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.red),
                      child: const Center(
                          child: Icon(
                        Icons.logout_rounded,
                        size: 20,
                        color: Colors.white,
                      )),
                    ),
                    title: const Text('Log out'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: const Icon(Icons.keyboard_arrow_left, color: Colors.white),
            ),
            const Text(
              'Back',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  _logout() {
    Dialogs.materialDialog(
      context: context,
      msg: 'Are you sure you want to log out?',
      msgStyle: const TextStyle(color: Colors.red),
      color: Colors.white,
      title: 'Log out',
      barrierDismissible: true,
      actions: [
        IconsButton(
          onPressed: () {
            Navigator.pop(context);
          },
          text: 'No',
          iconData: Icons.close_rounded,
          iconColor: Colors.white,
          color: Colors.blue[600],
          textStyle: const TextStyle(color: Colors.white),
        ),
        IconsButton(
          onPressed: () {
            Navigator.pop(context);
          },
          text: 'Yes',
          iconData: Icons.logout,
          iconColor: Colors.white,
          color: Colors.red[600],
          textStyle: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
