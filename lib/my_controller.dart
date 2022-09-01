import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:secret_box/firebase_constants.dart';
import 'package:secret_box/screens/login.dart';
import 'package:secret_box/screens/secret_screen.dart';

class MyController extends GetxController {
  static MyController authInstance = Get.find();
  late Rx<User?> firebaseUser;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController _usernameController =
      TextEditingController(text: '');
  late TextEditingController _emailController = TextEditingController(text: '');
  late TextEditingController _passController = TextEditingController(text: '');
  late TextEditingController _pass2Controller = TextEditingController(text: '');

  // var username = '';
  // var pass = '';
  // var pass2 = '';
  // var email = '';
  var authState = ''.obs;
  String verificationid = '';

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      //user is logged in
      Get.offAll(() => SecretScreen());
    } else {
      //user is null as in user is not available or is not logged in
      Get.offAll(() => Login());
    }
  }

  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      //this the error message which can be configured
      //example: password did not match
      debugPrint(e.message);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      //this the error message which can be configured
      //example: password did not match
      debugPrint(e.message);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void forgotpass(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      //this the error message which can be configured
      //example: password did not match
      debugPrint(e.message);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }

  verifyphone(String phone) async {
    await auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 45),
        phoneNumber: phone,
        verificationCompleted: (AuthCredential authCredential) {},
        verificationFailed: (authException) {
          Get.snackbar('error', 'problem with code');
        },
        codeSent: (String id, [int? forceResend]) {
          this.verificationid = id;
          authState.value = "login success";
        },
        codeAutoRetrievalTimeout: (id) {
          this.verificationid = id;
        });
  }

  otpverifying(otpcode) async {
    var credential = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationid, smsCode: otpcode));
    if (credential.user != null) {
      Get.to(SecretScreen());
    }
  }

  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _pass2Controller = TextEditingController();
  }

  @override
  void onClose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _pass2Controller.dispose();
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
  }
}
