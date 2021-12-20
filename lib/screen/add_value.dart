import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mek/drawer/Drawer.dart';
import 'package:mek/screen/spotting.dart';
import 'package:localstorage/localstorage.dart';
import '../helpers/Database_Helper.dart';

int seven;
int eight;

LocalStorage bloodpbac = new LocalStorage('bloodpbac');
LocalStorage score = new LocalStorage('score');
LocalStorage pad1 = new LocalStorage('pad1');
LocalStorage pad2 = new LocalStorage('pad2');
LocalStorage pad3 = new LocalStorage('pad3');
LocalStorage tam1 = new LocalStorage('tam1');
LocalStorage tam2 = new LocalStorage('tam2');
LocalStorage tam3 = new LocalStorage('tam3');
LocalStorage userId = new LocalStorage('UserId');
LocalStorage studyNumber = new LocalStorage('UserstudyNumber');
LocalStorage dob = new LocalStorage('Userdob');
LocalStorage current_date = new LocalStorage('current_date');
LocalStorage current_mon = new LocalStorage('current_mon');
LocalStorage selected_date = new LocalStorage('selected_date');
LocalStorage q3 = new LocalStorage('q3');
LocalStorage q4 = new LocalStorage('q4');
LocalStorage q5 = new LocalStorage('q5');
LocalStorage q7 = new LocalStorage('q7');
LocalStorage q8 = new LocalStorage('q8');

Future<bool> finaldata() async {
  var study_number = studyNumber.getItem('UserstudyNumber').toString();
  var user_dob = dob.getItem('Userdob').toString();
  print(study_number + " " + user_dob);
  print("dob  $user_dob");

  var creationdate = DateTime.now().toString().substring(0, 10);
  print(creationdate);

  // var creationDate = current_date.getItem('current_date').toString();
  // print("creation $creationDate");

  var reportedDate = selected_date.getItem('selected_date').toString();
  print("report $reportedDate");
  var question1a = pad1.getItem('pad1') != null ? pad1.getItem('pad1').toString() : '0';
  print("pad1 $question1a");
  var question1b = pad2.getItem('pad2') != null ? pad2.getItem('pad2').toString() : '0';
  print("pad2 $question1a");
  var question1c = pad3.getItem('pad3') != null ? pad3.getItem('pad3').toString() : '0';
  print("pad3 $question1c");
  var question2a = tam1.getItem('tam1') != null ? tam1.getItem('tam1').toString() : '0';
  print("tam1 $question2a");
  var question2b = tam2.getItem('tam2') != null ? tam2.getItem('tam2').toString() : '0';
  print("tam2 $question2b");
  var question2c = tam3.getItem('tam3') != null ? tam3.getItem('tam3').toString() : '0';
  print("tam3 $question2c");
  var question3 = q3.getItem('q3').toString();
  var question4 = q4.getItem('q4').toString();
  var question5 = q5.getItem('q5').toString();
  print("q3  $question3");
  print("q4  $question4");
  print("q5  $question5");
  var question6 = score.getItem('score').toString();
  print('Score is $question6');
  var question7 = q7.getItem('q7').toString();
  print('value of 7 is $question7');
  var question8 = q8.getItem('q8').toString();
  print('value of 8 is $question8');
  // int que3 = int.tryParse(question3);
  int padOne = int.tryParse(question1a);
  int padTwo = int.tryParse(question1b);
  int padThree = int.tryParse(question1c);
  int tamponOne = int.tryParse(question2a);
  int tamponTwo = int.tryParse(question2b);
  int tamponThree = int.tryParse(question2c);
  var pbac = (padOne * 1) + (padTwo * 5) + (padThree * 20) + (tamponOne * 1) + (tamponTwo * 5) + (tamponThree * 10);

  var pbacS = pbac.toString();
  print("pbac $pbacS");

  print("pbac $pbacS");
  print("studyNumber");
  print(study_number);
  print("dob");
  print(user_dob);
  print("reported");
  print(reportedDate);
  print("question 1a");
  print(question1a);
  print("question 1b");
  print(question1b);
  print("question 1c");
  print(question1c);
  print("question 2a");
  print(question2a);
  print("question 2b");
  print(question2b);
  print("question 2c");
  print(question2c);
  print("question3");
  print(question3);
  print("question4");
  print(question4);
  print("question5");
  print(question5);
  print("question6");
  print(question6);
  print("question7");
  print(question7);
  print("question8");
  print(question8);
  print("creationdate");
  print(creationdate);
  print('bloodloss');
  print(pbacS);


  if (study_number != null) {
    print("in con $study_number");
    await http.post('https://mek.researchsurvey.nl/pbac/create', body: {
      'studyNumber': study_number,
      'dob': user_dob,
      'question1a': question1a,
      'question1b': question1b,
      'question1c': question1c,
      'question2a': question2a,
      'question2b': question2b,
      'question2c': question2c,
      'question3': question3,
      'question4': question4,
      'question5': question5,
      'question6': question6,
      'question7': question7,
      'question8': question8,
      'isMonth': "0",
      'status': "Active",
      'reportedDate': reportedDate,
      'creationDate': creationdate,
      'bloodloss': pbacS,
    }, headers: {
      "content-type": "application/x-www-form-urlencoded",
    }).then((response) {
      if (response.statusCode == 200) {
        Map Data = jsonDecode(response.body);
        print(Data);
        return true;
      }
    });
  }
  //showInSnackBar("Study Number is $study_number");
  print("after con $study_number");
  if (study_number == null) {
    // showInSnackBar("Enter Study Number");
    return false;
  }
}

