import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:lifelink_app/src/screens/events/event_detail.dart';
import 'package:lifelink_app/src/screens/events/register_event.dart';
import 'package:lifelink_app/src/screens/profile.dart';
import 'package:lifelink_app/src/utils/constutils.dart';
import 'package:lifelink_app/src/utils/spaces.dart';
import 'package:table_calendar/table_calendar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late AnimationController _screenController;
  late Animation<double> containerGrowAnimation;
  late Animation<double> listTileWidth;
  late Animation<Alignment> listSlideAnimation;
  late Animation<EdgeInsets> listSlidePosition;
  late Animation fadeScreenAnimation;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _screenController = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);

    fadeScreenAnimation = ColorTween(
      begin: const Color.fromARGB(255, 196, 142, 44),
      end: const Color.fromRGBO(247, 64, 106, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _screenController,
        curve: Curves.ease,
      ),
    );

    containerGrowAnimation = CurvedAnimation(
      parent: _screenController,
      curve: Curves.easeIn,
    );
    containerGrowAnimation.addListener(() {
      setState(() {});
    });
    containerGrowAnimation.addStatusListener((AnimationStatus status) {});

    listTileWidth = Tween<double>(
      begin: 1000.0,
      end: 600.0,
    ).animate(
      CurvedAnimation(
        parent: _screenController,
        curve: const Interval(
          0.225,
          0.600,
          curve: Curves.bounceIn,
        ),
      ),
    );

    listSlideAnimation = AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(
      CurvedAnimation(
        parent: _screenController,
        curve: const Interval(
          0.325,
          0.700,
          curve: Curves.ease,
        ),
      ),
    );

    listSlidePosition = EdgeInsetsTween(
      begin: const EdgeInsets.only(bottom: 16.0),
      end: const EdgeInsets.only(bottom: 80.0),
    ).animate(
      CurvedAnimation(
        parent: _screenController,
        curve: const Interval(
          0.325,
          0.800,
          curve: Curves.ease,
        ),
      ),
    );

    _screenController.forward();
  }

  @override
  void dispose() {
    _screenController.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return WillPopScope(
  //       onWillPop: () async => _willPop(context),
  //       child: MaterialApp(
  //         home: DefaultTabController(
  //             length: 3,
  //             child: Scaffold(
  //               appBar: AppBar(
  //                 elevation: 1,
  //                 bottom: const TabBar(
  //                   tabs: _tabs,
  //                   indicatorColor: Colors.white,
  //                 ),
  //                 title: const Text('Life Link Gh'),
  //                 backgroundColor: Colors.teal,
  //               ),
  //               body: const TabBarView(
  //                 physics: BouncingScrollPhysics(),
  //                 dragStartBehavior: DragStartBehavior.down,
  //                 children: _tabView,
  //               ),
  //             )),
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => _willPop(context),
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            // elevation: 1,
            centerTitle: false,
            title: Image.asset(
              'assets/images/logo_white.png',
              width: 140,
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.person),
                tooltip: 'Profile',
                onPressed: () async => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                ),
              ),
            ],
            backgroundColor: Colors.teal,
          ),
          body: SizedBox(
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    onTap: _showDateTimeSheet,
                    leading: const Icon(
                      Icons.date_range_rounded,
                      color: Colors.black87,
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Events',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, letterSpacing: 0.8),
                        ),
                        Text(
                          DateFormat.MMMMd().format(_selectedDate),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_drop_down_circle_rounded),
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      Fluttertoast.showToast(msg: 'Refreshing');
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const EventDetailScreen(),
                            ),
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            margin: const EdgeInsets.all(8),
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: ConstUtils.fullWidth(context),
                                    height: 180,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/home.jpeg'),
                                          fit: BoxFit.cover,
                                          filterQuality: FilterQuality.medium,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      'Barcelona new boys',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 26,
                                          height: 26,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.green),
                                          child: const Center(
                                              child: Icon(
                                            Icons.timer,
                                            size: 14,
                                            color: Colors.white,
                                          )),
                                        ),
                                        const SpaceW16(),
                                        const Text('24 December, 2013')
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const EventRegisterScreen(),
                                        ),
                                      ),
                                      child: const Text('Register'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _showDateTimeSheet() {
    return showModalBottomSheet(
      context: context,
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      builder: (context) {
        return Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: const Text(
                'Select Event Month',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              indent: 8,
              endIndent: 8,
              height: 2,
              color: Colors.grey[300],
            ),
            SizedBox(
              child: TableCalendar(
                focusedDay: _selectedDate,
                firstDay:
                    DateTime(int.parse(ConstUtils.getYear(_selectedDate))),
                lastDay:
                    DateTime(int.parse(ConstUtils.getYear(_selectedDate)) + 1),
                onDaySelected: _onDaySelected,
              ),
            ),
          ],
        );
      },
    );
  }
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = ConstUtils.getSize(context);
//     return WillPopScope(
//       onWillPop: () async => _willPop(context),
//       child: Scaffold(
//         body: SizedBox(
//           width: screenSize.width,
//           height: screenSize.height,
//           child: Stack(
//             // alignment: Alignment.bottomRight,
//             children: <Widget>[
//               Positioned(
//                   bottom: -screenSize.height * .25,
//                   right: -screenSize.width * .1,
//                   child: const RotatedBox(
//                       quarterTurns: 2, child: BezierContainer())),
//               Column(
//                 children: [
//                   ImageBackground(
//                     backgroundImage: backgroundImage,
//                     containerGrowAnimation: containerGrowAnimation,
//                     profileImage: profileImage,
//                     // month: month,
//                     // selectbackward: _selectbackward,
//                     // selectforward: _selectforward,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Upcoming Event',
//                           style: TextStyle(
//                               fontSize: 20,
//                               letterSpacing: 3,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         InkWell(
//                           onTap: () async {
//                             DateTime? selectedDate = await showDatePicker(
//                               context: context,
//                               initialDate: _today,
//                               firstDate: DateTime.utc(2020),
//                               lastDate: DateTime.utc(2040),
//                             );

