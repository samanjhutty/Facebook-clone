import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:flutter/material.dart';

class MyMenuBar extends StatefulWidget {
  const MyMenuBar({super.key});

  @override
  State<MyMenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MyMenuBar> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        TextButton(
            style: ButtonStyle(
                iconColor: MaterialStatePropertyAll(scheme.primary),
                foregroundColor: MaterialStatePropertyAll(scheme.onSurface),
                alignment: Alignment.center,
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent)),
            onPressed: () {},
            child: const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: Dimens.margin,
              children: [Icon(Icons.post_add), Text(Strings.text)],
            )),
        const SizedBox(
            height: Dimens.xMargin, child: VerticalDivider(thickness: 1)),
        TextButton(
            style: ButtonStyle(
                iconColor: MaterialStatePropertyAll(scheme.primary),
                foregroundColor: MaterialStatePropertyAll(scheme.onSurface),
                alignment: Alignment.center,
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent)),
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
            style: ButtonStyle(
                iconColor: MaterialStatePropertyAll(scheme.primary),
                foregroundColor: MaterialStatePropertyAll(scheme.onSurface),
                alignment: Alignment.center,
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent)),
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