class Value extends StatefulWidget {
  final String text;
  final String ques7;
  final String ques8;
  final String ques3;
  final String ques4;
  final String ques5;

  Value(
      {Key key,
      @required this.text,
      this.ques7,
      this.ques8,
      this.ques3,
      this.ques4,
      this.ques5})
      : super(key: key);

  ValueState createState() =>
      ValueState(text, ques7, ques8, ques3, ques4, ques5);
}

class ValueState extends State<Value> {
  final dbHelper = DatabaseHelper.instance;
  final String text;
  final String ques7;
  final String ques8;
  final String ques3;
  final String ques4;
  final String ques5;

  ValueState(
      this.text, this.ques7, this.ques8, this.ques3, this.ques4, this.ques5);

  var orangeColor = Color.fromRGBO(255, 125, 38, 1.0);

  var btnColor = Color.fromRGBO(255, 125, 38, 1.0);
  var btncolor = Color.fromRGBO(255, 125, 38, 1.0);

  var btnColor2 = Color.fromRGBO(255, 125, 38, 1.0);
  var btncolortwo = Color.fromRGBO(255, 125, 38, 1.0);
  int _currentIndex = 0;

  int add7 = 2;
  int add8 = 2;
  var date;
  LocalStorage storageDate = new LocalStorage('localstorage_date');


  void initState() {
    super.initState();
    date = storageDate.getItem("date");
    print("select calendar date");
    print(date);

    seven = 0;
    eight = 0;

    try {
      add7 = int.parse(this.ques7);
    } catch (error) {
      print(error);
    }
    try {
      add8 = int.parse(ques8);
    } catch (error) {
      print(error);
    }


  }

