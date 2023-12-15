import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final navigattorkey = GlobalKey<NavigatorState>();
showSnackbar({required String message}) async {
  Get.closeAllSnackbars();
  Get.rawSnackbar(message: message);
}

goBack() => Padding(
      padding: const EdgeInsets.all(16),
      child: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_rounded)),
    );

gotoPage({required Widget page}) =>
    navigattorkey.currentState!.push(MaterialPageRoute(
        builder: ((context) => Material(
              child: Stack(children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: page),
                Container(
                    margin: const EdgeInsets.all(Dimens.margin),
                    alignment: Alignment.topCenter,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        tooltip: Strings.close,
                        splashRadius: Dimens.iconSplashRadius,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const CircleAvatar(
                          child: Icon(Icons.arrow_back_rounded),
                        ))),
              ]),
            ))));

cardView(
        {required Widget icon,
        required Widget title,
        required VoidCallback onTap}) =>
    Card(
        child: TextButton.icon(
      onPressed: onTap,
      icon: icon,
      label: title,
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        fixedSize: const Size(160, 80),
        alignment: Alignment.centerLeft,
      ),
    ));

textBtnStyle(
        {required double border,
        // ignore: avoid_init_to_null
        Color? color = null,
        AlignmentGeometry? alignment = Alignment.center}) =>
    TextButton.styleFrom(
      alignment: alignment,
      padding: const EdgeInsets.all(Dimens.xMargin),
      backgroundColor: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(border))),
    );
iconBtn(
        {required VoidCallback onPressed,
        required Widget icon,
        double iconSize = Dimens.defaultIconSize,
        double splashRadius = Dimens.iconSplashRadius,
        String tooltip = '',
        EdgeInsets padding = EdgeInsets.zero}) =>
    IconButton(
        tooltip: tooltip,
        iconSize: iconSize,
        splashRadius: splashRadius,
        padding: padding,
        onPressed: onPressed,
        icon: icon);

pageHeader(
        {required String title,
        required IconData? icon,
        required VoidCallback searchOnTap}) =>
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Wrap(
          spacing: Dimens.xxMargin,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Dimens.titleLarge),
            ),
            Icon(icon)
          ]),
      iconBtn(
          tooltip: Strings.search,
          onPressed: searchOnTap,
          splashRadius: Dimens.iconSplashRadius,
          icon: const Icon(Icons.search))
    ]);
