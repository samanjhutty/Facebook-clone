import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/image_path.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/assets/theme.dart';
import 'package:facebook/bars/posts.dart';
import 'package:facebook/pages/notifications.dart';
import 'package:facebook/tabs/friends_page.dart';
import 'package:facebook/tabs/market_page.dart';
import 'package:facebook/pages/profile.dart';
import 'package:facebook/tabs/videos_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Drawer(
        backgroundColor: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                height: 100,
                child: DrawerHeader(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                          splashRadius: Dimens.iconSplashRadius),
                      const Text(Strings.menu,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                          splashRadius: Dimens.iconSplashRadius)
                    ]))),
            Expanded(
                child: ListView(
              children: [
                ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage(ImagePath.myImage),
                    ),
                    title: const Text(
                      Strings.username,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Dimens.titleMed),
                    ),
                    subtitle: const Text(Strings.profileTip),
                    onTap: () => gotoPage(page: const Profile())),
                Container(
                  margin: const EdgeInsets.all(Dimens.margin),
                  child: Table(children: [
                    TableRow(children: [
                      cardView(
                          onTap: () {},
                          icon: Icon(Icons.coronavirus_rounded,
                              color: Themes.errorColor),
                          title: const Text(Strings.covid)),
                      cardView(
                          onTap: () => gotoPage(page: const Notifications()),
                          icon:
                              Icon(Icons.notifications, color: scheme.primary),
                          title: const Text(Strings.noti)),
                    ]),
                    TableRow(children: [
                      cardView(
                          onTap: () => gotoPage(page: const FriendsTab()),
                          icon: Icon(Icons.people_alt, color: scheme.primary),
                          title: const Text(Strings.friends)),
                      cardView(
                          onTap: () => gotoPage(
                                  page: ListView(
                                children: const [Posts()],
                              )),
                          icon:
                              Icon(Icons.pages_rounded, color: scheme.primary),
                          title: const Text(Strings.pages)),
                    ]),
                    TableRow(children: [
                      cardView(
                          onTap: () => gotoPage(page: const VideosTab()),
                          icon: Icon(Icons.video_collection_rounded,
                              color: scheme.primary),
                          title: const Text(Strings.videos)),
                      cardView(
                          onTap: () => gotoPage(page: const MarketTab()),
                          icon:
                              Icon(Icons.store_rounded, color: scheme.primary),
                          title: const Text(Strings.market)),
                    ])
                  ]),
                ),
                const Divider(thickness: 1),
                ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.settings,
                        color: Themes.defaultIconColor),
                    title: const Text(Strings.settings)),
                ListTile(
                    onTap: () {},
                    leading:
                        const Icon(Icons.info, color: Themes.defaultIconColor),
                    title: const Text(Strings.about)),
                ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.privacy_tip,
                        color: Themes.defaultIconColor),
                    title: const Text(Strings.privacy)),
                ListTile(
                    onTap: () {},
                    leading:
                        Icon(Icons.logout_rounded, color: Themes.errorColor),
                    title: const Text(Strings.logout)),
              ],
            ))
          ],
        ));
  }
}