//                             if (selectedDate != null) {
//                               _today = selectedDate;
//                               log("$_today");
//                               // get events using the selected date
//                             }
//                           },
//                           child: Row(children: [
//                             const Icon(Icons.calendar_today),
//                             const SpaceW12(),
//                             Text(
//                               DateTime.now().day.toString() +
//                                   ' ' +
//                                   DateFormat.MMMM().format(
//                                     DateTime.now(),
//                                   ),
//                               style: TextStyle(
//                                   color: Colors.grey[600], fontSize: 14),
//                             )
//                           ]),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: ListView(
//                       shrinkWrap: _screenController.value < 1 ? false : true,
//                       padding: const EdgeInsets.all(0.0),
//                       children: <Widget>[
//                         //new Calender(),
//                         // TableCalendar(),
//                         ListViewContent(
//                           listSlideAnimation: listSlideAnimation,
//                           listSlidePosition: listSlidePosition,
//                           listTileWidth: listTileWidth,
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               FadeBox(
//                 fadeScreenAnimation: fadeScreenAnimation,
//                 containerGrowAnimation: containerGrowAnimation,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

  void _onDaySelected(DateTime _selectDay, DateTime _focusDay) {
    if (!isSameDay(_selectedDate, _selectDay)) {
      setState(() {
        _selectedDate = _selectDay;
        // _focusedDay = _focusDay;
      });
      Navigator.pop(context);
    }
  }

  Future<bool> _willPop(BuildContext context) async {
    return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Exit'),
              content: const Text(
                'Are you sure you want to exit',
                textAlign: TextAlign.center,
              ),
              actions: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text(
                          'No',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ),
                    ]),
              ],
            )));
  }
}
