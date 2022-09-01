import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secret_box/constants.dart';
import 'package:secret_box/firebase_constants.dart';
import 'package:secret_box/my_controller.dart';
import 'package:secret_box/screens/otp_screen.dart';

class PhoneNumScreen extends GetView<MyController> {
  PhoneNumScreen({Key? key}) : super(key: key);
  final myController = Get.put(MyController());
  final phone = TextEditingController();

  final TextEditingController _phoneNumberController =
      TextEditingController(text: '');
  String verificationid = '';
  String otpcode = '';

  // Future<void> resendOtp() async {
  //   await auth.verifyPhoneNumber(
  //       phoneNumber: _phoneNumberController.text.toString(),
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await auth.signInWithCredential(credential);
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         if (e.code == 'invalid-phone-number') {
  //           debugPrint('Invalid phone number');
  //         }
  //       },
  //       codeSent: (String verificationid, int? resendToken) {
  //         this.verificationid = verificationid;
  //       },
  //       codeAutoRetrievalTimeout: (String verificationid) {});
  // }

  // Future<void> otpverifying() async {
  //   PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
  //       verificationId: verificationid, smsCode: otpcode);
  //   auth.signInWithCredential(phoneAuthCredential);
  // }

  // void signInWithPhoneAuthCredential(
  //     PhoneAuthCredential phoneAuthCredential) async {
  //   try {
  //     final authCredential =
  //         await auth.signInWithCredential(phoneAuthCredential);
  //     // if(authCredential.user!=null){

  //     // }
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Center(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Insérer numéro de téléphone \n EX: +226 XX XX XX XX',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black26,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Form(
                    key: controller.loginFormKey, //key for form
                    child: TextFormField(
                      controller: phone,
                      textInputAction: TextInputAction.next,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      cursorColor: Colors.black,
                      cursorHeight: 40,
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      decoration: InputDecoration(
                        hintText: '+226 ',
                        hintStyle: GoogleFonts.poppins(color: Colors.black38),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: kamber),
                        ),
                        suffixIcon: const Icon(
                          Icons.phone_android,
                          size: 25,
                          color: Colors.black38,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: kamber),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: kamber,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: kamber,
                      ),
                      child: Text(
                        'VALIDER',
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      controller.verifyphone(phone.text.trim());
                      Get.to(OtpScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
