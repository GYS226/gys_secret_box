import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secret_box/constants.dart';
import 'package:secret_box/my_controller.dart';
import 'package:secret_box/screens/login.dart';

class Home extends GetView<MyController> {
  Home({Key? key}) : super(key: key);

  final myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 150,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    './assets/images/coins.png',
                    height: 300,
                    width: 280,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Online Digital Loan',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Installment without a credit card, buy now, pay later',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () {
                Get.to(() => Login());
              },
              child: Container(
                width: 250,
                height: 80,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffF8612C),
                      Color(0xffFE8E4B),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                  ),
                  color: kamber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
