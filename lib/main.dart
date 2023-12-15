import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/view/pages/drawer.dart';
import 'package:facebook/view/pages/notifications.dart';
import 'package:facebook/view/pages/profile.dart';
import 'package:facebook/view/tabs/friends_page.dart';
import 'package:facebook/view/tabs/home_page.dart';
import 'package:facebook/view/tabs/market_page.dart';
import 'package:facebook/view/tabs/messsages_page.dart';
import 'package:facebook/view/tabs/videos_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'controller/firebase_options.dart';
import 'controller/profile_controller.dart';
import 'controller/signin_controller.dart';
import 'controller/signup_controller.dart';
import 'view/pages/mobile_login.dart';
import 'view/pages/otp_page.dart';
import 'view/pages/reauth.dart';
import 'view/pages/signin.dart';
import 'view/pages/signup.dart';
import 'view/pages/update_profile.dart';
import 'view/widgets/assets.dart';
import 'view/widgets/mywidgets.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    Color themeColor = Colors.deepPurple;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProfileController()),
          ChangeNotifierProvider(create: (context) => SignUpAuth()),
          ChangeNotifierProvider(create: (context) => SignInAuth()),
          ChangeNotifierProvider(create: (context) => MyWidgets())
        ],
        child: GetMaterialApp(
            initialRoute: '/',
            routes: {
              '/': (p0) =>
                  auth.currentUser == null ? const SignIn() : const MyMainTab(),
              '/mobile': (p0) => const MobileLogin(),
              '/otppage': (p0) => const OTPPage(),
              '/update-profile': (p0) => const UpdateProfile(),
              '/signin': (p0) => const SignIn(),
              '/signup': (p0) => const SignUp(),
              '/reauth': (p0) => const ReAuthenticate(),
              '/drawer': (p0) => const MyDrawer(),
              '/notifications': (p0) => const Notifications(),
              '/friends': (p0) => const FriendsTab(),
              '/market': (p0) => const MarketTab(),
              '/messages': (p0) => const MessagesTab(),
              '/videos': (p0) => const VideosTab(),
              '/profile': (p0) => const Profile()
            },
            title: 'Facebook',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: themeColor, brightness: Brightness.light),
                useMaterial3: true),
            darkTheme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: themeColor, brightness: Brightness.dark),
                useMaterial3: true),
            themeMode: ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            navigatorKey: navigattorkey));
  }
}

class MyMainTab extends StatefulWidget {
  const MyMainTab({super.key});

  final String title = 'Facebook';
  @override
  State<MyMainTab> createState() => _MyMainTabState();
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
    ColorScheme scheme = Theme.of(context).colorScheme;
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(widget.title),
            actions: [
              iconBtn(
                  tooltip: Strings.search,
                  splashRadius: Dimens.iconSplashRadius,
                  onPressed: () {
                    showSnackbar(message: Strings.searchTap);
                  },
                  icon: const Icon(Icons.search)),
              iconBtn(
                  tooltip: Strings.menu,
                  splashRadius: Dimens.iconSplashRadius,
                  onPressed: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                  icon: const Icon(Icons.menu)),
              const SizedBox(width: 16)
            ],
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: RectangularIndicator(
                    color: scheme.primary,
                    topLeftRadius: Dimens.circularRadius,
                    topRightRadius: Dimens.circularRadius,
                    bottomLeftRadius: Dimens.circularRadius,
                    bottomRightRadius: Dimens.circularRadius,
                    horizontalPadding: Dimens.xMargin,
                    verticalPadding: Dimens.minMargin),
                tabs: mainTabs,
                controller: _tabController,
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                labelColor: Colors.white),
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
