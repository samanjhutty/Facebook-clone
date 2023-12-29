import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/view/pages/profile.dart';
import 'package:facebook/view/widgets/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Postbar extends StatefulWidget {
  const Postbar({super.key});

  @override
  State<Postbar> createState() => _PostbarState();
}

class _PostbarState extends State<Postbar> {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: iconBtn(
          tooltip: Strings.profileTip,
          padding: const EdgeInsets.all(Dimens.minMargin),
          onPressed: () => gotoPage(page: const Profile()),
          icon: user!.photoURL == null
              ? const CircleAvatar(child: Icon(Icons.person))
              : CircleAvatar(
                  backgroundImage: NetworkImage(user.photoURL!),
                )),
      title: Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimens.minMargin),
        child: TextButton(
          onPressed: () {
            Get.rawSnackbar(message: 'Comming soon');
          },
          style: textBtnStyle(
              color: scheme.secondaryContainer.withOpacity(0.2),
              border: Dimens.margin,
              alignment: Alignment.centerLeft),
          child: const Text(Strings.thoughts),
        ),
      ),
      trailing: iconBtn(
        tooltip: Strings.albumTip,
        icon: const Icon(Icons.photo_album_outlined),
        onPressed: () {
          Get.rawSnackbar(message: 'Comming soon');
        },
      ),
    );
  }
}
