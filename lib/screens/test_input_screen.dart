// ignore_for_file: prefer_const_constructors, unused_element, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:heartmate_frontend/screens/prediction_result_screen.dart';
import 'package:heartmate_frontend/widgets/negative_card.dart';
import 'package:heartmate_frontend/widgets/postive_card.dart';
import 'package:heartmate_frontend/constants.dart';
import 'package:heartmate_frontend/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestInput extends StatefulWidget {
  final int userId;
  const TestInput({
    Key? key,
    required this.userId
    }) : super(key: key);

  @override
  State<TestInput> createState() => _TestInputState(userId);
}

class _TestInputState extends State<TestInput> {
  late int _age; //above 10
  late int _gender;
  late double _sysBP; //min = 50 and max 250
  late double _diaBP; //min = 30 and max 150
  late int _bpMeds; //
  late int _prevelantHyp; //radio
  late double _glucose; //min 20 max 500
  late int _diabetes; // 1 diabetes 0 not diabetes
  late double _totChol; // 90 to 700
  late double _bmi;
  int _userId ;

  _TestInputState(this._userId); // above 10 digits 2
  

  @override
  void initState() {
    set_gender(1);
    set_bpMeds(1);
    set_prevelantHyp(1);
    set_diabetes(1);
    super.initState();
  }

  set_gender(int val) {
    setState(() {
      _gender = val;
    });
  }

  set_bpMeds(int val) {
    setState(() {
      _bpMeds = val;
    });
  }

  set_prevelantHyp(int val) {
    setState(() {
      _prevelantHyp = val;
    });
  }

