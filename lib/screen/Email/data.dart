import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MailItem {
  String title, description, content, time;
  bool isRead, favselect;

  IconData iconData;
  OutlinedButton? textButton;
  CircleAvatar? image;

  MailItem({
    required this.title,
    required this.description,
    required this.content,
    required this.time,
    required this.isRead,
    required this.favselect,
    required this.iconData,
    this.textButton,
    this.image,
  });
}

double MySize = 0.0;
double kPadding = MySize * 0.025;

List<MailItem> mailList = [
  MailItem(
      title: 'Welcome to LMU mailer',
      description: 'Lorem ipsum dolor sit amet',
      content: 'Consectetur adipiscing elit. Aenean',
      time: '8:00 AM',
      iconData: FontAwesomeIcons.star,
      isRead: false,
      favselect: false,
      image: const CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(
          'assets/images/man1.jpg',
        ),
      ) //.asset('assets/images/man1.jpg'),
      ),
  MailItem(
    title: 'Unread email & starred',
    description: 'Lorem ipsum dolor sit amet',
    content: 'Consectetur adipiscing elit. Aenean',
    time: 'Dec 19',
    iconData: FontAwesomeIcons.solidStar,
    isRead: true,
    favselect: true,
  ),
  MailItem(
    title: 'Important Email',
    description: 'Lorem ipsum dolor sit amet',
    content: 'Consectetur adipiscing elit. Aenean',
    time: 'Dec 18',
    iconData: FontAwesomeIcons.star,
    isRead: false,
    favselect: false,
  ),
  MailItem(
    title: 'Email with Attachment',
    description: 'Lorem ipsum dolor sit amet',
    content: 'Consectetur adipiscing elit. Aenean',
    time: '8.00 AM',
    iconData: FontAwesomeIcons.star,
    isRead: true,
    favselect: false,
    textButton: OutlinedButton.icon(
      // <-- TextButton
      onPressed: () {},
      icon: const Icon(
        Icons.image,
        size: 24.0,
        color: Colors.black,
      ),
      label: const Text(
        'CoverPreview.jpg',
        style: TextStyle(color: Colors.black),
      ),
    ),
  ),
  MailItem(
    title: 'Email with zip Attachment',
    description: 'Lorem ipsum dolor sit amet',
    content: 'Consectetur adipiscing elit. Aenean',
    time: '8:00 AM',
    iconData: FontAwesomeIcons.star,
    isRead: false,
    favselect: false,
    textButton: OutlinedButton.icon(
      // <-- TextButton
      onPressed: () {},
      icon: const Icon(
        Icons.file_present,
        size: 24.0,
        color: Colors.black,
      ),
      label: const Text(
        'Image_file.zip',
        style: TextStyle(color: Colors.black),
      ),
    ),
  ),
];
