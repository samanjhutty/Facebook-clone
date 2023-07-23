import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/assets/theme.dart';
import 'package:facebook/model/profile_model.dart';
import 'package:flutter/material.dart';

class FriendsTab extends StatefulWidget {
  const FriendsTab({super.key});
  @override
  _FriendsTabState createState() => _FriendsTabState();
}

class _FriendsTabState extends State<FriendsTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.xMargin),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        pageHeader(
            title: Strings.friends,
            icon: Icons.people_alt_rounded,
            searchOnTap: () {}),
        const Divider(thickness: 1),
        const Text(Strings.friendReq),
        SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: Dimens.margin),
            child: Wrap(
              children: [for (int i = 0; i < profileData.length; i++) ...[]],
            )),
      ]),
    );
  }
}
