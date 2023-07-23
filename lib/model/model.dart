import 'package:flutter/animation.dart';

class AppModel {
  final String profileImage;
  final String username;
  final VoidCallback profileOnTap;
  final VoidCallback? moreOnTap;
  final String data;
  final String? caption;
  final String? location;
  final VoidCallback onTap;
  final String? text;
  final VoidCallback? btnLike;
  final VoidCallback? btnComment;
  final VoidCallback? btnShare;
  final VoidCallback? reqAccept;
  final VoidCallback? reqDelete;

  AppModel(
      {required this.profileImage,
      required this.username,
      required this.profileOnTap,
      this.moreOnTap,
      required this.data,
      this.caption,
      this.location,
      required this.onTap,
      this.text,
      this.btnLike,
      this.btnComment,
      this.btnShare,
      this.reqAccept,
      this.reqDelete});
}
