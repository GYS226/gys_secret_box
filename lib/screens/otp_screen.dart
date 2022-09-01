import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:secret_box/constants.dart';
import 'package:secret_box/firebase_constants.dart';
import 'package:secret_box/my_controller.dart';

class OtpScreen extends GetView<MyController> {
  OtpScreen({Key? key}) : super(key: key);
  final myController = Get.put(MyController());

  final otpcode = TextEditingController();
  // String verificationid = '';
  // String otpcode = '';

  // Future<void> otpverifying() async {
  //   PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
  //       verificationId: verificationid, smsCode: otpcode);
  //   auth.signInWithCredential(phoneAuthCredential);
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
                    'Insérez le code',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black26,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      // key: loginFormKey,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                          length: 6,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return "Code incorrect";
                            }
                          },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 45,
                            fieldWidth: 45,
                            activeFillColor: Colors.white,
                            activeColor: kamber,
                            disabledColor: Colors.grey,
                            // activeColor: mprimary,
                            inactiveFillColor: Colors.grey,
                          ),
                          cursorColor: Colors.black,
                          cursorHeight: 30,
                          // animationDuration: Duration(milliseconds: 300),
                          // enableActiveFill: true,
                          // errorAnimationController: errorController,
                          controller: otpcode,
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {},
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
                      controller.otpverifying(otpcode.text);
                    },
                  ),
                  const SizedBox(
                    height: 10,
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
                        'RENVOYER CODE',
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      
                      // // _myController.checkLogin();
                      // if (otpcode != '2022') {
                      //   return debugPrint("Code erroné");
                      // }
                      // Get.to(() => const se);
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
