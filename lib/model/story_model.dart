import 'dart:math';
import 'package:facebook/assets/Image_path.dart';
import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/view/pages/profile.dart';
import 'package:flutter/animation.dart';

class StoryModel {
  final String avatarImage;
  final VoidCallback profileOnTap;
  final String userName;

  final String storyThumbnail;
  final VoidCallback storyOnTap;

  StoryModel({
    required this.avatarImage,
    required this.profileOnTap,
    required this.userName,
    required this.storyThumbnail,
    required this.storyOnTap,
  });
}

List<StoryModel> storyData = [
  StoryModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      userName: Strings.friendsName[0],
      storyThumbnail: ImagePath.bgImage[Random().nextInt(11)],
      storyOnTap: () => showSnackbar(message: 'story clicked')),
  StoryModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      userName: Strings.friendsName[1],
      storyThumbnail: ImagePath.bgImage[Random().nextInt(11)],
      storyOnTap: () => showSnackbar(message: 'story clicked')),
  StoryModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      userName: Strings.friendsName[2],
      storyThumbnail: ImagePath.bgImage[Random().nextInt(11)],
      storyOnTap: () => showSnackbar(message: 'story clicked')),
  StoryModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      userName: Strings.friendsName[3],
      storyThumbnail: ImagePath.bgImage[Random().nextInt(11)],
      storyOnTap: () => showSnackbar(message: 'story clicked')),
  StoryModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      userName: Strings.friendsName[4],
      storyThumbnail: ImagePath.bgImage[Random().nextInt(11)],
      storyOnTap: () => showSnackbar(message: 'story clicked')),
  StoryModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      userName: Strings.friendsName[5],
      storyThumbnail: ImagePath.bgImage[Random().nextInt(11)],
      storyOnTap: () => showSnackbar(message: 'story clicked')),
  StoryModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      userName: Strings.friendsName[6],
      storyThumbnail: ImagePath.bgImage[Random().nextInt(11)],
      storyOnTap: () => showSnackbar(message: 'story clicked')),
  StoryModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      userName: Strings.friendsName[7],
      storyThumbnail: ImagePath.bgImage[Random().nextInt(11)],
      storyOnTap: () => showSnackbar(message: 'story clicked')),
  StoryModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      userName: Strings.friendsName[8],
      storyThumbnail: ImagePath.bgImage[Random().nextInt(11)],
      storyOnTap: () => showSnackbar(message: 'story clicked')),
  StoryModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      userName: Strings.friendsName[9],
      storyThumbnail: ImagePath.bgImage[Random().nextInt(11)],
      storyOnTap: () => showSnackbar(message: 'story clicked')),
  StoryModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      userName: Strings.username[10],
      storyThumbnail: ImagePath.bgImage[Random().nextInt(11)],
      storyOnTap: () => showSnackbar(message: 'story clicked')),
];
