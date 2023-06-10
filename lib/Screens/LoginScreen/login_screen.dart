import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawa_eye/Constant/color.dart';
import 'package:jawa_eye/Screens/SignupScreen/signup_screen.dart';
import 'package:jawa_eye/Screens/widget/custom_button.dart';
import 'package:jawa_eye/providers/api_client.dart';
import 'package:jawa_eye/providers/auth_provider.dart';
import 'package:jawa_eye/providers/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../BottomNavigationBar/bottom_navigation_bar_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool ispasswordvisible = true;
  bool _isChecked = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  void requestPermission() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    NotificationSettings notificationSettings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    if (notificationSettings.authorizationStatus == AuthorizationStatus.authorized) {
      print("Granted");
    } else {
      print('faile');
    }

    await firebaseMessaging.getToken().then((value) {
      deviceToken = value;
      print('Token: $value');
    });
    getFirebaseMessaging();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150.h,
            ),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                color: Colors.white,
                scale: 2,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 440.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  const Text(
                    'Email Login',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 280.w,
                    child: TextFormField(
                      controller: emailC,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                        hintText: 'Enter your email address',
                        hintStyle: TextStyle(
                          color: Colors.white38,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 280.w,
                    child: TextFormField(
                      controller: passwordC,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.w,
                        )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.w,
                        )),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                        hintText: 'Enter your password',
                        hintStyle: const TextStyle(
                          color: Colors.white38,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              ispasswordvisible = !ispasswordvisible;
                            });
                          },
                          icon: Icon(
                            size: 20,
                            ispasswordvisible ? Icons.visibility_off : Icons.visibility,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      obscureText: ispasswordvisible,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50.w,
                      ),
                      SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: Theme(
                            data: ThemeData(
                              unselectedWidgetColor: Colors.white60, // Your color
                            ),
                            child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                activeColor: primaryColor,
                                value: _isChecked,
                                onChanged: _handleRemeberme),
                          )),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Remember Me",
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w200,
                          fontSize: 14.sp,
                        ),
                      ),
                      const SizedBox(width: 70.0),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w200,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButton(
                    txt: 'Login',
                    onTap: () {
                      locator
                          .get<AuthProvider>()
                          .authenticate(email: emailC.text, password: passwordC.text, deviceToken: deviceToken ?? '')
                          .then((value) {
                        if (value.userId != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavBar(),
                            ),
                          );
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w200,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Register Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRemeberme(bool? value) {
    print("Handle Rember Me");
    _isChecked = value!;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', emailC.text);
        prefs.setString('password', passwordC.text);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }

  void _loadUserEmailPassword() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;
      if (_remeberMe) {
        setState(() {
          _isChecked = true;
        });
        emailC.text = _email;
        passwordC.text = _password;
      }
    } catch (e) {}
  }
}
