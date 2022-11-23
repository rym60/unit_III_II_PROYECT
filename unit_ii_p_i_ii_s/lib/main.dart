import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_ii_p_i_ii_s/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  final camaras = await availableCameras();
  final first = camaras.first;
  runApp(myapp(firstCamera: first));
}

class myapp extends StatelessWidget {
  final CameraDescription firstCamera;
  const myapp({Key? key, required this.firstCamera}):super(key: key);

@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePageWidget(camera: firstCamera),
  );
}
}