  void _sendDataToSpottingScreen(BuildContext context) {
    String textToSend = text;
    print('text to send $textToSend');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Spotting(
            text: textToSend,
            ques3: ques3,
            ques4: ques4,
            ques5: ques5,
          ),
        ));
  }

  _saveData() async {
    await q7.setItem('q7', add7);
    await q8.setItem('q8', add8);
  }

  @override
  Widget build(BuildContext context) {
    _saveData();

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          endDrawerEnableOpenDragGesture: false,
          endDrawer: DrawerMenu(),
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text('TOEVOEGEN',style: TextStyle(color: Colors.black),),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 15, left: 5),
                        child: Column(
                          children: [
                            Text(date??"",style: TextStyle(color: Colors.black)),

                            /*Text(
                              text.substring(0, 2),
                            ),
                            Text(
                              text.substring(2, 5),
                            ),*/
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 540,
                              width: 1,
                              color: Color.fromRGBO(217, 217, 217, 1.0),
                            )
                          ],
                        )),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(40, 5, 40, 5),
                            margin: EdgeInsets.fromLTRB(40, 20, 40, 10),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 212, 184, 1.0),
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              'Dagelijkse invloed',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 15),
                            margin: EdgeInsets.only(left: 15, right: 20),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(254, 217, 191, 1.0),
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              'Heb je vandaag pijnstillers gebruikt?',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: Row(
                              //Row elements.....first day of peroid Q3
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: RaisedButton(
                                      color: add7 == 2
                                          ? orangeColor
                                          : add7 == 0
                                              ? orangeColor
                                              : Colors.blue,
                                      child: Text('JA',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400)),
                                      onPressed: () {
                                        setState(() {
                                          btnColor = Colors.blue;
                                          btncolor =
                                              Color.fromRGBO(255, 125, 38, 1.0);
                                          add7 = 1;
                                        });
                                      }),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: RaisedButton(
                                      color: add7 == 2
                                          ? orangeColor
                                          : add7 == 0
                                              ? Colors.blue
                                              : orangeColor,
                                      child: Text('NEE',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400)),
                                      onPressed: () {
                                        setState(() {
                                          btnColor =
                                              Color.fromRGBO(255, 125, 38, 1.0);
                                          btncolor = Colors.blue;
                                          add7 = 0;
                                        });
                                      }),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 15),
                            margin: EdgeInsets.only(left: 15, right: 20),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 212, 184, 1.0),
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              'Hebben je menstruatie klachten je vandaag belemmerd in je dagelijkse activiteiten?',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              //Row elements.....first day of peroid Q3
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: RaisedButton(
                                      color: add8 == 2
                                          ? orangeColor
                                          : add8 == 0
                                              ? orangeColor
                                              : Colors.blue,
                                      child: Text('JA',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400)),
                                      onPressed: () {
                                        setState(() {
                                          btnColor2 = Colors.blue;
                                          btncolortwo =
                                              Color.fromRGBO(255, 125, 38, 1.0);
                                          add8 = 1;
                                        });
                                      }),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: RaisedButton(
                                      color: add8 == 2
                                          ? orangeColor
                                          : add8 == 0
                                              ? Colors.blue
                                              : orangeColor,
                                      child: Text('NEE',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400)),
                                      onPressed: () {
                                        setState(() {
                                          btnColor2 =
                                              Color.fromRGBO(255, 125, 38, 1.0);
                                          btncolortwo = Colors.blue;
                                          add8 = 0;
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                left: 120, top: 20, bottom: 150),
                            child: Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: RaisedButton(
                                  color: Color.fromRGBO(255, 125, 38, 1.0),
                                  child: Text('OPSLAAN',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400)),
                                  onPressed: () async {
                                    print('the value is $seven');
                                    if (add7 == 2 || add8 == 2) {
                                      return showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title:
                                                    Text('selecteer waarden'),
                                                actions: <Widget>[
                                                  // FlatButton(onPressed: () => (){}, child: Text("Yes")),
                                                  TextButton(
                                                      onPressed: () => Navigator.pop(context, false),
                                                      child: Text("OK")),
                                                ],
                                              ));
                                    }
                                    setState(() {
                                      finaldata().then((staus) => {
                                            print(staus),
                                            Navigator.pushReplacementNamed(
                                                context, '/home')
                                          });
                                    });
                                  }),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _sendDataToSpottingScreen(context);
                        },
                        child: Container(
                            width: 250,
                            margin: EdgeInsets.only(left: 5),
                            child: Image.asset(
                              'image/asset/add.png',
                              height: 50,
                              width: 150,
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              child: Image.asset(
                                'image/asset/new_home.png',
                                height: MediaQuery.of(context).devicePixelRatio/0.08,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/home');
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              child: Image.asset(
                                'image/asset/new_leg.png',
                                height: MediaQuery.of(context).devicePixelRatio/0.08,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/legend');
                            },
                          ),
                        ],
                      )
                    ])),
          ),
        ),
      ),
    );
  }
}
