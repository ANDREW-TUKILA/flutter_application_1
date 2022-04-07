import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/main.dart';

class AnalisisScore extends StatelessWidget {
  int trumpVolueFirstTeam=0;
  int trumpVolueSecondTeam=0;
  int scoresForRoundFirstTeam=0;
  int scoresForRoundSecondTeam=0;
  int trumpVolue=0;
  int boosPlayer=0;
  CardsPlaing card1, card2, card3, card4;
  String trump;
  int quantityCard;

  AnalisisScore(this.card1, this.card2, this.card3, this.card4, this.trump,
      this.quantityCard);
  @override
  Widget build(BuildContext context) {
     scorseForRound();
    return Container();
  }
  // scorseForRound();

  int setBossPlayer(CardsPlaing card1, CardsPlaing card2, CardsPlaing card3,
      CardsPlaing card4, String trump) {
    int setBoss;
    CardsPlaing bestCard;
    bestCard = findBossPlayer(card1, card2, card3, card4, trump);
    if (bestCard == card1) setBoss = 1;
    if (bestCard == card2) setBoss = 2;
    if (bestCard == card3) setBoss = 3;
    if (bestCard == card4) setBoss = 4;
    return setBoss;
  }

  CardsPlaing findBossPlayer(CardsPlaing card1, CardsPlaing card2,
      CardsPlaing card3, CardsPlaing card4, String trump) {
    CardsPlaing brabeChalendger;

    brabeChalendger = bribeAnalysis(card1, card2, card3, card4, trump);

    return brabeChalendger;
  }

  CardsPlaing bribeAnalysis(
      CardsPlaing cardOffPlayer1,
      CardsPlaing cardOffPlayer2,
      CardsPlaing cardOffPlayer3,
      CardsPlaing cardOffPlayer4,
      String trump) {
    CardsPlaing brabeChalendger1;
    CardsPlaing brabeChalendger2;
    CardsPlaing brabeChalendgerCup;
    brabeChalendger1 = simplyAnalysis(
        cardOffPlayer1, cardOffPlayer2, trump, cardOffPlayer1.cardlabel);
    brabeChalendger2 = simplyAnalysis(
        cardOffPlayer3, cardOffPlayer4, trump, cardOffPlayer1.cardlabel);
    brabeChalendgerCup = simplyAnalysis(
        brabeChalendger1, brabeChalendger2, trump, cardOffPlayer1.cardlabel);
    // print(brabeChalendgerCup.imgPath);
    // print(trump);

    return brabeChalendgerCup;
  }

  CardsPlaing simplyAnalysis(CardsPlaing card1, CardsPlaing card2, String trump,
      String labelBossCard) {
    CardsPlaing brabeChalendger;

    if (card1.cardlabel == card2.cardlabel) {
      if (card1.cardlabel != trump) {
        if (card1.brabeRang > card2.brabeRang) {
          brabeChalendger = card1;
        } else {
          brabeChalendger = card2;
        }
      } else {
        if (card1.brabeTrumpRang > card2.brabeTrumpRang) {
          brabeChalendger = card1;
        } else {
          brabeChalendger = card2;
        }
      }
    } else {
      if (card1.cardlabel == trump) {
        brabeChalendger = card1;
      } else {
        if (card2.cardlabel == trump) {
          brabeChalendger = card2;
        } else {
          if (card1.cardlabel == labelBossCard) {
            brabeChalendger = card1;
          } else {
            brabeChalendger = card2;
          }
        }
      }
    }

    return brabeChalendger;
  }

  void scorseForRound() {
    if (quantityCard <= 8 && quantityCard >= 0) {
      if (card1.cardlabel == trump)
        trumpVolue = trumpVolue + card1.rangTrumpCard;
      else
        trumpVolue = trumpVolue + card1.rangCard;
      if (card2.cardlabel == trump)
        trumpVolue = trumpVolue + card2.rangTrumpCard;
      else
        trumpVolue = trumpVolue + card2.rangCard;
      if (card3.cardlabel == trump)
        trumpVolue = trumpVolue + card3.rangTrumpCard;
      else
        trumpVolue = trumpVolue + card3.rangCard;
      if (card4.cardlabel == trump)
        trumpVolue = trumpVolue + card4.rangTrumpCard;
      else
        trumpVolue = trumpVolue + card4.rangCard;

      if (quantityCard == 1) {
        if (boosPlayer == 1 || boosPlayer == 3) {
          trumpVolueFirstTeam = trumpVolue + 10;
          scoresForRoundFirstTeam =
              scoresForRoundFirstTeam + trumpVolueFirstTeam;
        } else {
          trumpVolueSecondTeam = trumpVolue + 10;
          scoresForRoundSecondTeam =
              scoresForRoundSecondTeam + trumpVolueSecondTeam;
        }
      } else {
        if (boosPlayer == 1 || boosPlayer == 3) {
          trumpVolueFirstTeam = trumpVolue;
          scoresForRoundFirstTeam =
              scoresForRoundFirstTeam + trumpVolueFirstTeam;
        } else {
          trumpVolueSecondTeam = trumpVolue;
          scoresForRoundSecondTeam =
              scoresForRoundSecondTeam + trumpVolueSecondTeam;
        }
      }
      print('взял взятку $boosPlayer, $trumpVolue');
    }
  }
}
