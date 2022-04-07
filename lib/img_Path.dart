// import 'package:lib/main.dart';

// import 'package:flutter_application_1/lib/main.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:flutter_application_1/main.dart';

class ImgPath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Image(
      image: AssetImage(
           context.read<CardsStack>().cards[1].imgPath),
        
      fit: BoxFit.cover,
      height: 250.0,
      width: 110.0,
    );
   
  }
}
