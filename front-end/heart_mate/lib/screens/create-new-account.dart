import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heart_mate/screens/login-screen.dart';
import 'package:heart_mate/pallette.dart';

class CreateNewAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Backgroundimage(image: 'assets/image1.jpg'),
        Scaffold(
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
                      Positioned(
                        top: size.height * 0.08,
                        left: size.width * 0.56,
                        child:
                          Container(
                            height: size.width * 0.1,
                            width: size.width * 0.1,
                            decoration: BoxDecoration(
                              color: kBlue,
                              shape: BoxShape.circle,
                              border: Border.all(color: kWhite,
                              width: 2)
                            ),
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: kWhite,
                            ),
                          ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  Column(
                    children: [
                      TextInputField(
                          icon: FontAwesomeIcons.user,
                          hint: 'UserName',
                          inputType: TextInputType.name,
                          inputAction: TextInputAction.next,
                      ),
                      TextInputField(
                          icon: FontAwesomeIcons.envelope,
                          hint: 'Email',
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                      ),
                      PasswordInput(
                          icon: FontAwesomeIcons.unlock,
                          hint: 'Password',
                          inputAction: TextInputAction.next,
                      ),
                      PasswordInput(
                        icon: FontAwesomeIcons.lock,
                        hint: 'Confirm Password',
                        inputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      RoundedButton(buttonName: 'SignUp'),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                      Text(
                        'Already have an account?',
                        style: kBodyText,
                      ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, '/');
                            },
                          child: Text(
                            'Login',
                            style: kBodyText.copyWith(
                                color: kBlue,
                                fontWeight: FontWeight.bold),
                          ),
                          )
                    ],
                  )
                ],
              )
            ],
            )
          ),
        )
        )
      ],

    );
  }



}