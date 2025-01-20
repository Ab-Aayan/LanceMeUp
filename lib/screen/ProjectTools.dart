import 'package:flutter/material.dart';
import 'package:lancemeup/components/Cards.dart';

class ProjectTools extends StatefulWidget {
  const ProjectTools({super.key});

  @override
  State<ProjectTools> createState() => _ProjectToolsState();
}

class _ProjectToolsState extends State<ProjectTools> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 22),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: CardCard(),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: CardCard(),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: CardCard(),
          ),
        ],
      ),
    );
  }
}
