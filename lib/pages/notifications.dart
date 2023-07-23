import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/image_path.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/model/notofication_model.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.all(Dimens.xMargin),
            child: Text(Strings.noti,
                style: TextStyle(
                    fontSize: Dimens.titleMed, fontWeight: FontWeight.bold))),
        const Divider(thickness: 1),
        Expanded(
            child: ListView.builder(
          itemCount: notificationData.length,
          itemBuilder: (context, i) => ListTile(
            hoverColor: Colors.transparent,
            onTap: notificationData[i].notificationOnTap,
            leading: iconBtn(
                onPressed: notificationData[i].profileOnTap,
                icon: CircleAvatar(
                  backgroundImage: AssetImage(notificationData[i].avatarImage),
                )),
            title: Wrap(
              children: [
                Text(notificationData[i].username,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(' ${notificationData[i].notification}', softWrap: true),
              ],
            ),
            trailing: IconButton(
                splashRadius: Dimens.iconSplashRadius,
                onPressed: notificationData[i].moreOnTap,
                icon: const Icon(Icons.more_horiz_rounded)),
          ),
        ))
      ],
    );
  }
}
