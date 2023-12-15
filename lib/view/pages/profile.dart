import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/image_path.dart';
import 'package:facebook/controller/profile_controller.dart';
import 'package:facebook/view/widgets/posts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../widgets/assets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final FirebaseAuth auth = FirebaseAuth.instance;

    return Material(
      child: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.margin),
            child: ListView(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  margin: const EdgeInsets.only(top: Dimens.margin),
                  height: 260,
                  child: Consumer<ProfileController>(
                      builder: (context, provider, child) {
                    return Stack(
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
                                  borderRadius: BorderRadius.circular(
                                      Dimens.circularRadius)),
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 80,
                                  backgroundImage: NetworkImage(
                                    auth.currentUser!.photoURL!,
                                  )),
                            ))
                      ],
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Dimens.xMargin),
                  child: Text(auth.currentUser!.displayName!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Dimens.titleLarge)),
                ),
                Row(children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: Dimens.margin),
                    child: TextButton.icon(
                        style: textBtnStyle(border: 40, color: scheme.primary),
                        onPressed: () {
                          var provider = context.read<ProfileController>();
                          provider.pickImage();
                          kIsWeb ? provider.webImage : provider.image;
                        },
                        icon: const Icon(Icons.add_rounded),
                        label: const Text('Add to Story')),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: Dimens.margin),
                      child: TextButton.icon(
                          style:
                              textBtnStyle(border: 40, color: scheme.primary),
                          onPressed: () => Get.toNamed('/update-profile'),
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
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dimens.miniBorderRadius)),
                          ),
                          child: const Icon(Icons.more_horiz)))
                ]),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child:
                        Wrap(direction: Axis.vertical, spacing: 8, children: [
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
      ),
    );
  }
}
