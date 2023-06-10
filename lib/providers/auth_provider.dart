import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:jawa_eye/models/user_auth_response.dart';
import 'package:jawa_eye/providers/api_client.dart';

class AuthProvider extends FirebaseClient {
  Future<UserAuthResponse> registerUser({required UserAuthResponse userAuthResponse}) async {
    if (!(await checkLogin(userAuthResponse: userAuthResponse))) {
      var response = await post('account', data: userAuthResponse.toJson(), docName: userAuthResponse.email);
      if (response) {
        Fluttertoast.showToast(msg: 'User Registration completed, wait for approval mail or sms.');
        return userAuthResponse;
      } else {
        Fluttertoast.showToast(msg: 'User not registered');
        throw Exception('User Not Registered');
      }
    } else {
      Fluttertoast.showToast(msg: 'User already exists');
      throw Exception('User already exists');
    }
  }

  Future<UserAuthResponse> authenticate(
      {required String email, required String password, required String deviceToken}) async {
    var response = await getDoc('account', docId: email);
    if (response.exists) {
      UserAuthResponse userAuthResponse = UserAuthResponse.fromJson(response.data() ?? {});
      if (userAuthResponse.password == password) {
        if ((userAuthResponse.isAccountVerified ?? false)) {
          if (userAuthResponse.deviceToken != deviceToken) {
            await updateDoc('account',
                data: UserAuthResponse(
                  deviceToken: deviceToken,
                  email: userAuthResponse.email,
                  isAccountVerified: userAuthResponse.isAccountVerified,
                  password: userAuthResponse.password,
                  userId: userAuthResponse.userId,
                  username: userAuthResponse.username,
                ).toJson(),
                docName: email);
          }
        Fluttertoast.showToast(msg: 'User logged in successfully');
          return userAuthResponse;
        } else {
          Fluttertoast.showToast(msg: 'User not verified please wait for registration');
          throw Exception('User not verified');
        }
      } else {
        Fluttertoast.showToast(msg: 'Incorrect Password');
        throw Exception('Incorrect password');
      }
    } else {
      Fluttertoast.showToast(msg: 'Account not found');
      throw Exception('Account not Found');
    }
  }

  Future<bool> changePassword(
      {required String newPassword,
      required String oldPassword,
      required String email,
      required String deviceToken}) async {
    try {
      var user = await authenticate(email: email, password: oldPassword, deviceToken: deviceToken);
      if (user.password != newPassword) {
        var updated = await updateDoc(
          'account',
          data: UserAuthResponse(
            deviceToken: user.deviceToken,
            email: user.email,
            isAccountVerified: user.isAccountVerified,
            password: newPassword,
            userId: user.userId,
            username: user.username,
          ).toJson(),
          docName: email,
        );
        return updated;
      } else {
        Fluttertoast.showToast(msg: 'Cannot use old password!');
        throw Exception('Cannot use old password!');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> checkLogin({required UserAuthResponse userAuthResponse}) async {
    var resonse = await getDoc('account', docId: userAuthResponse.email ?? 'abc');
    if (resonse.exists) {
      return true;
    } else {
      return false;
    }
  }
}
