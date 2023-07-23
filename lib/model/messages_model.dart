// ignore_for_file: avoid_print

import 'dart:math';
import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/image_path.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/model/model.dart';
import 'package:facebook/pages/profile.dart';

List<AppModel> messagesData = [
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[0],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: Strings.newMessages[Random().nextInt(11)],
      onTap: () => print('datas clicked'),
      text: '1d'),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[1],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: Strings.newMessages[Random().nextInt(11)],
      onTap: () => print('datas clicked'),
      text: '1d'),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[2],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: Strings.newMessages[Random().nextInt(11)],
      onTap: () => print('datas clicked'),
      text: '1d'),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[3],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: Strings.newMessages[Random().nextInt(11)],
      onTap: () => print('datas clicked'),
      text: '1d'),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[4],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: Strings.newMessages[Random().nextInt(11)],
      onTap: () => print('datas clicked'),
      text: '1d'),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[5],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: Strings.newMessages[Random().nextInt(11)],
      onTap: () => print('datas clicked'),
      text: '1d'),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[6],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: Strings.newMessages[Random().nextInt(11)],
      onTap: () => print('datas clicked'),
      text: '1d'),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[7],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: Strings.newMessages[Random().nextInt(11)],
      onTap: () => print('datas clicked'),
      text: '1d'),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[8],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: Strings.newMessages[Random().nextInt(11)],
      onTap: () => print('datas clicked'),
      text: '1d'),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[9],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: Strings.newMessages[Random().nextInt(11)],
      onTap: () => print('datas clicked'),
      text: '1d'),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[10],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: Strings.newMessages[Random().nextInt(11)],
      onTap: () => print('datas clicked'),
      text: '1d'),
];
