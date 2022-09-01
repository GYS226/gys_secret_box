import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:secret_box/firebase_constants.dart';
import 'package:secret_box/my_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  firebaseInitialisation.then((value) {
    Get.put(MyController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final myController = Get.put(MyController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Secret Box',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: const Center(child: CircularProgressIndicator()),
    );
  }
}
