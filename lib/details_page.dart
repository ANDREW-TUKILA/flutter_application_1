import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  // DetailsPage({Key key}) : super(key: key);
  final cardName;
  final cardTag;
  final cardLabel;

  DetailsPage({this.cardName, this.cardTag, this.cardLabel});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF21BFBD),
        body: ListView(children: [
          Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width - 150.0,
                color: Colors.transparent),
            Positioned(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(5.0, 9.0),
                          blurRadius: 30.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(
                          color: Colors.cyan,
                          width: 5,
                          style: BorderStyle.solid),
                    ),
                    child: Hero(
                      
                      tag: widget.cardName,
                      child: Image(
                        image: AssetImage(widget.cardName),
                        fit: BoxFit.cover,
                        height: 370.0,
                        width: 255.0,
                      ),
                    ),

                    /*     height: 400.0,
                   width: 300.0, */
                  ),
                  SizedBox(width: 150.50),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.cardTag,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 37.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(widget.cardLabel,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 35.0,
                              color: Colors.black,
                            ))
                      ])
                ],
              ),
            )
          ]),
          //  child: child,
        ]));
  }
}
