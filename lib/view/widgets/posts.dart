import 'package:expandable_text/expandable_text.dart';
import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/assets/theme.dart';
import 'package:facebook/model/post_model.dart';
import 'package:flutter/material.dart';
import 'assets.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < postsData.length; i++) ...[
          ListTile(
            minVerticalPadding: 0,
            leading: iconBtn(
                icon: CircleAvatar(
                    backgroundImage: AssetImage(postsData[i].avatarImage)),
                onPressed: postsData[i].profileOnTap),
            title: TextButton(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.zero),
                    alignment: Alignment.centerLeft,
                    foregroundColor: MaterialStatePropertyAll(Themes.fontColor),
                    overlayColor: MaterialStatePropertyAll(Colors.transparent)),
                onPressed: postsData[i].profileOnTap,
                child: Text(postsData[i].username)),
            subtitle: Wrap(spacing: Dimens.margin, children: [
              Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.location_on,
                    size: Dimens.miniIconSize, color: Colors.grey[600]),
                const SizedBox(width: Dimens.minMargin),
                Text(postsData[i].location,
                    style: TextStyle(color: Colors.grey[600])),
              ]),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(
                  Icons.watch_later_outlined,
                  size: Dimens.miniIconSize,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: Dimens.minMargin),
                Text(postsData[i].time,
                    style: TextStyle(color: Colors.grey[600])),
              ])
            ]),
            trailing: IconButton(
              splashRadius: Dimens.iconSplashRadius,
              onPressed: postsData[i].moreOnTap,
              icon: const Icon(Icons.more_horiz),
            ),
          ),
          Container(
              margin: const EdgeInsets.all(Dimens.margin),
              child: ExpandableText(
                postsData[i].caption,
                expandText: Strings.more,
                collapseText: Strings.less,
                maxLines: 1,
              )),
          GestureDetector(
              onTap: postsData[i].postOnTap,
              child: Image.asset(
                postsData[i].postImage,
                fit: BoxFit.fitWidth,
              )),
          Container(
            margin: const EdgeInsets.fromLTRB(0, Dimens.margin, 0, 0),
            child: Wrap(
                spacing: Dimens.margin,
                runSpacing: Dimens.margin,
                crossAxisAlignment: WrapCrossAlignment.end,
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                      style: textBtnStyle(
                          border: Dimens.circularRadius,
                          color: Themes.defaultIconColor),
                      onPressed: postsData[i].likeOnTap,
                      icon: const Icon(Icons.thumb_up_outlined),
                      label: const Text(Strings.like)),
                  TextButton.icon(
                      style: textBtnStyle(
                          border: Dimens.circularRadius,
                          color: Themes.defaultIconColor),
                      onPressed: postsData[i].commentOnTap,
                      icon: const Icon(Icons.comment_outlined),
                      label: const Text(Strings.comment)),
                  TextButton.icon(
                      style: textBtnStyle(
                          border: Dimens.circularRadius,
                          color: Themes.defaultIconColor),
                      onPressed: postsData[i].shareOnTap,
                      icon: const Icon(Icons.share_outlined),
                      label: const Text(Strings.share)),
                ]),
          ),
          const Divider(thickness: 3),
        ]
      ],
    );
  }
}
