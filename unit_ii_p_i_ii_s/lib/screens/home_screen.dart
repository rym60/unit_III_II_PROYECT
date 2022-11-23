import 'dart:io';

import 'package:camera/camera.dart';
import 'package:unit_ii_p_i_ii_s/screens/second_screen.dart';
import 'package:unit_ii_p_i_ii_s/screens/widgets/if_image.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/database_helper.dart';
import 'models/cart_model.dart';

class HomePageWidget extends StatefulWidget {
  final CameraDescription camera;
  const HomePageWidget({Key? key, required this.camera}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  double? ratingBarValue;
  String imagen = ''; 
  String na = ''; 
  String re = ''; 
  String ca = ''; 
  String vit = ''; 
  String adi = ''; 
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFFFF0000),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.dehaze,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                child: Text(
                  'Hi, Rym',
                  style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                child: Text(
                  'What\'s today Candies?',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: const Image(image: AssetImage('assets/cotton_candy.jpeg'), width: 100, height: 100,)
                        ),
                      ),
                      Text(
                        'Cotton Candy',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: const Image(image: AssetImage('assets/hard_candy1.jpeg'), width: 100, height: 100,)
                        ),
                      ),
                      Text(
                        'Hard Candy',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.search,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Color(0xFFFF0000),
                  shape: BoxShape.circle,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                      child: Container(child: siimagen(path: imagen,), width: 100, height: 100,)
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(70, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            na,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Text(
                            '${re} mx',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          RatingBar.builder(
                            onRatingUpdate: (newValue) =>
                                setState(() => ratingBarValue = newValue),
                            itemBuilder: (context, index) => Icon(
                              Icons.star_rounded,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                            ),
                            direction: Axis.horizontal,
                            initialRating: ratingBarValue ??= 4,
                            unratedColor: Color(0xFF9E9E9E),
                            itemCount: 5,
                            itemSize: 20,
                            glowColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                          ),
                          FFButtonWidget(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondScreenWidget(camera: widget.camera,na1: na , im1: imagen, pre1: re, cal1: ca, vit1: vit, adi1: adi,)));
                            },
                            text: 'add to car',
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context).bodyText1,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              //borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(),
                  child: Center(
                child: FutureBuilder<List<Cart>>(
                  future: DatabaseHelper.inst.getCarts(),
                  builder: (BuildContext context,
                  AsyncSnapshot<List<Cart>>snapshot
                  ){
                    if(!snapshot.hasData){
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: const Text('Loading...'),
                        ),
                      );
                    }else{
                      return snapshot.data!.isEmpty ?
                      Center(
                        child: Container(
                          child: const Text('No items in the list'),
                        ),
                      )
                      :
                      ListView(scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children:
                        snapshot.data!.map((cart) {
                          return Center(
                            child: GestureDetector(
                              child: Container(
                                      child:
                                        Container(child: Image.file(File(cart.image)), height: 100, width: 100,),
                                        
                                      
                                    ),
                                    onLongPress: () {
                                        setState(() {
                                        imagen = cart.image;
                                        na = cart.name;
                                        re = cart.price;
                                        ca = cart.calories;
                                        vit = cart.vitamins;
                                        adi = cart.additives;
                                        });
                                      },
                            )
                          );
                        }).toList()
                      );
                    }
                  }
                  ,
                  ),
              )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}