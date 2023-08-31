import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/assets/theme.dart';
import 'package:facebook/model/profile_model.dart';
import 'package:facebook/pages/profile.dart';
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
          Expanded(
            child: ListView(
                padding: const EdgeInsets.only(bottom: Dimens.margin),
                children: [
                  for (int i = 0; i < profileData.length; i++) ...[
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: Dimens.minMargin),
                        child: Row(children: [
                          iconBtn(
                              onPressed: () => gotoPage(page: const Profile()),
                              iconSize: Dimens.avatarLarge,
                              icon: CircleAvatar(
                                radius: Dimens.avatarLarge,
                                backgroundImage:
                                    AssetImage(profileData[i].avatarImage),
                              )),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: Dimens.margin),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: Dimens.minMargin),
                                height: Dimens.avatarLarge,
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: Dimens.margin),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(profileData[i].username),
                                              iconBtn(
                                                  splashRadius:
                                                      Dimens.miniSplashRadius,
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                      Icons.more_horiz))
                                            ]),
                                      ),
                                      Row(children: [
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: Dimens.minMargin),
                                          child: TextButton(
                                              style: textBtnStyle(
                                                  border:
                                                      Dimens.miniBorderRadius,
                                                  color: Themes.primaryColor),
                                              onPressed:
                                                  profileData[i].confirmReq,
                                              child:
                                                  const Text(Strings.confirm)),
                                        )),
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: Dimens.minMargin),
                                          child: TextButton(
                                            style: textBtnStyle(
                                                border: Dimens.miniBorderRadius,
                                                color: Themes.primaryColor),
                                            onPressed: profileData[i].deleteReq,
                                            child: const Text(Strings.delete),
                                          ),
                                        ))
                                      ])
                                    ]),
                              ),
                            ),
                          )
                        ]))
                  ]
                ]),
          ),
        ]));
  }
}
