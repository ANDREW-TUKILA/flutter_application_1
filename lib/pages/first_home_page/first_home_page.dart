import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';



class FirstHomePage extends StatefulWidget {

  @override
  _FirstHomePageState createState() => _FirstHomePageState();
}



class _FirstHomePageState extends State<FirstHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(          
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Container(             
                width: 250,
                height: 100,       
                child: RaisedButton(
                  color: Colors.orangeAccent[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(55.0)),
                  elevation: 15.0,
                  onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => PlayPage()),
                  // ); 
                  } ,
                  child: Text('СОЗДАТЬ',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: Container(
                width: 250,
                height: 100,
                child: RaisedButton(
                   
                  color: Colors.orangeAccent[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(55.0)),
                  elevation: 15.0,
                   
                  onPressed: () {
                     Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  ); 
                  },
                  child: Text('ПРИМКНУТЬ',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Colors.red,
                Colors.black,
              ]),
        ),
      ),
    );
  }
}
