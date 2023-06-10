import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jawa_eye/Screens/LoginScreen/login_screen.dart';
import 'package:jawa_eye/providers/local_notification_provider.dart';
import 'package:jawa_eye/providers/services.dart';

import 'firebase_options.dart';

String? deviceToken;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  LocalNotificationService.display(message);
}

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(380, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: GoogleFonts.abel().fontFamily),
        home: const LoginScreen(),
      ),
    );
  }
}


getFirebaseMessaging() async {
  FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onMessage.listen((event) {
    LocalNotificationService.display(event);
  });
}
