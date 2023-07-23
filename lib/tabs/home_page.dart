import 'package:facebook/bars/menubar.dart';
import 'package:facebook/bars/postbar.dart';
import 'package:facebook/bars/posts.dart';
import 'package:facebook/bars/storybar.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) => ListView(
        children: const [
          Postbar(),
          Divider(thickness: 1),
          StoryBar(),
          Divider(thickness: 1),
          MenuBar(),
          Divider(thickness: 3),
          Posts()
        ],
      );
}
