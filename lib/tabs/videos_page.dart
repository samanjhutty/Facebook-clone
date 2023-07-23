import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideosTab extends StatefulWidget {
  const VideosTab({super.key});
  @override
  _VideosTabState createState() => _VideosTabState();
}

class _VideosTabState extends State<VideosTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.xMargin,
        ),
        child: Column(children: [
          pageHeader(
              title: Strings.videos,
              icon: Icons.video_collection_rounded,
              searchOnTap: () {}),
          const Divider(thickness: 1),
          Expanded(child: ListView())
        ]));
  }
}
