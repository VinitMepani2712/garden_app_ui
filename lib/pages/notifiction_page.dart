import 'package:flutter/material.dart';
import 'package:garden_app_ui/pages/widget_support.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Expanded(
        child: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Color(0xff0E74BC),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 50),
                labelColor: Color(0xff0E74BC),
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Color.fromARGB(0, 0, 0, 0);
                    }
                    return Color.fromARGB(0, 0, 0, 0);
                  },
                ),
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Unread'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Today',
                                style: AppWidget.courseLightTextStyle()),
                            Card(
                              color: Color(0xffE4EFF7),
                              elevation: 5,
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.only(left: 05, right: 05),
                                leading: Stack(
                                  children: [
                                    CircleAvatar(
                                      minRadius: 35,
                                      maxRadius: 35,
                                      foregroundImage:
                                          AssetImage("assets/images/2.png"),
                                    ),
                                    Positioned(
                                      top: 35,
                                      bottom: 0,
                                      left: 45,
                                      right: 0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: Icon(
                                          Icons.favorite_rounded,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text('Andrew reacted to your comment'),
                                subtitle: Text('23 mins ago',
                                    style: AppWidget.priceTextStyle()),
                                trailing: Icon(Icons.circle_sharp,
                                    color: Color(0xff0E74BC)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Card(
                              color: Color(0xffE4EFF7),
                              elevation: 5,
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.only(left: 05, right: 05),
                                leading: Stack(
                                  children: [
                                    CircleAvatar(
                                      minRadius: 35,
                                      maxRadius: 35,
                                      foregroundImage:
                                          AssetImage("assets/images/2.png"),
                                    ),
                                    Positioned(
                                      top: 35,
                                      bottom: 0,
                                      left: 45,
                                      right: 0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.blue,
                                        child: Icon(
                                          Icons.thumb_up,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text('Jacklin liked your comment'),
                                subtitle: Text('23 mins ago',
                                    style: AppWidget.priceTextStyle()),
                                trailing: Icon(Icons.circle_sharp,
                                    color: Color(0xff0E74BC)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Card(
                              color: Color(0xffE4EFF7),
                              elevation: 5,
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.only(left: 05, right: 05),
                                leading: Stack(
                                  children: [
                                    CircleAvatar(
                                      minRadius: 35,
                                      maxRadius: 35,
                                      foregroundImage:
                                          AssetImage("assets/images/2.png"),
                                    ),
                                    Positioned(
                                      top: 35,
                                      bottom: 0,
                                      left: 45,
                                      right: 0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: Icon(
                                          Icons.favorite_rounded,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text('Andrew reacted to your comment'),
                                subtitle: Text('23 mins ago',
                                    style: AppWidget.priceTextStyle()),
                                trailing: Icon(Icons.circle_sharp,
                                    color: Color(0xff0E74BC)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Card(
                              elevation: 1,
                              color: Colors.white,
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.only(left: 05, right: 05),
                                leading: Stack(
                                  children: [
                                    CircleAvatar(
                                      minRadius: 35,
                                      maxRadius: 35,
                                      foregroundImage:
                                          AssetImage("assets/images/2.png"),
                                    ),
                                    Positioned(
                                      top: 35,
                                      bottom: 0,
                                      left: 45,
                                      right: 0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: Icon(
                                          Icons.favorite_rounded,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text('Andrew reacted to your comment'),
                                subtitle: Text('23 mins ago',
                                    style: AppWidget.priceTextStyle()),
                              ),
                            ),
                            SizedBox(
                              height: 05,
                            ),
                            Text(
                              'Yesterday',
                              style: AppWidget.courseLightTextStyle(),
                            ),
                            Card(
                              elevation: 1,
                              color: Colors.white,
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.only(left: 05, right: 05),
                                leading: Stack(
                                  children: [
                                    CircleAvatar(
                                      minRadius: 35,
                                      maxRadius: 35,
                                      foregroundImage:
                                          AssetImage("assets/images/2.png"),
                                    ),
                                    Positioned(
                                      top: 35,
                                      bottom: 0,
                                      left: 45,
                                      right: 0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: Icon(
                                          Icons.favorite_rounded,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text('Andrew reacted to your comment'),
                                subtitle: Text('Thursday 10:45 am',
                                    style: AppWidget.priceTextStyle()),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Card(
                              elevation: 1,
                              color: Colors.white,
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.only(left: 05, right: 05),
                                leading: Stack(
                                  children: [
                                    CircleAvatar(
                                      minRadius: 35,
                                      maxRadius: 35,
                                      foregroundImage:
                                          AssetImage("assets/images/2.png"),
                                    ),
                                    Positioned(
                                      top: 35,
                                      bottom: 0,
                                      left: 45,
                                      right: 0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: Icon(
                                          Icons.favorite_rounded,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text('Andrew reacted to your comment'),
                                subtitle: Text('Thursday 12:45 pm',
                                    style: AppWidget.priceTextStyle()),
                              ),
                            ),
                            SizedBox(
                              height: 05,
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Unread Box
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            elevation: 5,
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.only(left: 05, right: 05),
                              leading: Stack(
                                children: [
                                  CircleAvatar(
                                    minRadius: 35,
                                    maxRadius: 35,
                                    foregroundImage:
                                        AssetImage("assets/images/2.png"),
                                  ),
                                  Positioned(
                                    top: 35,
                                    bottom: 0,
                                    left: 45,
                                    right: 0,
                                    child: Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                              title: Text('Andrew reacted to your comment'),
                              subtitle: Text('23 mins ago'),
                              trailing: Icon(Icons.circle_sharp,
                                  color: Color(0xff0E74BC)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            elevation: 5,
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.only(left: 05, right: 05),
                              leading: Stack(
                                children: [
                                  CircleAvatar(
                                    minRadius: 35,
                                    maxRadius: 35,
                                    foregroundImage:
                                        AssetImage("assets/images/2.png"),
                                  ),
                                  Positioned(
                                    top: 35,
                                    bottom: 0,
                                    left: 45,
                                    right: 0,
                                    child: Icon(
                                      Icons.thumb_up,
                                      color: Color.fromARGB(255, 0, 4, 255),
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                              title: Text('Jacklin liked your comment'),
                              subtitle: Text('23 mins ago'),
                              trailing: Icon(Icons.circle_sharp,
                                  color: Color(0xff0E74BC)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            elevation: 5,
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.only(left: 05, right: 05),
                              leading: Stack(
                                children: [
                                  CircleAvatar(
                                    minRadius: 35,
                                    maxRadius: 35,
                                    foregroundImage:
                                        AssetImage("assets/images/2.png"),
                                  ),
                                  Positioned(
                                    top: 35,
                                    bottom: 0,
                                    left: 45,
                                    right: 0,
                                    child: Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                              title: Text('Andrew reacted to your comment'),
                              subtitle: Text('23 mins ago'),
                              trailing: Icon(Icons.circle_sharp,
                                  color: Color(0xff0E74BC)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
