import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_base/features/onboarding/onboarding_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/basic_features.dart';
import 'core/storage/preference_storage.dart';
import 'core/teams_integration/teams_integration.dart';
import 'core/utils/app_loader.dart';
import 'core/utils/logger_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Const.config();

  // Initialize GetStorage.
  await GetStorage.init();

  // await Firebase.initializeApp();
  // await Const.checkUpdates();
  // await NotificationManager().init();
  // await initializeTeams();
  Loader.instance.init();
  orientations();

  runApp(const MyApp());
}

void orientations() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

Future<void> initializeTeams() async {
  await Future.delayed(const Duration(seconds: 2));
  FlutterError.onError = (details) {
    PostToTeams post = getPostToTeams(logsToTeams: details.toString());

    FlutterError.presentError(details);
    // if (!kDebugMode) {

    sendLogsToTeams(post.toJson());
    // }
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    // if (!kDebugMode) {

    PostToTeams post =
        getPostToTeams(logsToTeams: error.toString() + stack.toString());
    sendLogsToTeams(post.toJson());
    // }
    return true;
  };
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // Permission.notification.request();
    super.initState();
  }

  getFcmToken() {
    FirebaseMessaging.instance.getToken().then((token) async {
      await PreferenceStorage.setFcmToken(token!);
      logger.w("Firebase token ~~~~~~~> $token");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, widget) {
        return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: GetMaterialApp(
              localizationsDelegates: const [
                /// THIS IS FOR COUNTRY CODE PICKER
                CountryLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale("en"),
              ],
              builder: EasyLoading.init(
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child!,
                  );
                },
              ),
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  elevation: 0.0,
                  color: Colors.blueGrey,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      statusBarIconBrightness: Brightness.light),
                  centerTitle: false,
                ),
                scaffoldBackgroundColor: ColorConst.screenBackground,
              ),
              debugShowCheckedModeBanner: false,
              title: AppString.appName,
              // onGenerateRoute: Routers.generateRoute,
              routes: const <String, WidgetBuilder>{},
              home: OnboardingScreen(),
            ));
      },
    );
  }
}
