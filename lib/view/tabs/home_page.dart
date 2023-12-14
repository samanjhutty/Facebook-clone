import 'package:facebook/view/widgets/menubar.dart';
import 'package:facebook/view/widgets/postbar.dart';
import 'package:facebook/view/widgets/posts.dart';
import 'package:facebook/view/widgets/storybar.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) => ListView(
        children: const [
          Postbar(),
          Divider(thickness: 1),
          StoryBar(),
          Divider(thickness: 1),
          MyMenuBar(),
          Divider(thickness: 3),
          Posts()
        ],
      );
}
