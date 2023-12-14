import 'dart:math';
import 'package:facebook/assets/image_path.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/view/pages/profile.dart';
import 'package:flutter/animation.dart';
import '../view/widgets/assets.dart';

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
      () => showSnackbar(message: 'add friends clicked'),
      () => showSnackbar(message: 'request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[1],
      () => showSnackbar(message: 'add friends clicked'),
      () => showSnackbar(message: 'request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[2],
      () => showSnackbar(message: 'add friends clicked'),
      () => showSnackbar(message: 'request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[3],
      () => showSnackbar(message: 'add friends clicked'),
      () => showSnackbar(message: 'request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[4],
      () => showSnackbar(message: 'add friends clicked'),
      () => showSnackbar(message: 'request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[5],
      () => showSnackbar(message: 'add friends clicked'),
      () => showSnackbar(message: 'request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[6],
      () => showSnackbar(message: 'add friends clicked'),
      () => showSnackbar(message: 'request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[7],
      () => showSnackbar(message: 'add friends clicked'),
      () => showSnackbar(message: 'request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[8],
      () => showSnackbar(message: 'add friends clicked'),
      () => showSnackbar(message: 'request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[9],
      () => showSnackbar(message: 'add friends clicked'),
      () => showSnackbar(message: 'request deleted')),
  ProfileModel(
      ImagePath.profileImage[Random().nextInt(11)],
      () => gotoPage(page: const Profile()),
      Strings.friendsName[10],
      () => showSnackbar(message: 'add friends clicked'),
      () => showSnackbar(message: 'request deleted')),
];
