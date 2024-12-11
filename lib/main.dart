import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:umrahcar_user/screens/splash_screen.dart';
import 'package:umrahcar_user/utils/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void configOneSignel() {
    OneSignal.shared.setAppId(onesignalAppId);
  }

  @override
  void initState() {
    configOneSignel();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Umrah Passenger User',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const SplashScreen(),
    );
  }
}
