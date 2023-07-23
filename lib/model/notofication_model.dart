// ignore_for_file: avoid_print

import 'dart:math';
import 'dart:ui';

import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/image_path.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/pages/profile.dart';

class NotificationModel {
  final String avatarImage;
  final String username;
  final VoidCallback profileOnTap;
  final String notification;
  final VoidCallback notificationOnTap;
  final VoidCallback moreOnTap;

  NotificationModel(
      {required this.avatarImage,
      required this.username,
      required this.profileOnTap,
      required this.notification,
      required this.notificationOnTap,
      required this.moreOnTap});
}

List<NotificationModel> notificationData = [
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
  NotificationModel(
      avatarImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.friendsName[Random().nextInt(11)],
      profileOnTap: () => gotoPage(page: const Profile()),
      notification: Strings.newNotification[Random().nextInt(5)],
      notificationOnTap: () => print('Notification clicked'),
      moreOnTap: () => print('more clicked')),
];
