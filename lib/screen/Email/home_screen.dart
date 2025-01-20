import 'package:flutter/material.dart';
import 'package:lancemeup/screen/Email/data.dart';

class EmailHome extends StatefulWidget {
  const EmailHome({super.key});

  @override
  State<EmailHome> createState() => _EmailHomeState();
}

class _EmailHomeState extends State<EmailHome> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: height * 0.04),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    size: 28,
                    color: Colors.black54,
                  ),
                  onPressed: () {},
                ),
                Expanded(
                  child: SizedBox(
                    height: height * 0.049,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                          top: 10,
                          left: 12,
                        ), // add vertical padding here
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(157, 160, 159, 159)),
                          borderRadius: BorderRadius.circular(
                              4), // add border radius here
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2,
                              color: Color.fromARGB(166, 172, 171, 171)),
                          borderRadius: BorderRadius.circular(
                              4), // add border radius here
                        ),
                        hintText: "Search mails",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(206, 158, 158, 158),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 12.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/man1.jpg'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.014,
            ),
            const Divider(
              thickness: 1.6,
            ),

            Padding(
              padding: EdgeInsets.only(top: width * 0.02, left: width * 0.04),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "All Inbox",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: height * 0.008),
            //Content Mails
            Expanded(
              flex: 1,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: mailList.length,
                itemBuilder: (context, index) {
                  return MailItemWidget(
                    title: mailList[index].title,
                    description: mailList[index].description,
                    content: mailList[index].content,
                    time: mailList[index].time,
                    iconData: mailList[index].iconData,
                    isRead: mailList[index].isRead,
                    favselect: mailList[index].favselect,
                    textButton: mailList[index].textButton,
                    image: mailList[index].image,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // FloatingActionButton Compose New Email Button
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 171, 253, 219),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black26,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.edit,
                color: Colors.black,
                size: 22,
              ),
              SizedBox(height: height * 0.048, width: width * 0.024),
              const Text(
                'Compose New Email',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// this is the widget which is help to display mail
class MailItemWidget extends StatelessWidget {
  const MailItemWidget({
    required this.title,
    required this.description,
    required this.content,
    required this.time,
    required this.isRead,
    required this.iconData,
    required this.favselect,
    this.textButton,
    this.image,
    Key? key,
  }) : super(key: key);
  final String title, description, content, time;
  final bool isRead;
  final IconData iconData;
  final bool favselect;
  final OutlinedButton? textButton;
  final CircleAvatar? image;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      padding: const EdgeInsets.only(
        top: 28.0,
        left: 8,
        right: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black26,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Expanded(
        flex: 1,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 62.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: image ??
                    CircleAvatar(
                      radius: 24,
                      child: Text(title.substring(0, 1)),
                    ),
              ),
            ),
            const SizedBox(
              width: 22,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    isRead ? FontWeight.w100 : FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.00667,
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight:
                              isRead ? FontWeight.w100 : FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.0045,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: isRead ? Colors.black : Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          content,
                          style: TextStyle(
                            color: isRead ? Colors.black : Colors.grey,
                          ),
                        ),
                      ),
                      Icon(
                        iconData,
                        color: favselect
                            ? const Color.fromARGB(237, 255, 159, 95)
                            : Colors.black,
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: textButton ??
                        const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
