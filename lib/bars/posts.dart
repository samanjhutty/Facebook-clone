import 'package:expandable_text/expandable_text.dart';
import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/assets/theme.dart';
import 'package:facebook/model/post_model.dart';
import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < postsData.length; i++) ...[
          ListTile(
            leading: iconBtn(
              icon: CircleAvatar(
                backgroundImage: AssetImage(postsData[i].avatarImage),
              ),
              onPressed: postsData[i].profileOnTap,
            ),
            title: TextButton(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.zero),
                    alignment: Alignment.centerLeft,
                    foregroundColor: MaterialStatePropertyAll(Themes.fontColor),
                    overlayColor: MaterialStatePropertyAll(Colors.transparent)),
                onPressed: postsData[i].profileOnTap,
                child: Text(postsData[i].username)),
            subtitle: Wrap(spacing: Dimens.xMargin, children: [
              TextButton.icon(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.zero),
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    textStyle: MaterialStatePropertyAll(
                        TextStyle(fontWeight: FontWeight.normal))),
                onPressed: null,
                label: Text(postsData[i].location),
                icon: const Icon(
                  Icons.location_on,
                  size: Dimens.miniIconSize,
                ),
              ),
              TextButton.icon(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      overlayColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      textStyle: MaterialStatePropertyAll(
                          TextStyle(fontWeight: FontWeight.normal))),
                  onPressed: null,
                  label: Text(postsData[i].time),
                  icon: const Icon(Icons.watch_later_outlined,
                      size: Dimens.miniIconSize))
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
