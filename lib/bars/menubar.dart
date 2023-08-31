import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/assets/theme.dart';
import 'package:flutter/material.dart';

class MyMenuBar extends StatefulWidget {
  const MyMenuBar({super.key});

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MyMenuBar> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        TextButton(
            style: const ButtonStyle(
                alignment: Alignment.center,
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
                foregroundColor:
                    MaterialStatePropertyAll(Themes.defaultIconColor)),
            onPressed: () {},
            child: const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: Dimens.margin,
              children: [Icon(Icons.post_add), Text(Strings.text)],
            )),
        const SizedBox(
            height: Dimens.xMargin, child: VerticalDivider(thickness: 1)),
        TextButton(
            style: const ButtonStyle(
                alignment: Alignment.center,
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
                foregroundColor:
                    MaterialStatePropertyAll(Themes.defaultIconColor)),
            onPressed: () {},
            child: const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: Dimens.margin,
              children: [
                Icon(Icons.video_call_outlined),
                Text(Strings.liveVid)
              ],
            )),
        const SizedBox(
            height: Dimens.xMargin, child: VerticalDivider(thickness: 1)),
        TextButton(
            style: const ButtonStyle(
                alignment: Alignment.center,
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
                foregroundColor:
                    MaterialStatePropertyAll(Themes.defaultIconColor)),
            onPressed: () {},
            child: const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: Dimens.margin,
              children: [
                Icon(Icons.location_on_outlined),
                Text(Strings.location)
              ],
            )),
      ],
    );
  }
}
