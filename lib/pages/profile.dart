import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/image_path.dart';
import 'package:facebook/assets/theme.dart';
import 'package:facebook/bars/posts.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.margin),
          child: ListView(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: const EdgeInsets.only(top: Dimens.margin),
                height: 260,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(Dimens.borderRadius),
                            topRight: Radius.circular(Dimens.borderRadius)),
                        child: Image.asset(ImagePath.myPost,
                            fit: BoxFit.fitWidth,
                            height: 200,
                            width: double.infinity)),
                    Align(
                        alignment: const Alignment(-0.8, 0.8),
                        child: Container(
                          padding: const EdgeInsets.all(Dimens.minMargin),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(Dimens.circularRadius)),
                          child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 80,
                              backgroundImage: AssetImage(
                                ImagePath.myImage,
                              )),
                        ))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: Dimens.xMargin),
                child: Text('Samandeep Singh',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.titleLarge)),
              ),
              Row(children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(right: Dimens.margin),
                  child: TextButton.icon(
                      style: TextButton.styleFrom(
                          backgroundColor: Themes.layoutBackgroundLight,
                          foregroundColor: Themes.primaryColor,
                          padding: const EdgeInsets.symmetric(
                              vertical: Dimens.xMargin)),
                      onPressed: () {},
                      icon: const Icon(Icons.add_rounded),
                      label: const Text('Add to Story')),
                )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: Dimens.margin),
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                            backgroundColor: Themes.layoutBackgroundLight,
                            foregroundColor: Themes.primaryColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: Dimens.xMargin)),
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit Profile')),
                  ),
                ),
                InkWell(
                    onTap: () {},
                    borderRadius: const BorderRadius.all(
                      Radius.circular(Dimens.miniBorderRadius),
                    ),
                    child: Container(
                        padding: const EdgeInsets.all(Dimens.margin),
                        decoration: BoxDecoration(
                          color: Themes.layoutBackgroundLight,
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.all(
                              Radius.circular(Dimens.miniBorderRadius)),
                        ),
                        child: const Icon(Icons.more_horiz)))
              ]),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Wrap(direction: Axis.vertical, spacing: 8, children: [
                    TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.work),
                        label: const Text('Working at Teleperformance')),
                    TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.person_rounded),
                        label: const Text('Single')),
                    TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.info),
                        label: const Text('About...'))
                  ])),
            ]),
            const Divider(thickness: 1),
            const Posts()
          ])),
    );
  }
}
