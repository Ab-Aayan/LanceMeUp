import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Email/data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: height * 0.013),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(padding: EdgeInsets.all(12)),
                Text(
                  'Profile',
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.013,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 22),
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://www.woolha.com/media/2020/03/eevee.png',
                        ),
                        radius: 30,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: width * 0.009),
                const Expanded(
                  child: ListTile(
                    title: Text(
                      "Jane Copper",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "janecopper@gmail.com",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.0156,
            ),
            const Divider(
              thickness: 1.6,
            ),
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  SizedBox(
                    height: height * 0.011,
                  ),
                  buildAccountOptionRow(
                      context,
                      "Set Status",
                      Icons.person_outlined,
                      Icons.arrow_forward_ios,
                      "Online",
                      Icons.circle),
                  buildAccountOptionRow(context, "Account", Icons.person,
                      Icons.arrow_forward_ios),
                  buildAccountOptionRow(context, "Activity",
                      FontAwesomeIcons.clock, Icons.arrow_forward_ios),
                  buildAccountOptionRow(context, "Connections", Icons.group,
                      Icons.arrow_forward_ios),
                  SizedBox(
                    height: height * 0.009,
                  ),
                  const Divider(
                    thickness: 1.6,
                  ),
                  SizedBox(
                    height: height * 0.009,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      'App Settings',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.011,
                  ),
                  buildAccountOptionRow(context, "Notification",
                      Icons.notifications_none, Icons.arrow_forward_ios),
                  buildAccountOptionRow(context, "Appearance", Icons.palette,
                      Icons.arrow_forward_ios, "Light"),
                  SizedBox(
                    height: height * 0.0156,
                  ),
                  const Divider(
                    thickness: 1.6,
                  ),
                  SizedBox(
                    height: height * 0.011,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      'More',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.011,
                  ),
                  buildAccountOptionRow(
                    context,
                    "Privacy Policy",
                    FontAwesomeIcons.shield,
                  ),
                  buildAccountOptionRow(
                    context,
                    "Terms & Conditions",
                    Icons.description,
                  ),
                  buildAccountOptionRow(context, "Help & Support",
                      Icons.contact_support, Icons.arrow_forward_ios),
                  buildAccountOptionRow(context, "FAQs",
                      Icons.contact_support_rounded, Icons.arrow_forward_ios),
                  SizedBox(
                    height: height * 0.0156,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.011,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Add your logout logic here
                          _logoutbottomSheet(context);
                        },
                        icon: const Icon(Icons.logout),
                        color: Colors.red,
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Logout",
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              _logoutbottomSheet(context);
                            },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOptionRow(
    BuildContext context,
    String title,
    IconData, [
    IconData? iconData,
    String status = '',
    IconData? icon,
  ]) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 10.2),
              child: Icon(
                IconData,
                color: Colors.grey,
                size: 23,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Icon(
                icon,
                color: Colors.green,
                size: 8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Text(
                status,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 22.0),
              child: Icon(
                iconData,
                size: 19,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //forget password
  _logoutbottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext c) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Scaffold(
            body: _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Center(
                          child: Icon(
                            Icons.remove,
                            size: 42,
                          ),
                        ),
                        const Text(
                          "Are you sure?",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                            "Are you sure you want to logout from the workspace?",
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                        const SizedBox(height: 24),
                        SizedBox(
                          height: 46,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: TextButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(185, 244, 67, 54)),
                            onPressed: () {},
                            child: const Text('Logout'),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Cancel',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
