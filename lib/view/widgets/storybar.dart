import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/model/story_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'assets.dart';

class StoryBar extends StatefulWidget {
  const StoryBar({super.key});

  @override
  State<StoryBar> createState() => _StoryBarState();
}

class _StoryBarState extends State<StoryBar> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    Size device = MediaQuery.of(context).size;
    double myHeight = device.height * 0.25;
    double myWidth = myHeight * 0.75;

    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: Dimens.margin,
          children: [
            GestureDetector(
                onTap: () => showSnackbar(message: Strings.addStoryTap),
                child: Container(
                  margin: const EdgeInsets.only(left: Dimens.margin),
                  height: myHeight,
                  width: myWidth,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: scheme.onBackground.withOpacity(0.1)),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(Dimens.borderRadius))),
                  child: Stack(children: [
                    SizedBox(
                      height: myHeight * 0.65,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(Dimens.borderRadius),
                              topRight: Radius.circular(Dimens.borderRadius)),
                          child: user!.photoURL == null
                              ? Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  color: scheme.primary,
                                  child: const Icon(Icons.person))
                              : Image.network(
                                  user!.photoURL!,
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                  width: double.infinity,
                                )),
                    ),
                    Center(
                        child: Container(
                      margin: EdgeInsets.only(top: myHeight * 0.35),
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: CircleAvatar(
                          backgroundColor: scheme.background,
                          child: const Padding(
                            padding: EdgeInsets.all(Dimens.minMargin),
                            child: CircleAvatar(
                              radius: Dimens.borderRadius,
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.add_rounded,
                                color: Colors.white,
                              ),
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
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
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
                              style: TextStyle(
                                color: scheme.onSurface,
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