  set_diabetes(int val) {
    setState(() {
      _diabetes = val;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildAge() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Age'),
      keyboardType: TextInputType.number,
      maxLength: 2,
      validator: (value) {
        int? age = int.tryParse(value!);

        if (age == null) {
          return 'Age cannot be empty';
        } else if (age < 10) {
          return 'Age cannot be less than 20';
        }

        return null;
      },
      onSaved: (value) {
        _age = int.tryParse(value!)!;
      },
    );
  }

  Widget _buildGender() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Select Gender',
              style: TextStyle(
                fontSize: 16,
              ),
            )),
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: _gender,
              onChanged: (val) {
                set_gender(1);
              },
              activeColor: Color(0xFF083663),
            ),
            Text('Male'),
            SizedBox(
              width: 30,
            ),
            Radio(
              value: 0,
              groupValue: _gender,
              onChanged: (val) {
                set_gender(0);
              },
              activeColor: Color(0xFF083663),
            ),
            Text('Female'),
          ],
        )
      ],
    );
  }

  Widget _buildSysBP() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Systolic Blood Preassure'),
      keyboardType: TextInputType.number,
      validator: (value) {
        double? sysBP = double.tryParse(value!);

        if (sysBP == null) {
          return 'This field cannot be empty';
        } else if (sysBP < 50) {
          return 'This cannot be less than 50';
        } else if (sysBP > 250) {
          return 'This cannot be less than 250';
        }

        return null;
      },
      onSaved: (value) {
        _sysBP = double.tryParse(value!)!;
      },
    );
  }

  Widget _buildDiaBP() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Diastolic Blood Preassure'),
      keyboardType: TextInputType.number,
      validator: (value) {
        double? diaBP = double.tryParse(value!);

        if (diaBP == null) {
          return 'This field cannot be empty';
        } else if (diaBP < 50) {
          return 'This cannot be less than 50';
        } else if (diaBP > 150) {
          return 'This cannot be less than 150';
        }

        return null;
      },
      onSaved: (value) {
        _diaBP = double.tryParse(value!)!;
      },
    );
  }

  Widget _buildBPMeds() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Are you taking blood preassure medicine',
              style: TextStyle(
                fontSize: 16,
              ),
            )),
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: _bpMeds,
              onChanged: (val) {
                set_bpMeds(1);
              },
              activeColor: Color(0xFF083663),
            ),
            Text('Yes'),
            SizedBox(
              width: 30,
            ),
            Radio(
              value: 0,
              groupValue: _bpMeds,
              onChanged: (val) {
                set_bpMeds(0);
              },
              activeColor: Color(0xFF083663),
            ),
            Text('No'),
          ],
        )
      ],
    );
  }

  Widget _buildPrevelantHyp() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Have you been diagnosed with hypertension',
              style: TextStyle(
                fontSize: 16,
              ),
            )),
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: _prevelantHyp,
              onChanged: (val) {
                set_prevelantHyp(1);
              },
              activeColor: Color(0xFF083663),
            ),
            Text('Yes'),
            SizedBox(
              width: 30,
            ),
            Radio(
              value: 0,
              groupValue: _prevelantHyp,
              onChanged: (val) {
                set_prevelantHyp(0);
              },
              activeColor: Color(0xFF083663),
            ),
            Text('No'),
          ],
        )
      ],
    );
  }

  Widget _buildGlucose() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Gluscose'),
      keyboardType: TextInputType.number,
      validator: (value) {
        double? glucose = double.tryParse(value!);

        if (glucose == null) {
          return 'This field cannot be empty';
        } else if (glucose < 20) {
          return 'This cannot be less than 20';
        } else if (glucose > 500) {
          return 'This cannot be less than 500';
        }

        return null;
      },
      onSaved: (value) {
        _glucose = double.tryParse(value!)!;
      },
    );
  }

  Widget _buildDiabetes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Have you been diagnosed with diabetes',
              style: TextStyle(
                fontSize: 16,
              ),
            )),
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: _diabetes,
              onChanged: (val) {
                set_diabetes(1);
              },
              activeColor: Color(0xFF083663),
            ),
            Text('Yes'),
            SizedBox(
              width: 30,
            ),
            Radio(
              value: 0,
              groupValue: _diabetes,
              onChanged: (val) {
                set_diabetes(0);
              },
              activeColor: Color(0xFF083663),
            ),
            Text('No'),
          ],
        )
      ],
    );
  }

  Widget _buildTotChol() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Total Cholestrol'),
      keyboardType: TextInputType.number,
      validator: (value) {
        double? cholestrol = double.tryParse(value!);

        if (cholestrol == null) {
          return 'This field cannot be empty';
        } else if (cholestrol < 90) {
          return 'This cannot be less than 90';
        } else if (cholestrol > 700) {
          return 'This cannot be less than 700';
        }

        return null;
      },
      onSaved: (value) {
        _totChol = double.tryParse(value!)!;
      },
    );
  }

  Widget _buildBMI() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'BMI'),
      keyboardType: TextInputType.number,
      validator: (value) {
        double? bmi = double.tryParse(value!);

        if (bmi == null) {
          return 'This field cannot be empty';
        } else if (bmi < 10) {
          return 'This cannot be less than 90';
        }

        return null;
      },
      onSaved: (value) {
        _bmi = double.tryParse(value!)!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF083663),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/icons/note.png",
                      height: size.height * 0.2,
                      width: size.width * 0.2,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(bottom: 50),
                  child: Text(
                    'Input Your Data',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                  ),
                ),
                _buildAge(),
                _buildSysBP(),
                SizedBox(
                  height: 20,
                ),
                _buildDiaBP(),
                SizedBox(
                  height: 20,
                ),
                _buildGlucose(),
                SizedBox(
                  height: 20,
                ),
                _buildTotChol(),
                SizedBox(
                  height: 20,
                ),
                _buildBMI(),

                _buildGender(),
                Container(
                  padding: EdgeInsets.all(1),
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                _buildBPMeds(),
                Container(
                  padding: EdgeInsets.all(1),
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                _buildPrevelantHyp(),
                Container(
                  padding: EdgeInsets.all(1),
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                _buildDiabetes(),
                Container(
                  padding: EdgeInsets.all(1),
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                  width: 200,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      _formKey.currentState!.save();

                      print(_age);
                      print(_gender);
                      print(_sysBP);
                      print(_diaBP);
                      print(_prevelantHyp);
                      print(_glucose);
                      print(_totChol);
                      print(_bmi);

                      var now = DateTime.now();

                    print(now.year); // 1989
                    print(now.month); // 11
                    print(now.day); // 9

                    var date = now.year.toString() +
                        "/" +
                        now.month.toString() +
                        "/" +
                        now.day.toString();

                      final url = 'http://10.0.2.2:5000//prediction';

                      var dict = {};
                      //
                      dict["userId"] = _userId;
                      dict["date"] = date;
                      dict["age"] = _age;
                      dict["sysBP"] = _sysBP;
                      dict["prevelantHyp"] = _prevelantHyp;
                      dict["diaBP"] = _diaBP;
                      dict["glucose"] = _glucose;
                      dict["gender"] = _gender;
                      dict["diabetes"] = _diabetes;
                      dict["totChol"] = _totChol;
                      dict["bpMeds"] = _bpMeds;
                      dict["bmi"] = _bmi;

                      final response = await http.post(
                            Uri.parse(url),
                            body: json.encode(
                              {"userInfo": dict}));
                              
                      var decoded = json.decode(response.body);
                      Widget resultCard;
                      if(decoded["result"] == 'Positive'){
                        resultCard = PositiveCard();
                      }else{
                        resultCard = NegativeCard();
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (
                                  Prediction(
                                      resultCard: resultCard,))
                          )
                      );
                    },
                    color: Color(0xFF083663),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text("Submit",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
