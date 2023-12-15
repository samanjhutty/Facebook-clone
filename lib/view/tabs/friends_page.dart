import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/model/profile_model.dart';
import 'package:facebook/view/pages/profile.dart';
import 'package:flutter/material.dart';
import '../widgets/assets.dart';

class FriendsTab extends StatefulWidget {
  const FriendsTab({super.key});
  @override
  State<FriendsTab> createState() => _FriendsTabState();
}

class _FriendsTabState extends State<FriendsTab> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.xMargin),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            pageHeader(
                title: Strings.friends,
                icon: Icons.people_alt_rounded,
                searchOnTap: () {}),
            const Divider(thickness: 1),
            const Text(Strings.friendReq),
            Expanded(
              child: SizedBox(
                width:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 470
                        : double.infinity,
                child: ListView(
                    padding: const EdgeInsets.only(bottom: Dimens.margin),
                    children: [
                      for (int i = 0; i < profileData.length; i++) ...[
                        SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: Dimens.minMargin),
                            child: Row(children: [
                              iconBtn(
                                  onPressed: () =>
                                      gotoPage(page: const Profile()),
                                  icon: CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        AssetImage(profileData[i].avatarImage),
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: Dimens.margin),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: Dimens.margin),
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(profileData[i].username),
                                                ]),
                                          ),
                                        ),
                                        Row(children: [
                                          Expanded(
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal:
                                                            Dimens.minMargin),
                                                child: TextButton(
                                                    style: textBtnStyle(
                                                        border: Dimens
                                                            .miniBorderRadius,
                                                        color: scheme
                                                            .primaryContainer),
                                                    onPressed: profileData[i]
                                                        .confirmReq,
                                                    child: const Text(
                                                        Strings.confirm))),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal:
                                                          Dimens.minMargin),
                                              child: TextButton(
                                                style: textBtnStyle(
                                                    color:
                                                        scheme.primaryContainer,
                                                    border: Dimens
                                                        .miniBorderRadius),
                                                onPressed:
                                                    profileData[i].deleteReq,
                                                child:
                                                    const Text(Strings.delete),
                                              ),
                                            ),
                                          )
                                        ])
                                      ]),
                                ),
                              )
                            ]),
                          ),
                        )
                      ]
                    ]),
              ),
            ),
          ])),
    );
  }
}
