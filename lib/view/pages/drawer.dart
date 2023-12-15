import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/controller/signin_controller.dart';
import 'package:facebook/view/widgets/posts.dart';
import 'package:facebook/view/pages/notifications.dart';
import 'package:facebook/view/tabs/friends_page.dart';
import 'package:facebook/view/tabs/market_page.dart';
import 'package:facebook/view/tabs/videos_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../widgets/assets.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    Size device = MediaQuery.of(context).size;

    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Drawer(
        shape: const RoundedRectangleBorder(),
        width: double.infinity,
        backgroundColor: scheme.background,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
              height: device.height * 0.12,
              child: DrawerHeader(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    IconButton(
                        onPressed: () => Get.back(),
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
              child: ListView(children: [
            ListTile(
              onTap: () => Get.toNamed('/profile'),
              leading: CircleAvatar(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: user!.photoURL == null
                    ? const Icon(Icons.person)
                    : Image.network(user.photoURL.toString(),
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover),
              )),
              title: Text(
                  user.photoURL == null ? 'Username' : user.displayName!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: const Text('View your profile',
                  style: TextStyle(fontSize: 12)),
            ),
            Container(
              margin: const EdgeInsets.all(Dimens.margin),
              child: Table(children: [
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
                      icon: Icon(Icons.pages_rounded, color: scheme.primary),
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
                      icon: Icon(Icons.store_rounded, color: scheme.primary),
                      title: const Text(Strings.market))
                ]),
                TableRow(children: [
                  cardView(
                      onTap: () => gotoPage(page: const Notifications()),
                      icon: Icon(Icons.notifications, color: scheme.primary),
                      title: const Text(Strings.noti)),
                  const SizedBox()
                ]),
              ]),
            ),
            const Divider(thickness: 1),
            ListTile(
                onTap: () {
                  Get.rawSnackbar(message: 'Comming Soon!');
                },
                leading: const Icon(Icons.settings),
                title: const Text(Strings.settings)),
            ListTile(
                onTap: () async {
                  await context.read<SignInAuth>().logout();
                  Get.back();
                },
                leading: const Icon(Icons.logout_rounded),
                title: const Text('Logout')),
            ListTile(
                onTap: () async {
                  final authrovider = FirebaseAuth
                      .instance.currentUser!.providerData[0].providerId;
                  if (authrovider == 'password') {
                    Get.toNamed('/reauth');
                  } else if (authrovider == 'phone') {
                    Get.rawSnackbar(message: 'Please wait for a few seconds');
                    await context.read<SignInAuth>().sendOTP();
                  } else {
                    Get.rawSnackbar(message: 'Please wait for a few seconds');
                    await context.read<SignInAuth>().reauth();
                  }
                },
                leading:
                    const Icon(Icons.delete_forever_rounded, color: Colors.red),
                title: const Text('Delete Account'))
          ]))
        ]));
  }
}
