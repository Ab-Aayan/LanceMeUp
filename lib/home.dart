import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'screen/ProjectTools.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.087,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/lego11.png',
                fit: BoxFit.contain,
                height: height * 0.0423,
              ),
            ],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'Lancemeup',
                style: TextStyle(color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 4),
                child: Icon(
                  FontAwesomeIcons.angleDown,
                  color: Color.fromARGB(193, 36, 35, 35),
                  size: 19,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0, top: 2),
              child: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.search,
                  color: Color.fromARGB(174, 36, 35, 35),
                  size: 22,
                ),
                onPressed: () {},
              ),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorWeight: 4,
            labelColor: Colors.grey,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3.2,
                color: Color.fromRGBO(98, 178, 70, 1),
              ),
            ),
            tabs: [
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      FontAwesomeIcons.briefcase,
                      color: Colors.grey,
                    ),
                    SizedBox(width: width * 0.009),
                    const Text(
                      'Project Tools',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      FontAwesomeIcons.commenting,
                      color: Colors.grey,
                    ),
                    SizedBox(width: width * 0.009),
                    const Text(
                      'Chat',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      FontAwesomeIcons.folderClosed,
                    ),
                    SizedBox(width: width * 0.009),
                    const Text(
                      'Drive',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(FontAwesomeIcons.clockFour),
                    SizedBox(width: width * 0.009),
                    const Text(
                      'Track',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          titleSpacing: 20,
        ),
        body: TabBarView(
          children: [
            const ProjectTools(),
            //buildPage('Home Page'),
            buildPage('Feed Page'),
            buildPage('Profile Page'),
            buildPage('Settings Page'),
          ],
        ),
      ),
    );
  }

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 28),
        ),
      );
}
