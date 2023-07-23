import 'dart:io';
import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/assets/theme.dart';
import 'package:facebook/pages/drawer.dart';
import 'package:facebook/tabs/friends_page.dart';
import 'package:facebook/tabs/home_page.dart';
import 'package:facebook/tabs/market_page.dart';
import 'package:facebook/tabs/messsages_page.dart';
import 'package:facebook/tabs/videos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:window_size/window_size.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(460, 800));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Themes.primaryColor),
        debugShowCheckedModeBanner: false,
        navigatorKey: navigattorkey,
        home: const MyMainTab());
  }
}

class MyMainTab extends StatefulWidget {
  const MyMainTab({super.key});

  @override
  _MyMainTabState createState() => _MyMainTabState();
}

class _MyMainTabState extends State<MyMainTab> with TickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TabController? _tabController;
  List<Tab> mainTabs = [
    const Tab(icon: Icon(Icons.home_rounded)),
    const Tab(icon: Icon(Icons.people_alt_rounded)),
    const Tab(icon: Icon(Icons.message_rounded)),
    const Tab(icon: Icon(Icons.video_collection_rounded)),
    const Tab(icon: Icon(Icons.shopping_bag_rounded)),
  ];

  Future<bool> _onWillPop() async {
    if (_tabController?.index == 0) {
      await SystemNavigator.pop();
    }
    Future.delayed(const Duration(milliseconds: 200), () {
      _tabController?.index = 0;
    });

    return _tabController?.index == 0;
  }

  @override
  void initState() {
    _tabController = TabController(length: mainTabs.length, vsync: this)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            foregroundColor: Colors.black87,
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              iconBtn(
                  color: Colors.black87,
                  tooltip: Strings.search,
                  splashRadius: Dimens.iconSplashRadius,
                  onPressed: () {
                    showSnackbar(context: context, message: Strings.searchTap);
                  },
                  icon: const Icon(Icons.search)),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: Dimens.xMargin),
                child: iconBtn(
                    color: Colors.black87,
                    tooltip: Strings.menu,
                    splashRadius: Dimens.iconSplashRadius,
                    onPressed: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    icon: const Icon(Icons.menu)),
              ),
            ],
            title: const Text(Strings.appName),
            bottom: TabBar(
              indicator: RectangularIndicator(
                  color: Themes.primaryColor,
                  topLeftRadius: Dimens.circularRadius,
                  topRightRadius: Dimens.circularRadius,
                  bottomLeftRadius: Dimens.circularRadius,
                  bottomRightRadius: Dimens.circularRadius,
                  horizontalPadding: Dimens.xMargin,
                  verticalPadding: 5),
              tabs: mainTabs,
              controller: _tabController,
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              labelColor: Colors.white,
              unselectedLabelColor: Themes.iconDisabled,
            ),
          ),
          endDrawer: const MyDrawer(),
          body: TabBarView(
            controller: _tabController,
            children: const [
              HomeTab(),
              FriendsTab(),
              MessagesTab(),
              VideosTab(),
              MarketTab()
            ],
          ),
        ));
  }
}
