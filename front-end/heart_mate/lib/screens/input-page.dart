import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heart_mate/screens/login-screen.dart';
import 'package:heart_mate/pallette.dart';

class InputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    
    return Stack(
      children: [
        Backgroundimage(image: 'assets/image4.jpg'),
        Scrollbar(
          isAlwaysShown: true,
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: (
                    Column(
                      children: [
                        SizedBox(
                          height: size.width * 0.1,
                        ),
                        Stack(
                          children: [
                            Center(
                              child: ClipOval(
                                child: (
                                    BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 3,
                                          sigmaY: 3),

                                      child: (
                                          CircleAvatar(
                                            radius: size.width * 0.14,
                                            backgroundColor: Colors.grey[400]?.withOpacity(
                                                0.4),
                                            child: Icon(
                                              FontAwesomeIcons.user,
                                              color: kWhite,
                                              size: size.width * 0.1,
                                            ),
                                          )
                                      ),
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.width * 0.1,
                        ),
                        Column(
                          children: [
                            TextInputField(
                              hint: 'Age',
                              inputAction: TextInputAction.next,
                              inputType: TextInputType.number,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextInputField(
                              hint: 'Systolic Blood Pressure',
                              inputAction: TextInputAction.next,
                              inputType: TextInputType.number,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextInputField(
                              hint: 'Diastolic Blood Pressure',
                              inputAction: TextInputAction.next,
                              inputType: TextInputType.number,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextInputField(
                              hint: 'Glucose',
                              inputAction: TextInputAction.next,
                              inputType: TextInputType.number,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextInputField(
                              hint: 'Total Cholestorol',
                              inputAction: TextInputAction.next,
                              inputType: TextInputType.number,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextInputField(
                              hint: 'BMI',
                              inputAction: TextInputAction.next,
                              inputType: TextInputType.number,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Select Gender :",
                              style: TextStyle(
                                fontSize: 20,color: Colors.white,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                   height: 20,
                                ),
                              Row(
                               children: <Widget>[
                                Radio(
                                 value: 1,
                                 onChanged: (val) {
                                  },
                                 activeColor: Colors.blue,
                                ),
                                Text(
                                    'Male',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white
                                  ),
                                ),
                                 SizedBox(
                                 width: 30,
                                ),
                                Radio(
                                  value: 0,
                                  onChanged: (val) {
                                   },
                                  activeColor: Colors.blue,
                                  ),
                                Text(
                                  'Female',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white
                                  ),

                                ),
                                 ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Are you taking blood pressure medicines ?",
                              style: TextStyle(
                                fontSize: 20,color: Colors.white,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    Radio(
                                      value: 1,
                                      onChanged: (val) {
                                      },
                                      activeColor: Colors.blue,
                                    ),
                                    Text(
                                      'Yes',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Radio(
                                      value: 0,
                                      onChanged: (val) {
                                      },
                                      activeColor: Colors.blue,
                                    ),
                                    Text(
                                      'No',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Have you been diagnosed with hypertension ? ",
                              style: TextStyle(
                                fontSize: 20,color: Colors.white,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    Radio(
                                      value: 1,
                                      onChanged: (val) {
                                      },
                                      activeColor: Colors.blue,
                                    ),
                                    Text(
                                      'Yes',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Radio(
                                      value: 0,
                                      onChanged: (val) {


                                      },
                                      activeColor: Colors.blue,
                                    ),
                                    Text(
                                      'No',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Have you been diagnosed with diabetes ?",
                              style: TextStyle(
                                fontSize: 20,color: Colors.white,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    Radio(
                                      value: 1,
                                      onChanged: (val) {
                                      },
                                      activeColor: Colors.blue,
                                    ),
                                    Text(
                                      'Yes',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Radio(
                                      value: 0,
                                      onChanged: (val) {
                                      },
                                      activeColor: Colors.blue,
                                    ),
                                    Text(
                                      'No',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),

                            SizedBox(
                              height: 25,
                            ),
                            RoundedButton(
                                buttonName: 'Submit'
                            ),
                            SizedBox(
                              height: 30,

                            ),
                          ],
                        )
                      ],
                    )
                ),
              )
          ),
        )
      ],

    );
  }



}