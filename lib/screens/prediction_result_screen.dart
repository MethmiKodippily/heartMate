// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:heartmate_frontend/constants.dart';
import 'package:heartmate_frontend/widgets/tip_card.dart';
import 'package:heartmate_frontend/widgets/postive_card.dart';
import 'package:heartmate_frontend/widgets/negative_card.dart';

class Prediction extends StatelessWidget {
  final Widget resultCard;
  const Prediction({
    Key? key,
    required this.resultCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF9FA8DA),
      appBar: AppBar(
        backgroundColor:kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              child: resultCard,
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              alignment: Alignment.topCenter,
              // margin: EdgeInsets.only(bottom: 25),
              child: Text(
                'Here are some Health Care Tips',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
            TipCard(tip: "Something something"),
            TipCard(
                tip:
                    "Health tips Health tips Health tips Health tips Health tips Health tips Health tips Health tips"),
            TipCard(
                tip:
                    "Health tips Health tips Health tips Health tips Health tips Health tips Health tips Health tips"),
            TipCard(
                tip:
                    "Health tips Health tips Health tips Health tips Health tips Health tips Health tips Health tips"),
            TipCard(
                tip:
                    "Health tips Health tips Health tips Health tips Health tips Health tips Health tips Health tips"),
            TipCard(
                tip:
                    "Health tips Health tips Health tips Health tips Health tips Health tips Health tips Health tips")
          ],
        ),
      ),
    );
  }
}
