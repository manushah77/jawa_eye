import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawa_eye/Constant/color.dart';
import 'package:jawa_eye/Screens/LoginScreen/login_screen.dart';
import 'package:jawa_eye/main.dart';
import 'package:jawa_eye/models/user_auth_response.dart';
import 'package:jawa_eye/providers/auth_provider.dart';
import 'package:jawa_eye/providers/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../widget/custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController usernameC = TextEditingController();
  bool ispasswordvisible = true;
  bool ispasswordvisibleTwo = true;
  bool _isChecked = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80.h,
            ),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                color: Colors.white,
                scale: 2.3,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 535.h,
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
                    'Registration Via Email/Phone',
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
                        hintText: 'Enter your active email address or phone number',
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
                      controller: usernameC,
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
                        hintText: 'Enter your Full Name',
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
                        hintText: 'Enter your 6-15 digit password',
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
                  SizedBox(
                    width: 280.w,
                    child: TextFormField(
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
                        hintText: 'Enter your 6-15 digit password again',
                        hintStyle: const TextStyle(
                          color: Colors.white38,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              ispasswordvisibleTwo = !ispasswordvisibleTwo;
                            });
                          },
                          icon: Icon(
                            size: 20,
                            ispasswordvisibleTwo ? Icons.visibility_off : Icons.visibility,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      obscureText: ispasswordvisibleTwo,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButton(
                    txt: 'Register',
                    onTap: () async {
                      var uid = const Uuid().v4();
                      await locator.get<AuthProvider>().registerUser(
                              userAuthResponse: UserAuthResponse(
                            deviceToken: deviceToken,
                            email: emailC.text,
                            password: passwordC.text,
                            isAccountVerified: false,
                            userId: uid,
                            username: usernameC.text,
                          ));
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Have an Account?',
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
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                        width: 10.w,
                      ),
                      Text(
                        "I know and agree  [All Terms and Condition]",
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w200,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
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
    print("Load Email");
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      print(_remeberMe);
      print(_email);
      print(_password);
      if (_remeberMe) {
        setState(() {
          _isChecked = true;
        });
        emailC.text = _email;
        passwordC.text = _password;
      }
    } catch (e) {
      print(e);
    }
  }
}
