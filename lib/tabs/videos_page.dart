import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosTab extends StatefulWidget {
  const VideosTab({super.key});
  @override
  _VideosTabState createState() => _VideosTabState();
}

class _VideosTabState extends State<VideosTab> {
  bool isAutoplay = false;
  String vidId = '9xwazD5SyVg';
  late YoutubePlayerController _ytController;
  @override
  void initState() {
    _ytController = YoutubePlayerController(
        initialVideoId: vidId,
        flags: const YoutubePlayerFlags(autoPlay: false, mute: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: _ytController),
      builder: (context, player) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.xMargin,
          ),
          child: Column(children: [
            pageHeader(
                title: Strings.videos,
                icon: Icons.video_collection_rounded,
                searchOnTap: () {}),
            const Divider(thickness: 1),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              const Text(Strings.autoplay),
              Tooltip(
                message: Strings.loopTip,
                child: Switch(
                    splashRadius: Dimens.miniSplashRadius,
                    value: isAutoplay,
                    onChanged: (value) => setState(() {
                          isAutoplay = value;
                        })),
              )
            ]),
            Expanded(
                child: ListView(
              children: [
                SizedBox(
                  width: 300,
                  child: player,
                ),
              ],
            ))
          ])),
    );
  }
}
