import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

CardCard() {
  final List<ImageProvider> _images = [
    const ExactAssetImage('assets/images/ppp1.webp'),
    const ExactAssetImage('assets/images/ppp2.webp'),
    const ExactAssetImage('assets/images/ppp3.jpg'),
    const ExactAssetImage('assets/images/ppp4.jpg'),
  ];
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    color: Colors.white,
    elevation: 10,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 14.0),
                      child: Text(
                        'Ravamp Project',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    FaIcon(
                      FontAwesomeIcons.globe,
                      color: Color.fromRGBO(124, 190, 100, 0.788),
                    ),
                  ],
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: FaIcon(FontAwesomeIcons.ellipsisVertical),
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Text(
                    'Template:',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 34.0),
                  child: Text(
                    'Kanban',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Text(
                    'Status:',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 55.0),
                  child: Text(
                    'On hold',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Text(
                    'Last Updated:',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.0),
                  child: Text(
                    '2m ago',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Expanded(
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromRGBO(124, 190, 100, 0.788),
                      ),
                      backgroundColor: Color(0xffD6D6D6),
                      value: 0.4,
                      minHeight: 8,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    '40%',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromRGBO(123, 202, 95, 1),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: FlutterImageStack.providers(
                    providers: _images,
                    itemRadius: 60,
                    totalCount: 4,
                    itemCount: 4,
                    showTotalCount: false,
                    itemBorderWidth: 8,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ],
    ),
  );
}
