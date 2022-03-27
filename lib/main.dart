import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:heartmate_frontend/screens/login-screeen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'HeartMate',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: prediction_result_screen(
        //     resultCard: PositiveCard(),
        //     resultAppBarColor: postiveAppBar,
        //     resultBackgroundColor: positiveBackground),
        // home: prediction_result_screen(
        //     resultCard: NegativeCard(),
        //     resultAppBarColor: negativeAppBar,
        //     resultBackgroundColor: negativeBackground),
        home: LoginScreen());
  }
}
