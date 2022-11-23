import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';
import 'package:unit_ii_p_i_ii_s/screens/stores_screen.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../flutter_flow/flutter_flow_widgets.dart';

class ListCountries extends StatefulWidget {
  const ListCountries({Key? key}) : super(key: key);

  @override
  _ListCountriesState createState() => _ListCountriesState();
}

class _ListCountriesState extends State<ListCountries> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List countries = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountries();
  }

  void getCountries() async {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("countries");

    QuerySnapshot countriess = await collectionReference.get();

    if (countriess.docs.length != 0) {
      for (var doc in countriess.docs){
        print(doc.data());
        countries.add(doc.data());
        print(countries[0]['name']);
      }

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
            itemCount: countries.length,
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
                                    final route = MaterialPageRoute(builder: (context) => storesscreen(region: countries[index]['place'],));
                                    Navigator.push(context, route);
                                  },
                                  text: countries[index]['name'],
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
                                  Text(countries[index]['stores']+' number of stores'),
                                  Text(countries[index]['continent']+' Continent'),
                                  Container(child: Image.network(countries[index]['flag']),
                                  height: 60,
                                  width: 70,
                                  ),
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

