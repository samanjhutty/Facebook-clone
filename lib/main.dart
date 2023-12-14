import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/assets/theme.dart';
import 'package:facebook/view/pages/drawer.dart';
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
import 'assets/mywidgets.dart';
import 'controller/firebase_options.dart';
import 'controller/profile_controller.dart';
import 'controller/signin_controller.dart';
import 'controller/signup_controller.dart';
import 'view/pages/signin.dart';
import 'view/pages/signup.dart';
import 'view/widgets/mobile_login.dart';
import 'view/widgets/otp_page.dart';
import 'view/widgets/reauth.dart';
import 'view/widgets/update_profile.dart';

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProfileController()),
          ChangeNotifierProvider(create: (context) => SignUpAuth()),
          ChangeNotifierProvider(create: (context) => SignInAuth()),
          ChangeNotifierProvider(create: (context) => MyWidgets())
        ],
        child: GetMaterialApp(
            initialRoute: auth.currentUser == null ? '/signin' : '/',
            routes: {
              '/': (p0) => const MyMainTab(),
              '/mobile': (p0) => const MobileLogin(),
              '/otppage': (p0) => const OTPPage(),
              '/profile': (p0) => const UpdateProfile(),
              '/signin': (p0) => const SignIn(),
              '/signup': (p0) => const SignUp(),
              '/reauth': (p0) => const ReAuthenticate()
            },
            title: 'Facebook',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: Themes.primaryColor,
                    brightness: Brightness.light),
                useMaterial3: true),
            darkTheme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: Themes.primaryColor,
                    brightness: Brightness.dark),
                useMaterial3: true),
            themeMode: ThemeMode.system,
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
              Consumer<SignInAuth>(builder: (context, value, child) {
                var user = FirebaseAuth.instance.currentUser;
                return user != null
                    ? PopupMenuButton(
                        onOpened: () => value.refresh(),
                        position: PopupMenuPosition.under,
                        padding: EdgeInsets.zero,
                        child: CircleAvatar(
                            child: user.photoURL == null
                                ? const Icon(Icons.person)
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                        user.photoURL.toString(),
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.cover),
                                  )),
                        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              PopupMenuItem(
                                  onTap: () => Get.toNamed('/profile'),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                        child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: user.photoURL == null
                                          ? const Icon(Icons.person)
                                          : Image.network(
                                              user.photoURL.toString(),
                                              height: double.infinity,
                                              width: double.infinity,
                                              fit: BoxFit.cover),
                                    )),
                                    title: Text(
                                        user.photoURL == null
                                            ? 'Username'
                                            : user.displayName!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    subtitle: const Text('Tap to Change',
                                        style: TextStyle(fontSize: 12)),
                                  )),
                              PopupMenuItem(
                                  onTap: () async => await value.logout(),
                                  child: const Row(children: [
                                    Icon(Icons.logout_rounded),
                                    SizedBox(width: 8),
                                    Text('Logout')
                                  ])),
                              PopupMenuItem(
                                  onTap: () async {
                                    final authrovider = FirebaseAuth
                                        .instance
                                        .currentUser!
                                        .providerData[0]
                                        .providerId;
                                    if (authrovider == 'password') {
                                      Get.toNamed('/reauth');
                                    } else if (authrovider == 'phone') {
                                      Get.rawSnackbar(
                                          message:
                                              'Please wait for a few seconds');
                                      await value.sendOTP();
                                    } else {
                                      Get.rawSnackbar(
                                          message:
                                              'Please wait for a few seconds');
                                      await value.reauth();
                                    }
                                  },
                                  child: const Row(children: [
                                    Icon(Icons.delete_forever_rounded,
                                        color: Colors.red),
                                    SizedBox(width: 8),
                                    Text('Delete Account')
                                  ]))
                            ])
                    : TextButton.icon(
                        onPressed: () => Get.toNamed('/signin'),
                        label: const Text('Sign In'),
                        icon: const Icon(Icons.login_rounded));
              }),
              const SizedBox(width: 16)
            ],
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: RectangularIndicator(
                    color: Themes.primaryColor,
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
                labelColor: Colors.white,
                unselectedLabelColor: Themes.iconDisabled),
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
