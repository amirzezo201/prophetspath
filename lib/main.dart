import 'package:flutter/material.dart';
import 'package:prophetspath/base/routes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:prophetspath/ui/common/navbar.dart';
import 'package:prophetspath/ui/screens/error_screen.dart';
import 'base/providers.dart';
import 'utils/app_style.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasIntrent = true;
  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() => hasIntrent = false);
      } else {
        setState(() => hasIntrent = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        title: 'ProphetPath',
        themeMode: ThemeMode.light,
        theme: AppStyle.lightTheme,
        home: hasIntrent
            ? const NavigationBarWidget()
            : ErrorScreen(onPressed: () async {
                ConnectivityResult result =
                    await (Connectivity().checkConnectivity());
                if (result == ConnectivityResult.none ||
                    result == ConnectivityResult.bluetooth) {
                  setState(() => hasIntrent = false);
                } else {
                  setState(() => hasIntrent = true);
                }
              }),
      ),
    );
  }
}
