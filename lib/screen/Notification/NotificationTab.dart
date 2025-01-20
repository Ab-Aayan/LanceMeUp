import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({
    super.key,
  });

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  /// List of Tab Bar Item
  List<String> items = [
    "All",
    "Invites",
    "Mentions",
    "Workspace",
    "Emails",
    "Unread",
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    final height = MediaQuery.of(context).size.height;
    final weight = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: height * 0.088,
        backgroundColor: Colors.white,
        title: const Text(
          'Notification',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        titleSpacing: -28,
        elevation: 1,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 19.0),
            child: Icon(
              FontAwesomeIcons.ellipsisVertical,
              color: Color.fromARGB(164, 0, 0, 0),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(12),
        child: Column(
          children: [
            /// TabBar
            SizedBox(
              width: double.infinity,
              height: height * 0.064,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              current = index;
                            },
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(5),
                          height: height * 0.04,
                          width: weight * 0.23,
                          decoration: BoxDecoration(
                            color: current == index
                                ? const Color(0xFF16A34A)
                                : const Color.fromARGB(172, 206, 202, 202),
                            borderRadius: current == index
                                ? BorderRadius.circular(15)
                                : BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              items[index],
                              style: GoogleFonts.laila(
                                fontWeight: FontWeight.w500,
                                color: current == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.0045,
            ),
            //Tab Body
            Expanded(
              child: ListView.builder(
                itemCount: _allUsers.length,
                itemBuilder: (context, index) => Card(
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _allUsers[index]['colors'],
                      radius: 24,
                      child: Icon(
                        _allUsers[index]['Icons'],
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      _allUsers[index]['tittle'],
                    ),
                    subtitle: Text(
                      '${_allUsers[index]["time"]}',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "tittle": "Jane Copper has downloaded  Wireframing Landing Page",
      "time": "2m ago",
      "Icons": FontAwesomeIcons.download,
      "colors": Colors.green,
    },
    {
      "id": 2,
      "tittle": "Jane Copper has mentioned you on Lancemeup workspace",
      "time": "2m ago",
      "Icons": FontAwesomeIcons.a,
      "colors": Colors.grey
    },
    {
      "id": 3,
      "tittle": "[REMINDER] Due date of Lancemeup Projects task will be coming",
      "time": "2m ago",
      "Icons": FontAwesomeIcons.timesCircle,
      "colors": Colors.blue
    },
    {
      "id": 4,
      "tittle": "Jane Copper has removed from workspace",
      "time": "2m ago",
      "Icons": FontAwesomeIcons.person,
      "colors": Colors.red
    },
    {
      "id": 5,
      "tittle": "Jane Copper reject the invitation from workspace",
      "time": "2m ago",
      "Icons": FontAwesomeIcons.timesCircle,
      "colors": Colors.yellow
    },
    {
      "id": 6,
      "tittle": "Jane Copper reject the invitation from workspace",
      "time": "2m ago",
      "Icons": FontAwesomeIcons.check,
      "colors": Colors.green
    },
    {
      "id": 7,
      "tittle": "Jane Copper reject the invitation from workspace",
      "time": "2m ago",
      "Icons": FontAwesomeIcons.check,
      "colors": Colors.green
    },
    {
      "id": 8,
      "tittle": "Jane Copper reject the invitation from workspace",
      "time": "2m ago",
      "Icons": FontAwesomeIcons.check,
      "colors": Colors.green
    },
  ];
}
