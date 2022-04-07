/* import 'dart:io';
import 'dart:math';
import 'package:flutter_math/flutter_math.dart';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:provider/provider.dart';

class CardCreate {
  
CardCreate(bool isSuccessful, CardsStack cards ){
   
     Widget build(BuildContext context){
     return Container(
        color: Colors.green,
        child: Draggable<CardsPlaing>(
          onDragStarted: () {
            isSuccessful = false;
          },
          onDragCompleted: () {
            //  notifyListeners();
          },
          // feedbackOffset: Offset(250, 250),
          feedback: Image(
            image: AssetImage(cards.cards[2].imgPath),
            alignment: Alignment.topLeft,
            // fit: BoxFit.fitHeight,
            height: 250.0,
            width: 280.0,
          ),

          data: cards.cards[2],

          childWhenDragging: Container(),
          // onDragStarted:
          child: Container(
            padding: EdgeInsets.only(
              top: 0.0,
              bottom: 30.0,
              right: 0.0,
              left: 0.0,
            ),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(5.0, 4.0),
                  blurRadius: 10.0,
                ),
              ],
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                  color: Colors.cyan, width: 0, style: BorderStyle.solid),
            ),
            child: Hero(
                tag: 'imgPath',
                child: Image(
                  image:
                      AssetImage(context.read<CardsStack>().cards[2].imgPath),
                  alignment: Alignment.bottomLeft,
                  fit: BoxFit.fitHeight,
                  height: 180.0,
                  width: 80.0,
                )),
          ),
        )
        );
     }
}
}
 */