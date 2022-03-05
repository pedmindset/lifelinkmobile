import 'package:flutter/material.dart';
import 'package:lifelink_app/src/utils/spaces.dart';

import '../../utils/constutils.dart';
import 'register_event.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({Key? key}) : super(key: key);

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
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
              top: screenSize.height * .22,
              left: 0,
              right: 0,
              bottom: 12,
              child: Container(
                width: screenSize.width,
                // height: screenSize.height,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: ListView(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
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
                    ListTile(
                      leading: const Icon(Icons.calendar_today_rounded,
                          color: Colors.orange),
                      title: Text(
                        '14th - 22nd Feb, 2022',
                        style: TextStyle(
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.location_on_rounded,
                        color: Colors.yellow,
                      ),
                      title: Text(
                        'Suns Beach Result',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[200],
                    ),
                    const ListTile(
                      title: Text(
                        "About the event",
                        style: TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "About this event, is more than we can buy and taste. Meanwhile Leanny threw away all the bum bums and considered quitting.",
                        style: TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[200],
                    ),
                    const ListTile(
                      title: Text(
                        "Forms",
                        style: TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, i) {
                        return Card(
                          child: ListTile(
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(12),
                            // ),
                            // tileColor: Colors.grey[300],
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Form Name'),
                                ElevatedButton(
                                    onPressed: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const EventRegisterScreen(),
                                          ),
                                        ),
                                    child: const Text('Register')),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SpaceH96(),
                  ],
                ),
              ),
            ),
            Positioned(top: 30, child: _backButton()),
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
              child: Icon(Icons.keyboard_arrow_left, color: Colors.grey[800]),
            ),
            Text(
              'Back',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800]),
            )
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
