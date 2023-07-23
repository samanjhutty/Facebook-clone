// ignore_for_file: avoid_print
import 'dart:math';

import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/image_path.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/pages/profile.dart';
import 'package:flutter/animation.dart';

class ProfileModel {
  final String avatarImage;
  final VoidCallback profileTap;
  final String username;
  final VoidCallback confirmReq;
  final VoidCallback deleteReq;

  ProfileModel(this.avatarImage, this.profileTap, this.username,
      this.confirmReq, this.deleteReq);
}

List<ProfileModel> profileData = [
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[0],
      () => print('add friends clicked'),
      () => print('request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[1],
      () => print('add friends clicked'),
      () => print('request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[2],
      () => print('add friends clicked'),
      () => print('request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[3],
      () => print('add friends clicked'),
      () => print('request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[4],
      () => print('add friends clicked'),
      () => print('request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[5],
      () => print('add friends clicked'),
      () => print('request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[6],
      () => print('add friends clicked'),
      () => print('request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[7],
      () => print('add friends clicked'),
      () => print('request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[8],
      () => print('add friends clicked'),
      () => print('request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[9],
      () => print('add friends clicked'),
      () => print('request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[10],
      () => print('add friends clicked'),
      () => print('request deleted')),
];
