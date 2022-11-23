import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class storesscreen extends StatefulWidget {
  String region;
  storesscreen({Key? key,required this.region}) : super(key: key);

  @override
  State<storesscreen> createState() => _storesscreenState();
}

class _storesscreenState extends State<storesscreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List shops = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountries();
  }

  void getCountries() async {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection(widget.region);

    QuerySnapshot countriess = await collectionReference.get();

    if (countriess.docs.length != 0) {
      for (var doc in countriess.docs){
        print(doc.data());
        shops.add(doc.data());
        print(doc.data());
      }
      print(shops);

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFF0000),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF0000),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            
          });
        },
        child: SafeArea(
          child: ListView.builder(
            itemCount: shops.length,
            
            itemBuilder: (context, index) {
            
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SizedBox(
                height: 100,
                child: Column(
                  //mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child:
                          Container(
                            //width: 360,
                            height: 70,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            child: Row(
                              //mainAxisSize: MainAxisSize.max,
                              children: [
                                FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: shops[index]['name'],
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 70,
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                Column(children: [
                                  Text(shops[index]['owner']+' is owner of the shop'),
                                  Text(shops[index]['origin']+'(Is from that country)'),
                                ],
                                ),
                              ],
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            );
          },
          ),
          ),
      ),
      );
    
  }
}