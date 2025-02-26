import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:teqinvalleyproject/Screen/s_get_start_screen/s_get_started_screen.dart';

class SignUpController extends GetxController {
  RxString fullName = "".obs;
  TextEditingController email = TextEditingController();
  Future<Map<String, dynamic>?> googleSignIn() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'profile', // ✅ Google Calendar Access
        ],
      );

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        print("Sign-in canceled by user");
        return null;
      }

      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;
      print(googleAuth?.accessToken);

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // String? accessToken = googleAuth?.accessToken;
      // if (accessToken != null) {
      //   await createGoogleCalendarEvent(accessToken);
      // }
      print('ID Token: ${googleAuth?.idToken}');
      print('Access Token: ${googleAuth?.accessToken}');

      // Sign in with Firebase
      UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? _user = authResult.user;

      if (_user != null) {
        print(_user.email);
        print(_user.displayName);
        fullName.value = _user.displayName ?? "";
        Get.to(() => SGetStartedScreen());
        // name.value="Radhika";
        // email.value="radhikajogi85@gmail.com";
        // googleId.value="107150953596651430487";
        // SignIn();
        // Return User Data
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
