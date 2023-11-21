import 'package:facebook/assets/Image_path.dart';
import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/assets/theme.dart';
import 'package:facebook/model/story_model.dart';
import 'package:flutter/material.dart';

class StoryBar extends StatefulWidget {
  const StoryBar({super.key});

  @override
  State<StoryBar> createState() => _StoryBarState();
}

class _StoryBarState extends State<StoryBar> {
  double myHeight = 160;
  double myWidth = 120;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: Dimens.margin,
          children: [
            GestureDetector(
                onTap: () => showSnackbar(
                    context: context, message: Strings.addStoryTap),
                child: Container(
                  margin: const EdgeInsets.only(left: Dimens.margin),
                  height: myHeight,
                  width: myWidth,
                  decoration: BoxDecoration(
                      color: Themes.layoutBackgroundLight,
                      borderRadius: const BorderRadius.all(
                          Radius.circular(Dimens.borderRadius))),
                  child: Stack(children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(Dimens.borderRadius),
                            topRight: Radius.circular(Dimens.borderRadius)),
                        child: Image.asset(
                          ImagePath.myImage,
                          fit: BoxFit.fitHeight,
                          height: myHeight * 0.65,
                        )),
                    Center(
                        child: Container(
                      margin: EdgeInsets.only(top: myHeight * 0.35),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Themes.layoutBackgroundLight),
                      child: Container(
                          padding: const EdgeInsets.all(Dimens.minMargin),
                          decoration: BoxDecoration(
                              color: Themes.layoutBackgroundLight,
                              shape: BoxShape.circle),
                          child: CircleAvatar(
                            radius: Dimens.borderRadius,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: const Icon(
                              Icons.add_rounded,
                              color: Colors.white,
                            ),
                          )),
                    )),
                    Container(
                      margin: const EdgeInsets.only(bottom: Dimens.margin),
                      alignment: Alignment.bottomCenter,
                      child: const Text(
                        Strings.addStory,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
                )),
            for (int i = 0; i < storyData.length; i++) ...[
              GestureDetector(
                  onTap: storyData[i].storyOnTap,
                  child: Container(
                    height: myHeight,
                    width: myWidth,
                    decoration: BoxDecoration(
                        color: Themes.layoutBackgroundLight,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(Dimens.borderRadius))),
                    child: Stack(children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(Dimens.borderRadius)),
                          child: Image.asset(
                            storyData[i].storyThumbnail,
                            fit: BoxFit.fitHeight,
                            height: myHeight,
                          )),
                      Container(
                        margin: const EdgeInsets.only(bottom: Dimens.margin),
                        alignment: Alignment.bottomLeft,
                        child: TextButton.icon(
                            onPressed: storyData[i].profileOnTap,
                            icon: CircleAvatar(
                              radius: Dimens.punyIconSize,
                              backgroundImage:
                                  AssetImage(storyData[i].avatarImage),
                            ),
                            label: Text(
                              storyData[i].userName,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                            )),
                      )
                    ]),
                  )),
            ]
          ],
        ));
  }
}
