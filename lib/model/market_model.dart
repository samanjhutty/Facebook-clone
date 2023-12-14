import 'dart:math';
import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/image_path.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/model/model.dart';
import 'package:facebook/view/pages/profile.dart';

List<AppModel> marketData = [
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.username[0],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: ImagePath.bgImage[Random().nextInt(11)],
      caption: '₹${Random().nextInt(100) + 50}',
      text: Strings.marketItems[Random().nextInt(11)],
      onTap: () => showSnackbar(message: 'image clicked')),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.username[1],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: ImagePath.bgImage[Random().nextInt(11)],
      caption: '₹${Random().nextInt(100) + 50}',
      text: Strings.marketItems[Random().nextInt(11)],
      onTap: () => showSnackbar(message: 'image clicked')),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.username[2],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: ImagePath.bgImage[Random().nextInt(11)],
      caption: '₹${Random().nextInt(100) + 50}',
      text: Strings.marketItems[Random().nextInt(11)],
      onTap: () => showSnackbar(message: 'image clicked')),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.username[3],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: ImagePath.bgImage[Random().nextInt(11)],
      caption: '₹${Random().nextInt(100) + 50}',
      text: Strings.marketItems[Random().nextInt(11)],
      onTap: () => showSnackbar(message: 'image clicked')),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.username[4],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: ImagePath.bgImage[Random().nextInt(11)],
      caption: '₹${Random().nextInt(100) + 50}',
      text: Strings.marketItems[Random().nextInt(11)],
      onTap: () => showSnackbar(message: 'image clicked')),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.username[5],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: ImagePath.bgImage[Random().nextInt(11)],
      caption: '₹${Random().nextInt(100) + 50}',
      text: Strings.marketItems[Random().nextInt(11)],
      onTap: () => showSnackbar(message: 'image clicked')),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.username[6],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: ImagePath.bgImage[Random().nextInt(11)],
      caption: '₹${Random().nextInt(100) + 50}',
      text: Strings.marketItems[Random().nextInt(11)],
      onTap: () => showSnackbar(message: 'image clicked')),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.username[7],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: ImagePath.bgImage[Random().nextInt(11)],
      caption: '₹${Random().nextInt(100) + 50}',
      text: Strings.marketItems[Random().nextInt(11)],
      onTap: () => showSnackbar(message: 'image clicked')),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.username[8],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: ImagePath.bgImage[Random().nextInt(11)],
      caption: '₹${Random().nextInt(100) + 50}',
      text: Strings.marketItems[Random().nextInt(11)],
      onTap: () => showSnackbar(message: 'image clicked')),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.username[9],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: ImagePath.bgImage[Random().nextInt(11)],
      caption: '₹${Random().nextInt(100) + 50}',
      text: Strings.marketItems[Random().nextInt(11)],
      onTap: () => showSnackbar(message: 'image clicked')),
  AppModel(
      profileImage: ImagePath.profileImage[Random().nextInt(11)],
      username: Strings.username[10],
      profileOnTap: () => gotoPage(page: const Profile()),
      data: ImagePath.bgImage[Random().nextInt(11)],
      caption: '₹${Random().nextInt(100) + 50}',
      text: Strings.marketItems[Random().nextInt(11)],
      onTap: () => showSnackbar(message: 'image clicked')),
];
