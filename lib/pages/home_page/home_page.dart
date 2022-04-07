import 'package:animated_button/animated_button.dart';
import 'package:flutter_application_1/bloc/main_block_bloc.dart';
import 'package:flutter_application_1/logical/analisis_score.dart';
import 'package:flutter_application_1/pages/first_home_page/first_home_page.dart';
import 'package:flutter_application_1/cardStack.dart';
// import 'package:flutter_application_1/pages/first_home_page/first_home_page.dart';
import 'package:flutter_application_1/widgets/first_player_widget.dart';
import 'package:flutter_application_1/widgets/score_board_widget.dart';
import 'package:flutter_application_1/widgets/second_player_widget.dart';
import 'package:flutter_application_1/widgets/third_player_widget.dart';
import 'package:flutter_application_1/widgets/user_widget.dart';
// import 'package:flutter_application_1/main.dart';
// import 'package:flutter_math/flutter_math.dart';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:flutter_application_1/img_Path.dart';
// import 'package:flutter_application_1/card_create.dart';
import 'package:provider/provider.dart';





class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  AnalisisScore analisisScore;

  CardsStack cards = new CardsStack();
  // List<CardsPlaing> cards;
  // cards = cardsStack.getCards();
  String trump; // козырь
  int trumpVolueFirstTeam = 0;
  int trumpVolueSecondTeam = 0;
  int scoresForRoundFirstTeam = 0;
  int scoresForRoundSecondTeam = 0;
  int trumpVolue = 0;
  int boosPlayer = 4; // номер игрока, который  играет
  bool trumpOn = true; //
  final List<String> selectTrump = // список четырех козырей для выбора
      [
    'assets/pika1.png',
    'assets/trefa1.png',
    'assets/chirva1.png',
    'assets/bubna1.png'
  ];
  String deskTrump = 'assets/icecrown_card.png';
  bool newRound = true;

  double position1 = 50;
  double position2 = 50;
  double position3 = 50;
  //  double positionCard = 0;
  // double countCardPosition = 0;
  // List pushCardsListPlayer4 = [];
  // List pushCardsListPlayer3 = [];
  // List pushCardsListPlayer2 = [];
  // List pushCardsListPlayer1 = [];
  bool point = false;
  int quantityCard = 8; //количество карт
  List<CardsPlaing> keepsCard;
  List<CardsPlaing> listCardsPlayer1 = [];
  List<CardsPlaing> listCardsPlayer2 = [];
  List<CardsPlaing> listCardsPlayer3 = [];
  List<CardsPlaing> listCardsPlayer4 = [];
  CardsPlaing firstPutCard = CardsPlaing(CardName.seven, CardSuit.pika, 'assets/icecrown_card.png'); // карта положенная игроком чей сейчас ход

  CardsPlaing cardOfPlayer1 = new CardsPlaing(CardName.seven, CardSuit.pika, 'assets/icecrown_card.png'); 
  CardsPlaing cardOfPlayer2 = new CardsPlaing(CardName.seven, CardSuit.pika, 'assets/icecrown_card.png'); 
  CardsPlaing cardOfPlayer3 = new CardsPlaing(CardName.seven, CardSuit.pika, 'assets/icecrown_card.png'); 

  bool isSuccessful = true;
  CardsPlaing cardOfPlayer4 = new CardsPlaing(CardName.seven, CardSuit.pika, 'assets/icecrown_card.png'); 
  int numbersOfCards = 0;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!newRound) {
      // scorseForRound();
    }
    if (newRound) {
      // newRound = true;
      quantityCard = 8;
      cardOfPlayer1 = cardBackSide();
      cardOfPlayer2 = cardBackSide();
      cardOfPlayer3 = cardBackSide();
      cardOfPlayer4 = cardBackSide();

      trump = '';
      trumpOn = true;
      firstPutCard = CardsPlaing(CardName.seven, CardSuit.pika, 'assets/icecrown_card.png'); 
      if (scoresForRoundFirstTeam >= scoresForRoundSecondTeam)
        print(
            '$scoresForRoundFirstTeam/$scoresForRoundSecondTeam, WIN: FIRST TEAM');
      else
        print(
            '$scoresForRoundFirstTeam/$scoresForRoundSecondTeam, WIN: SECOND TEAM');
    }
    if (newRound) {
      // shuffleCards(cards);
      cards.cards.shuffle(); // тосовка колоды карт
      selectTrump.shuffle(); // тосовка козыря
      deskTrump = selectTrump[0]; //стартовый козырь при раздачи
      listCardsPlayer1 = addCardsToListPlayer(8, 15);
      listCardsPlayer2 = addCardsToListPlayer(16, 23);
      listCardsPlayer3 = addCardsToListPlayer(24, 31);
      listCardsPlayer4 = addCardsToListPlayer(0, 7);
      newRound = false;
      scoresForRoundFirstTeam = 0;
      scoresForRoundSecondTeam = 0;
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFF21BFBD),
          body: Provider(
            create: (context) {
              return cards;
            },
            child: Builder(builder: (BuildContext context) {
              trumpVolue = 0;
              boosPlayer = 0;
              // firstPutCard = CardsPlaing(
              //     'assets/icecrown_card.png', 'РУБАШКА', 'ПИКА', 1, 0, 0, 0, 0);
              // chahgePositionMyCards();
              MediaQuery.of(context).size.height;

              return Stack(
                alignment: AlignmentDirectional.topStart,
                fit: StackFit.passthrough,
                children: <Widget>[
                  Positioned(
                      top: 100,
                      left: 35,
                      height: 300,
                      width: 300,
                      child: Image.asset(deskTrump)),
                  Positioned(
                      top: 400,
                      left: 230,
                      child: GestureDetector(
                        child: AnimatedButton(
                          color: Colors.amber[400],
                          duration: 10,
                          width: 40,
                          height: 70,
                          child: Image(
                            image: AssetImage('assets/play_cards/A_s.png'),
                          ),
                          onPressed: () {
                            if (trumpOn) {
                              setState(() {
                                trump = 'ПИКА';
                                deskTrump = 'assets/pika1.png';
                                trumpOn = false;
                                position1 = 50;
                                position2 = 50;
                                position3 = 50;
                              });
                              print(trumpOn);
                            }
                          },
                        ),
                      )),
                  Positioned(
                      top: 400,
                      left: 180,
                      child: GestureDetector(
                        child: AnimatedButton(
                          color: Colors.amber[400],
                          width: 40,
                          height: 70,
                          child: Image(
                            image: AssetImage('assets/play_cards/A_h.png'),
                          ),
                          onPressed: () {
                            if (trumpOn) {
                              setState(() {
                                trump = 'ЧИРВА';
                                deskTrump = 'assets/chirva1.png';
                                trumpOn = false;
                                position1 = 50;
                                position2 = 50;
                                position3 = 50;
                              });
                              print(trumpOn);
                            }
                          },
                        ),
                      )),
                  Positioned(
                      top: 400,
                      left: 130,
                      child: GestureDetector(
                        child: AnimatedButton(
                          color: Colors.amber[400],
                          width: 40,
                          height: 70,
                          child: Image(
                            image: AssetImage('assets/play_cards/A_d.png'),
                          ),
                          onPressed: () {
                            if (trumpOn) {
                              setState(() {
                                trump = 'БУБНА';
                                deskTrump = 'assets/bubna1.png';
                                trumpOn = false;
                                position1 = 50;
                                position2 = 50;
                                position3 = 50;
                              });
                              print(trumpOn);
                            }
                          },
                        ),
                      )),
                  Positioned(
                      top: 400,
                      left: 80,
                      child: GestureDetector(
                        child: AnimatedButton(
                          color: Colors.amber[400],
                          width: 40,
                          height: 70,
                          child: Image(
                            image: AssetImage('assets/play_cards/A_c.png'),
                          ),
                          onPressed: () {
                            if (trumpOn) {
                              setState(() {
                                trump = 'КРЕСТА';
                                deskTrump = 'assets/trefa1.png';
                                trumpOn = false;
                                position1 = 50;
                                position2 = 50;
                                position3 = 50;
                              });
                              print(trumpOn);
                            }
                          },
                        ),
                      )),

                  moveCardPlayer4(),

                  moveCardPlayer1(cardOfPlayer1, cardOfPlayer4),
                  moveCardPlayer2(cardOfPlayer2, cardOfPlayer4),
                  moveCardPlayer3(cardOfPlayer3, cardOfPlayer4),
                FirstPlayerWidget(listCardsPlayer1, position1),
                  SecondPlayerWidget(listCardsPlayer2, position2),
                  ThirdPlayerWidget(listCardsPlayer3, position3),
                  UserWidget(listCardsPlayer4, quantityCard, trumpOn),
                  ScoreboardWidget(
                      scoresForRoundFirstTeam, scoresForRoundSecondTeam),
                  AnalisisScore(cardOfPlayer1, cardOfPlayer2, cardOfPlayer3,
                      cardOfPlayer4, trump, quantityCard),

                  // ScoreboardWidget(
                  //     context.read<AnalisisScore>().getscoresForRoundFirstTeam,
                  //     context.read<AnalisisScore>().getscoresForRoundSecondTeam),
                  // Positioned(
                  //     // top: 0,
                  //     bottom: -130,
                  //     // left: -50,
                  //     height: 600,
                  //     width: 500,
                  //     child: Stack(
                  //       children: <Widget>[
                  //         for (int i = 0; i < listCardsPlayer1.length; i++)
                  //           cardsPlayer1(listCardsPlayer1[i].imgPath)
                  //       ],
                  //     )),
                  // Positioned(
                  //     bottom: 00,
                  //     // right: 100,
                  //     left: -30,
                  //     height: 600,
                  //     width: 440,
                  //     child: Stack(
                  //       children: <Widget>[
                  //         for (int i = 0; i < listCardsPlayer2.length; i++)
                  //           cardsPlayer2(listCardsPlayer2[i].imgPath)
                  //       ],
                  //     )),
                  // Positioned(
                  //     bottom: 20,
                  //     // right: 100,
                  //     left: 100,
                  //     height: 600,
                  //     width: 260,
                  //     child: Stack(
                  //       children: <Widget>[
                  //         for (int i = 0; i < listCardsPlayer3.length; i++)
                  //           cardsPlayer3(listCardsPlayer3[i].imgPath)
                  //       ],
                  //     )),
                  // orderOfPlayersMoves()

                  // if (quantityCard==0)
                  // Positioned(
                  //     top: 440,
                  //     left: 30,
                  //     child: Container(
                  //       color: Colors.amber[400],
                  //       width: 40,
                  //       height: 40,
                  //       child: Text('$scoresForRoundFirstTeam'),
                  //     )),
                  // //  if (quantityCard==0)
                  // Positioned(
                  //     top: 440,
                  //     left: 300,
                  //     child: Container(
                  //       // alignment: AlignmentGeometr,
                  //       color: Colors.amber[400],
                  //       width: 40,
                  //       height: 40,
                  //       child: Text('$scoresForRoundSecondTeam'),
                  //     )),

                  // Positioned(
                  //   //  width: 300,
                  //   // height: 10,
                  //   bottom: 1,
                  //   left: 0,
                  //   right: 3,
                  //   top: 490,
                  //   // height: 300,

                  //   child: Container(
                  //       // padding: EdgeInsetsGeometry.infinity,
                  //       // alignment:AlignmentGeometry.lerp(AlignmentDirectional.bottomEnd, Alignment.center, 1),
                  //       // height: MediaQuery.of(context).size.height ,
                  //       height: 150,
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius:
                  //             BorderRadius.only(topLeft: Radius.circular(75.0)),
                  //       ),
                  //       child: Stack(
                  //         alignment: Alignment.bottomLeft,
                  //         children: <Widget>[
                  //           for (int i = 0; i < listCardsPlayer4.length; i++)
                  //             showMyCard(trumpOn, listCardsPlayer4[i])
                  //         ],
                  //       )
                  //       // })
                  //       ),
                  // ),
                  Positioned(
                      top: 350,
                      left: 250,
                      child: GestureDetector(
                        child: Hero(
                          tag: 'HomePage',
                          child: AnimatedButton(
                            color: Colors.deepOrange,
                            width: 50,
                            height: 30,
                            child: Text('+'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FirstHomePage()));
                              setState(() {
                                cardOfPlayer1 = cardBackSide();
                                cardOfPlayer2 = cardBackSide();
                                cardOfPlayer3 = cardBackSide();
                                cardOfPlayer4 = cardBackSide();
                              });
                            },
                          ),
                        ),
                      )),
                  if (quantityCard == -1)
                    Positioned(
                        top: 360,
                        left: 80,
                        child: GestureDetector(
                          child: AnimatedButton(
                            color: Colors.deepOrange,
                            width: 200,
                            height: 30,
                            child: Text('НОВАЯ РАЗДАЧА'),
                            onPressed: () {
                              setState(() {
                                newRound = true;
                              });
                            },
                          ),
                        )),
                  if (quantityCard == 0)
                    Positioned(
                        top: 60,
                        left: 0,
                        child: GestureDetector(
                          child: AnimatedButton(
                            color: Colors.red,
                            width: 400,
                            height: 300,
                            child: Text('YOU WIN!!!!'),
                            onPressed: () {
                              setState(() {
                                quantityCard = -1;
                              });

                              // print(trumpOn);
                            },
                          ),
                        )),
                  if (quantityCard == 0 &&
                      scoresForRoundFirstTeam < scoresForRoundSecondTeam)
                    Positioned(
                        top: 60,
                        left: 0,
                        child: GestureDetector(
                          child: AnimatedButton(
                            color: Colors.red,
                            width: 400,
                            height: 300,
                            child: Text('YOU LOOZE!!!!'),
                            onPressed: () {
                              setState(() {
                                quantityCard = -1;
                              });

                              // print(trumpOn);
                            },
                          ),
                        )),
                ],
              );

              // }
            }),
          )),
    );
  }

  biasCards() {
    // смешщение крты при выбрасывании

    return Container();
  }

  // showMyCard(bool trumpOn, CardsPlaing card) {
  //   // print(quantityCard);
  //   // print(positionCard);
  //   // print(countCardPosition);
  //   double cardPos = positionCard + countCardPosition;
  //   positionCard = cardPos;

  //   // print(cardPos);
  //   return Positioned(
  //     width: 110,
  //     height: 150,
  //     left: cardPos,
  //     child: myCardCreate(trumpOn, isSuccessful, card),
  //   );
  // }

  // Widget cardsPlayer1(String cardImgPath) {
  //   position1 = position1 + 30;
  //   return Positioned(
  //     top: position1,
  //     left: -30,
  //     child: Container(
  //         transform: Matrix4.rotationZ(1588),
  //         child: Image(
  //           image: AssetImage(cardImgPath),
  //           alignment: Alignment.bottomLeft,
  //           fit: BoxFit.fitHeight,
  //           height: 80.0,
  //           width: 80.0,
  //         )),
  //   );
  // }

  // Widget cardsPlayer2(String cardImgPath) {
  //   position2 = position2 + 30;
  //   return Positioned(
  //     right: position2,
  //     // right: -30,
  //     child: Container(
  //         // transform: Matrix4.rotationZ(1588),
  //         child: Image(
  //       image: AssetImage(cardImgPath),
  //       alignment: Alignment.bottomLeft,
  //       fit: BoxFit.fitHeight,
  //       height: 80.0,
  //       width: 80.0,
  //     )),
  //   );
  // }

  // Widget cardsPlayer3(String cardImgPath) {
  //   position3 = position3 + 30;
  //   return Positioned(
  //     bottom: position3,
  //     right: -30,
  //     child: Container(
  //         transform: Matrix4.rotationZ(1588),
  //         child: Image(
  //           image: AssetImage(cardImgPath),
  //           alignment: Alignment.bottomLeft,
  //           fit: BoxFit.fitHeight,
  //           height: 80.0,
  //           width: 80.0,
  //         )),
  //   );
  // }

  // myCardCreate(bool trumpOn, bool isSuccessful, CardsPlaing card) {
  //   // print(trumpOn);
  //   if (trumpOn == false) {
  //     return Container(

  //         // color: Colors.green,
  //         child: Draggable<CardsPlaing>(
  //       onDragStarted: () {
  //         isSuccessful = false;
  //       },
  //       dragAnchor: DragAnchor.child,
  //       onDragCompleted: () {
  //         setState(() {
  //           // widget.offset = Offset.zero;

  //           point = true;
  //           // pushCardsListPlayer4.add(card.numberCard);
  //         });
  //       },
  //       // feedbackOffset: Offset(250, 250),
  //       feedback: Image(
  //         image: AssetImage(card.imgPath),
  //         alignment: Alignment.bottomLeft,
  //         // fit: BoxFit.fitHeight,
  //         height: 120.0,
  //         width: 280.0,
  //       ),

  //       data: card,

  //       childWhenDragging: Container(),
  //       // onDraggableCanceled:
  //       child: Container(
  //         padding: EdgeInsets.only(
  //           top: 40.0,
  //           bottom: 0.0,
  //           right: 0.0,
  //           left: 0.0,
  //         ),
  //         decoration: BoxDecoration(
  //           // boxShadow: <BoxShadow>[
  //           //   BoxShadow(
  //           //     color: Colors.black,
  //           //     offset: Offset(5.0, 4.0),
  //           //     blurRadius: 10.0,
  //           //   ),
  //           // ],
  //           borderRadius: BorderRadius.circular(20.0),
  //           border: Border.all(
  //               color: Colors.cyan, width: 0, style: BorderStyle.solid),
  //         ),
  //         child: Hero(
  //             tag: 'imgPath',
  //             child: Image(
  //               image: AssetImage(card.imgPath),
  //               alignment: Alignment.bottomLeft,
  //               fit: BoxFit.fitHeight,
  //               height: 180.0,
  //               width: 80.0,
  //             )),
  //       ),
  //     ));
  //   } else {
  //     return Container(
  //       padding: EdgeInsets.only(
  //         top: 40.0,
  //         bottom: 0.0,
  //         right: 0.0,
  //         left: 0.0,
  //       ),
  //       decoration: BoxDecoration(
  //         // boxShadow: <BoxShadow>[
  //         //   BoxShadow(
  //         //     color: Colors.black,
  //         //     offset: Offset(5.0, 4.0),
  //         //     blurRadius: 10.0,
  //         //   ),
  //         // ],
  //         borderRadius: BorderRadius.circular(20.0),
  //         border: Border.all(
  //             color: Colors.cyan, width: 0, style: BorderStyle.solid),
  //       ),
  //       child: Hero(
  //           tag: 'imgPath',
  //           child: Image(
  //             image: AssetImage(card.imgPath),
  //             alignment: Alignment.bottomLeft,
  //             fit: BoxFit.fitHeight,
  //             height: 180.0,
  //             width: 80.0,
  //           )),
  //     );
  //   }
  // }

  moveCardPlayer1(CardsPlaing cardPlaing, CardsPlaing cardPlayerBefore) {
    if (cardPlayerBefore.imgPath != 'assets/icecrown_card.png') {
      cardOfPlayer1 =
          pushCardsPlayerSameone(listCardsPlayer1, firstPutCard, quantityCard);
    }
    return BlocProvider(
      create: (context) => MainBlockBloc(cardsPlaing: cardPlaing),
      child: BlocListener<MainBlockBloc, MainBlockState>(listener:
          (context, state) {
        // TODO: implement listener
      }, child:
          BlocBuilder<MainBlockBloc, MainBlockState>(builder: (context, state) {
        // if (state is MainBlockInitial &&
        //     cardPlayerBefore.imgPath == 'assets/icecrown_card.png') {
        //   context.read<MainBlockBloc>().add(AwaitForMove());
        //   return Positioned(
        //       top: 170,
        //       left: 90,
        //       child: Image(
        //         image: AssetImage('assets/icecrown_card.png'),
        //         // fit: BoxFit.cover,
        //         height: 100.0,

        //         width: 100.0,
        //       ));
        // }else
        if (state is MainBlockInitial) {
          // context.read<MainBlockBloc>().add(StopAwaitForMove());
          return Positioned(
              top: 170,
              left: 90,
              child: Image(
                image: AssetImage(cardOfPlayer1.imgPath),
                // fit: BoxFit.cover,
                height: 100.0,

                width: 100.0,
              ));
        }
      })),
    );
  }

  Positioned moveCardPlayer2(
      CardsPlaing cardPlaing, CardsPlaing cardPlayerBefore) {
    if (cardPlayerBefore.imgPath != 'assets/icecrown_card.png') {
      cardOfPlayer2 =
          pushCardsPlayerSameone(listCardsPlayer2, firstPutCard, quantityCard);
    }
    return Positioned(
        top: 100,
        left: 120,
        child: Image(
          image: AssetImage(cardOfPlayer2.imgPath),
          // fit: BoxFit.cover,
          height: 100.0,
          width: 100.0,
        ));
  }

  Positioned moveCardPlayer3(
      CardsPlaing cardPlaing, CardsPlaing cardPlayerBefore) {
    if (cardPlayerBefore.imgPath != 'assets/icecrown_card.png') {
      cardOfPlayer3 =
          pushCardsPlayerSameone(listCardsPlayer3, firstPutCard, quantityCard);
    }
    return Positioned(
        top: 170,
        left: 190,
        child: Image(
          image: AssetImage(cardOfPlayer3.imgPath),
          // fit: BoxFit.cover,
          height: 100.0,
          width: 100.0,
        ));
  }

  // разадача карт каждому игроку
  List<CardsPlaing> addCardsToListPlayer(int firstCard, int lastCard) {
    List<CardsPlaing> cardsForPlaying = [];
    for (int i = 0; i <= lastCard - firstCard; i++) {
      cardsForPlaying.add(cards.cards[i + firstCard]);

      // print(cardsForPlaying[i]);
    }
    cardsForPlaying.sort((a, b) => a.numberCard.compareTo(b.numberCard));
    return cardsForPlaying;
  }

  CardsPlaing pushCardsPlayerSameone(List<CardsPlaing> listCardsPlayer,
      CardsPlaing pushCard, int quantityPushCard) {
    CardsPlaing cardPlaing = pushCard;
    bool boolCard = true;
    if (boolCard && quantityPushCard <= 8 && quantityPushCard >= 1) {
      if (boolCard) {
        for (int i = 0; i < listCardsPlayer.length; i++)
          if (pushCard.cardlabel == listCardsPlayer[i].cardlabel) {
            cardPlaing = listCardsPlayer[i];
            // pushCardsListPlayer3.add(listCardsPlayer[i].numberCard);
            listCardsPlayer.remove(cardPlaing);
            i = listCardsPlayer.length;
            boolCard = false;
          }
      } else {
        for (int i = 0; i < listCardsPlayer.length; i++)
          if (trump == listCardsPlayer[i].cardlabel) {
            cardPlaing = listCardsPlayer[i];
            // pushCardsListPlayer3.add(listCardsPlayer[i].numberCard);
            listCardsPlayer.remove(cardPlaing);
            i = listCardsPlayer.length;
            boolCard = false;
          }
      }

      if (boolCard && quantityPushCard >= 1) {
        cardPlaing = listCardsPlayer[0];
        // pushCardsListPlayer3.add(pushCard.numberCard);
        listCardsPlayer.remove(cardPlaing);
      }
    }
    return cardPlaing;
  }

  CardsPlaing cardBackSide() {
    return CardsPlaing(CardName.seven, CardSuit.pika, 'assets/icecrown_card.png'); 
  }

  Positioned moveCardPlayer4() {
    return Positioned(
      child: DragTarget<CardsPlaing>(
        builder: (context, candidateData, rejectedData) {
          var image2 = Image(
            image: AssetImage(cardOfPlayer4.imgPath),
            // fit: BoxFit.cover,
            height: 25.0,
            width: 20.0,
          );
          return Container(
            child: isSuccessful
                ? Container(
                    alignment: Alignment.center,
                    height: 600,
                    // color: Colors.amber,
                    child: SizedBox(
                      height: 100.0,
                      width: 250.0,
                      child: image2,
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    height: 600,
                    // child: Hero(
                    //   tag: 'imgPath',
                    child: SizedBox(
                      height: 100.0,
                      width: 250.0,
                      child: image2,
                    ),
                    // ),
                  ),
          );
        },
        onWillAccept: (data) {
          isSuccessful = false;
          return true;
        },
        onLeave: (data) {
          isSuccessful = true;
        },
        onAccept: (data) {
          //  deleteCardFromStack(listCardsPlayer1, cardOfPlayer1);
          setState(() {
            position1 = 50;
            position2 = 50;
            position3 = 50;
            firstPutCard = data;
            cardOfPlayer4 = data;
            // selectMoveCardsPlayers();
            listCardsPlayer4.remove(data);
            // cardOfPlayer4.imgPath = data.getImgPath;
            // print(cardOfPlayer4.imgPath.toString());
            numbersOfCards = numbersOfCards + 1;
            isSuccessful = false;
            --quantityCard;
          }); //setState
        },
      ),
    );
  }

// отображение карт во время очередного захода
  // void orderOfPlayersMoves() {
  //   moveCardPlayer1(cardOfPlayer1);
  //   moveCardPlayer2(cardOfPlayer2);
  //   moveCardPlayer3(cardOfPlayer3);
  //   moveCardPlayer4();
  // }

  // int setBossPlayer(CardsPlaing card1, CardsPlaing card2, CardsPlaing card3,
  //     CardsPlaing card4, String trump) {
  //   int setBoss;
  //   CardsPlaing bestCard;
  //   bestCard = findBossPlayer(card1, card2, card3, card4, trump);
  //   if (bestCard == card1) setBoss = 1;
  //   if (bestCard == card2) setBoss = 2;
  //   if (bestCard == card3) setBoss = 3;
  //   if (bestCard == card4) setBoss = 4;
  //   return setBoss;
  // }

// определение игрока взявшего взятку и назначение ему хода
  // CardsPlaing findBossPlayer(CardsPlaing card1, CardsPlaing card2,
  //     CardsPlaing card3, CardsPlaing card4, String trump) {
  //   CardsPlaing brabeChalendger;

  //   brabeChalendger = bribeAnalysis(card1, card2, card3, card4, trump);

  //   return brabeChalendger;
  // }

// анализ кард в текущей взятке
  // CardsPlaing bribeAnalysis(
  //     CardsPlaing cardOffPlayer1,
  //     CardsPlaing cardOffPlayer2,
  //     CardsPlaing cardOffPlayer3,
  //     CardsPlaing cardOffPlayer4,
  //     String trump) {
  //   CardsPlaing brabeChalendger1;
  //   CardsPlaing brabeChalendger2;
  //   CardsPlaing brabeChalendgerCup;
  //   brabeChalendger1 = simplyAnalysis(
  //       cardOffPlayer1, cardOffPlayer2, trump, cardOffPlayer1.cardlabel);
  //   brabeChalendger2 = simplyAnalysis(
  //       cardOffPlayer3, cardOffPlayer4, trump, cardOffPlayer1.cardlabel);
  //   brabeChalendgerCup = simplyAnalysis(
  //       brabeChalendger1, brabeChalendger2, trump, cardOffPlayer1.cardlabel);
  //   // print(brabeChalendgerCup.imgPath);
  //   // print(trump);

  //   return brabeChalendgerCup;
  // }

  // void selectMoveCardsPlayers() {
  //   // cardOfPlayer1 =
  //   //     pushCardsPlayerSameone(listCardsPlayer1, firstPutCard, quantityCard);
  //   // cardOfPlayer2 =
  //   //     pushCardsPlayerSameone(listCardsPlayer2, firstPutCard, quantityCard);
  //   // cardOfPlayer3 =
  //   //     pushCardsPlayerSameone(listCardsPlayer3, firstPutCard, quantityCard);

  //   //   boosPlayer = setBossPlayer(
  //   //       cardOfPlayer4, cardOfPlayer1, cardOfPlayer2, cardOfPlayer3, trump);
  //   //
  // }

//анализ двух карт
  // CardsPlaing simplyAnalysis(CardsPlaing card1, CardsPlaing card2, String trump,
  //     String labelBossCard) {
  //   CardsPlaing brabeChalendger;

  //   if (card1.cardlabel == card2.cardlabel) {
  //     if (card1.cardlabel != trump) {
  //       if (card1.brabeRang > card2.brabeRang) {
  //         brabeChalendger = card1;
  //       } else {
  //         brabeChalendger = card2;
  //       }
  //     } else {
  //       if (card1.brabeTrumpRang > card2.brabeTrumpRang) {
  //         brabeChalendger = card1;
  //       } else {
  //         brabeChalendger = card2;
  //       }
  //     }
  //   } else {
  //     if (card1.cardlabel == trump) {
  //       brabeChalendger = card1;
  //     } else {
  //       if (card2.cardlabel == trump) {
  //         brabeChalendger = card2;
  //       } else {
  //         if (card1.cardlabel == labelBossCard) {
  //           brabeChalendger = card1;
  //         } else {
  //           brabeChalendger = card2;
  //         }
  //       }
  //     }
  //   }

  //   return brabeChalendger;
  // }

  // void scorseForRound() {
  //   if (quantityCard <= 8 && quantityCard >= 0) {
  //     if (cardOfPlayer1.cardlabel == trump)
  //       trumpVolue = trumpVolue + cardOfPlayer1.rangTrumpCard;
  //     else
  //       trumpVolue = trumpVolue + cardOfPlayer1.rangCard;
  //     if (cardOfPlayer2.cardlabel == trump)
  //       trumpVolue = trumpVolue + cardOfPlayer2.rangTrumpCard;
  //     else
  //       trumpVolue = trumpVolue + cardOfPlayer2.rangCard;
  //     if (cardOfPlayer3.cardlabel == trump)
  //       trumpVolue = trumpVolue + cardOfPlayer3.rangTrumpCard;
  //     else
  //       trumpVolue = trumpVolue + cardOfPlayer3.rangCard;
  //     if (cardOfPlayer4.cardlabel == trump)
  //       trumpVolue = trumpVolue + cardOfPlayer4.rangTrumpCard;
  //     else
  //       trumpVolue = trumpVolue + cardOfPlayer4.rangCard;

  //     if (quantityCard == 1) {
  //       if (boosPlayer == 1 || boosPlayer == 3) {
  //         trumpVolueFirstTeam = trumpVolue + 10;
  //         scoresForRoundFirstTeam =
  //             scoresForRoundFirstTeam + trumpVolueFirstTeam;
  //       } else {
  //         trumpVolueSecondTeam = trumpVolue + 10;
  //         scoresForRoundSecondTeam =
  //             scoresForRoundSecondTeam + trumpVolueSecondTeam;
  //       }
  //     } else {
  //       if (boosPlayer == 1 || boosPlayer == 3) {
  //         trumpVolueFirstTeam = trumpVolue;
  //         scoresForRoundFirstTeam =
  //             scoresForRoundFirstTeam + trumpVolueFirstTeam;
  //       } else {
  //         trumpVolueSecondTeam = trumpVolue;
  //         scoresForRoundSecondTeam =
  //             scoresForRoundSecondTeam + trumpVolueSecondTeam;
  //       }
  //     }
  //     print('взял взятку $boosPlayer, $trumpVolue');
  //   }
  // }

  // void chahgePositionMyCards() {
  //   switch (quantityCard) {
  //     case 8:
  //       {
  //         positionCard = -40;
  //         countCardPosition = 40;
  //       }
  //       break;
  //     case 7:
  //       {
  //         positionCard = -46;
  //         countCardPosition = 46;
  //       }
  //       break;
  //     case 6:
  //       {
  //         positionCard = -56;
  //         countCardPosition = 56;
  //       }
  //       break;
  //     case 5:
  //       {
  //         positionCard = -70;
  //         countCardPosition = 70;
  //       }
  //       break;
  //     case 4:
  //       {
  //         positionCard = -60;
  //         countCardPosition = 80;
  //       }
  //       break;
  //     case 3:
  //       {
  //         positionCard = -20;
  //         countCardPosition = 80;
  //       }
  //       break;
  //     case 2:
  //       {
  //         positionCard = 20;
  //         countCardPosition = 80;
  //       }
  //       break;
  //     default:
  //       {
  //         positionCard = 60;
  //         countCardPosition = 80;
  //       }
  //   }
  // }
}
