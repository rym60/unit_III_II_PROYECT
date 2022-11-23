import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_ii_p_i_ii_s/screens/third_screen.dart';

import '../helpers/database_helper.dart';
import 'models/cart_model.dart';

class InsertScreen extends StatefulWidget {
  final String ImagePath;
  final CameraDescription camera;
  InsertScreen({Key? key, required this.ImagePath, required this.camera}) : super(key: key);

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  final textControllerName = TextEditingController();
  final textControllerPrice = TextEditingController();
  final textControllerCalories = TextEditingController();
  final textControllerVitamins = TextEditingController();
  final textControllerAdditives = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite Database"),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            TextFormField(controller: textControllerName,
             decoration: InputDecoration(
              icon: Icon(Icons.view_comfortable_outlined),
              labelText: 'input the name of the product'
              ), 
              ),
            TextFormField(controller: textControllerPrice,
             decoration: InputDecoration(
              icon: Icon(Icons.text_format_outlined),
              labelText: "input the price of the product"
              ), 
              ),
            TextFormField(controller: textControllerCalories,
             decoration: InputDecoration(
              icon: Icon(Icons.view_comfortable_outlined),
              labelText: 'input the calories of the product'
              ), 
              ),
            TextFormField(controller: textControllerVitamins,
             decoration: InputDecoration(
              icon: Icon(Icons.text_format_outlined),
              labelText: "input the vitamins of the product"
              ), 
              ),
            TextFormField(controller: textControllerAdditives,
             decoration: InputDecoration(
              icon: Icon(Icons.text_format_outlined),
              labelText: "input the additives of the product"
              ), 
              ),
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () async {
          DatabaseHelper.inst.add(Cart(name : textControllerName.text,
          price : textControllerPrice.text,
          calories : textControllerCalories.text,
          vitamins : textControllerVitamins.text,
          additives : textControllerAdditives.text,
          image: widget.ImagePath));

          Navigator.push(context, MaterialPageRoute(builder: (context)=> ThirdScreenWidget(camera: widget.camera)));

          setState(() {
            textControllerName.clear();
            textControllerPrice.clear();
            textControllerCalories.clear();
            textControllerVitamins.clear();
            textControllerAdditives.clear();
          });
          
        },
      ),
    );
  }
}