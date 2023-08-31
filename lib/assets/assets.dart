import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/assets/theme.dart';
import 'package:flutter/material.dart';

final navigattorkey = GlobalKey<NavigatorState>();
showSnackbar(
    {required BuildContext context, required String message, int time = 1000}) {
  var snackBar = SnackBar(
    content: Text(message),
    duration: Duration(milliseconds: time),
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

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
                          backgroundColor: Colors.black45,
                          foregroundColor: Colors.white,
                          child: Icon(Icons.arrow_back_rounded),
                        ))),
              ]),
            ))));

cardView(
        {required Widget icon,
        required Widget title,
        required VoidCallback onTap}) =>
    Card(
        color: Themes.cardColor,
        child: TextButton.icon(
          onPressed: onTap,
          icon: icon,
          label: title,
          style: TextButton.styleFrom(
              fixedSize: const Size(160, 80),
              alignment: Alignment.centerLeft,
              foregroundColor: Themes.fontColor),
        ));

textBtnStyle(
        {required double border,
        required Color? color,
        AlignmentGeometry? alignment = Alignment.center}) =>
    TextButton.styleFrom(
        alignment: alignment,
        backgroundColor: Themes.layoutBackgroundLight,
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.xMargin, horizontal: Dimens.xxMargin),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(border))),
        foregroundColor: color);
iconBtn(
        {required VoidCallback onPressed,
        required Widget icon,
        Color? color = Themes.defaultIconColor,
        double iconSize = Dimens.defaultIconSize,
        double splashRadius = Dimens.iconSplashRadius,
        String tooltip = '',
        EdgeInsets padding = EdgeInsets.zero}) =>
    IconButton(
        color: color,
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
            Icon(icon, color: Themes.defaultIconColor)
          ]),
      iconBtn(
          tooltip: Strings.search,
          onPressed: searchOnTap,
          splashRadius: Dimens.iconSplashRadius,
          icon: const Icon(Icons.search))
    ]);
