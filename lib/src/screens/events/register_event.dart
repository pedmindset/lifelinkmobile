import 'package:flutter/material.dart';
import 'package:lifelink_app/src/widgets/back_button.dart';

import '../../utils/constutils.dart';
import '../../utils/spaces.dart';
import '../../widgets/entry_field.dart';

class EventRegisterScreen extends StatefulWidget {
  const EventRegisterScreen({Key? key}) : super(key: key);

  @override
  _EventRegisterScreenState createState() => _EventRegisterScreenState();
}

class _EventRegisterScreenState extends State<EventRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = ConstUtils.getSize(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SizedBox(
        height: screenSize.height,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/home.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * .14,
              left: 0,
              right: 0,
              bottom: screenSize.height * .12,
              child: Container(
                width: screenSize.width,
                // height: screenSize.height,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Column(
                  children: [
                    const SpaceH16(),
                    const ListTile(
                      title: Text(
                        "Portmore Fest",
                        style: TextStyle(
                            fontSize: 24.0,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 12,
                          itemBuilder: (context, i) {
                            return const EntryField(
                                title: 'Username',
                                label: 'Enter your full name',
                                isPassword: false);
                          }),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(top: 30, child: BackButtonWidget()),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _submitButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (_) => const MainScreen() ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 72, 99, 251),
                  Color.fromARGB(255, 80, 43, 247)
                ])),
        child: const Text(
          'Apply Now',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
