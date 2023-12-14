import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/image_path.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/assets/theme.dart';
import 'package:facebook/view/pages/profile.dart';
import 'package:facebook/view/widgets/assets.dart';
import 'package:flutter/material.dart';

class Postbar extends StatefulWidget {
  const Postbar({super.key});

  @override
  State<Postbar> createState() => _PostbarState();
}

class _PostbarState extends State<Postbar> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: iconBtn(
          tooltip: Strings.profileTip,
          padding: const EdgeInsets.all(Dimens.minMargin),
          onPressed: () => gotoPage(page: const Profile()),
          icon: const CircleAvatar(
            backgroundImage: AssetImage(ImagePath.myImage),
          )),
      title: Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimens.minMargin),
        child: TextButton(
          onPressed: () {},
          style: textBtnStyle(
              border: Dimens.margin,
              color: Themes.defaultIconColor,
              alignment: Alignment.centerLeft),
          child: const Text(Strings.thoughts),
        ),
      ),
      trailing: iconBtn(
        tooltip: Strings.albumTip,
        icon: const Icon(Icons.photo_album_outlined),
        onPressed: () {},
      ),
    );
  }
}
