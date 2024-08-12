import 'dart:io' show Platform; // Importing 'dart:io' for platform checks on non-web platforms
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb; // Importing for web platform check
import 'package:flutter/material.dart';
import 'package:onlinechatting/login_page.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensuring initialization

  if (!kIsWeb) {
    // Initialize ZIMKit only on non-web platforms
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        ZIMKit().init(
          appID: 120985675, // your appid
          appSign: 'f0a281d745a6dd817f5e117aa77c4232f6466f59b4a374e116f33aa0792f97ef',
        );
      }
    } catch (e) {
      print('Failed to initialize ZIMKit: $e'); // Error handling
    }
  } else {
    print('ZIMKit is not supported on the web.');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
          splash: Image.network(
              height: 550,
              width: 250,
              'https://www.kindpng.com/picc/m/34-349854_whatsapp-chat-icon-hd-png-download.png'),
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white,
          nextScreen: LoginPage()) // Ensure LoginPage is properly defined
    );
  }
}
