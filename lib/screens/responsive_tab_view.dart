import 'package:flutter/material.dart';
import 'package:visa_form/screens/application_form.dart';

import 'notification_pop_up.dart';

class ResponsiveTabView extends StatefulWidget {
  const ResponsiveTabView({super.key});

  @override
  _ResponsiveTabViewState createState() => _ResponsiveTabViewState();
}

class _ResponsiveTabViewState extends State<ResponsiveTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> headers = [
    'Dashboard',
    'e-Kannstalt File',
    'IVAC File',
    'VFS Poland OTP',
    'VFS In-Italy Otp',
    'VTS Itly U:P&B',
    'Slovakia',
    'VFS Portugral',
    'Lithunia',
    'NPL Lithunia',
    'Legal Matter',
    'VFS Crotida',
    'VFS Nepal-Japan',
    'Payment',
    'Log Out'
  ];

  List<IconData> icons = [
    Icons.dashboard,
    Icons.person,
    Icons.settings,
    Icons.search,
    Icons.favorite,
    Icons.notifications,
    Icons.message,
    Icons.shopping_cart,
    Icons.star,
    Icons.camera_alt,
    Icons.label,
    Icons.email, // Email icon
    Icons.email_outlined, // Map icon
    Icons.video_camera_back_sharp, // Lock icon
    Icons.payment, // payment icon
    Icons.logout, // logout icon
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: headers.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = MediaQuery.sizeOf(context).height;
        final width = MediaQuery.sizeOf(context).width;
        bool isDesktop = width > 500;

        return Scaffold(
            key: _scaffoldKey, // Assign the GlobalKey here
            appBar: AppBar(
              backgroundColor: Color(0xFF34495f),
              title: const Text(
                'Visa Appointment System',
                style: TextStyle(color: Colors.white),
              ),
              leading: !isDesktop
                  ? IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Open the Drawer
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    )
                  : null,
              actions: [
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return NotificationPopup(
                            message:
                                "This is a notification message It can be long enough to test scrolling behavior.It can be long enough to test scrolling behavior.It can be long enough to test scrolling behavior.It can be long enough to test scrolling behavior.This is a notification message It can be long enough to test scrolling behavior.It can be long enough to test scrolling behavior.It can be long enough to test scrolling behavior.It can be long enough to test scrolling behavior.",
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.notifications, color: Colors.white,))
              ],
              // bottom: isDesktop
              //     ? PreferredSize(
              //         preferredSize: const Size.fromHeight(50),
              //         child: TabBar(
              //           labelColor: Colors.white,
              //           unselectedLabelColor: Colors.white,
              //           controller: _tabController,
              //           isScrollable: true,
              //           tabs: headers
              //               .asMap()
              //               .map((index, header) => MapEntry(
              //             index,
              //             Tab(
              //               text: header,
              //               icon: Icon(icons[index]),
              //             ),
              //           ))
              //               .values
              //               .toList(),
              //         ),
              //       )
              //     : null,
            ),
            drawer: !isDesktop
                ? Drawer(
                    backgroundColor: Color(0xFF34495f),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: headers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Icon(
                            icons[index],
                            color: Colors.white,
                          ),
                          title: Text(
                            headers[index],
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              _tabController.index = index;
                            });
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  )
                : null,
            body: Row(
              children: [
                isDesktop
                    ? Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(color: Color(0xFF34495f)),
                          child: ListView.builder(
                              itemCount: headers.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _tabController.index = index;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(width: width * .01),
                                          Icon(
                                            icons[index],
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: width * .01),
                                          Text(
                                            headers[index],
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                  ],
                                );
                              }),
                        ))
                    : SizedBox.shrink(),
                Expanded(
                  flex: 6,
                  child: TabBarView(controller: _tabController, children: [
                    ApplicationForm(),
                    ...headers
                        .sublist(1)
                        .map((headers) => Center(
                              child: Text('$headers page'),
                            ))
                        .toList()
                  ]),
                ),
              ],
            ));
      },
    );
  }
}
