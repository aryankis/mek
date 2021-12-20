import 'package:flutter/material.dart';
import 'package:mek/drawer/Drawer.dart';
import 'package:mek/screen/only_pain.dart';
import 'package:mek/screen/pads.dart';
import 'package:localstorage/localstorage.dart';
import '../helpers/Database_Helper.dart';
import 'package:flutter/cupertino.dart';

class Spotting extends StatefulWidget {
  final String text;
  final String value;
  final String value2;
  final String value3;

  final String tamValue;
  final String tamValue2;
  final String tamValue3;

  final String ques3;
  final String ques4;
  final String ques5;
  final String ques7;
  final String ques8;
  final String ques6;

  Spotting(
      {Key key,
      @required this.text,
      this.value,
      this.value2,
      this.value3,
      this.tamValue,
      this.tamValue2,
      this.tamValue3,
      this.ques3,
      this.ques4,
      this.ques5,
      this.ques7,
      this.ques8,
      this.ques6})
      : super(key: key);

  _SpotttingState createState() => _SpotttingState(text, value, value2, value3,
      tamValue, tamValue2, tamValue3, ques3, ques4, ques5, ques7, ques8, ques6);
}

class _SpotttingState extends State<Spotting> {
  final dbHelper = DatabaseHelper.instance;
  LocalStorage q3 = new LocalStorage('q3');
  LocalStorage q4 = new LocalStorage('q4');
  LocalStorage q5 = new LocalStorage('q5');

  var orangeColor = Color.fromRGBO(255, 125, 38, 1.0);

  var btnColor = Color.fromRGBO(255, 125, 38, 1.0);
  var btnColor2 = Color.fromRGBO(255, 125, 38, 1.0);

  var btnColor3 = Color.fromRGBO(255, 125, 38, 1.0);
  var btnthree = Color.fromRGBO(255, 125, 38, 1.0);

  var btnColor4 = Color.fromRGBO(255, 125, 38, 1.0);
  var btnfour = Color.fromRGBO(255, 125, 38, 1.0);

  String text;
  String value;
  String value2;
  String value3;
  var date;
  LocalStorage storageDate = new LocalStorage('localstorage_date');

  final String tamValue;
  final String tamValue2;
  final String tamValue3;
  final String ques3;
  final String ques4;
  final String ques5;
  final String ques7;
  final String ques8;
  final String ques6;

  int spot3;
  int spot4;
  int spot5;

  _SpotttingState(
      this.text,
      this.value,
      this.value2,
      this.value3,
      this.tamValue,
      this.tamValue2,
      this.tamValue3,
      this.ques3,
      this.ques4,
      this.ques5,
      this.ques7,
      this.ques8,
      this.ques6);

  initState() {
    super.initState();
    date = storageDate.getItem("date");
    print("select calendar date");
    print(date);

    print("this.ques3");
    print("this.ques3" + this.ques3.toString());
    if (this.ques3 == null || this.ques3 == "null") {
      spot3 = 2;
    } else {
      spot3 = int.parse(this.ques3);
    }

    if (this.ques4 == null || this.ques4 == "null") {
      spot4 = 2;
    } else {
      spot4 = int.parse(this.ques4);
    }

    if (this.ques5 == null || this.ques5 == "null") {
      spot5 = 2;
    } else {
      spot5 = int.parse(this.ques5);
    }

  }

  // receive data from the FirstScreen as a parameter

  int first = 0;
  int sec = 0;
  int third = 0;

  int _currentIndex = 0;
  String textToSend;
  void _sendDataoSecondScreen(BuildContext context) {
    if(text == null){
      print("text is null");
      textToSend = "hll";
    }else{
      print("text is not null");
       textToSend = text;
    }

    print('text to send $textToSend');
    print('text ot send to pain via spoottng $ques7, $ques8');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Onlypain(
            text: textToSend,
            ques3: ques3,
            ques4: ques4,
            ques5: ques5,
            ques6: ques6,
            ques7: ques7,
            ques8: ques8,
          ),
        ));
  }

  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = text;
    print('text to send $textToSend');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Pads(
              text: textToSend,
              value: value,
              value2: value2,
              value3: value3,
              tamValue: tamValue,
              tamValue2: tamValue2,
              tamValue3: tamValue3,
              ques3: ques3,
              ques4: ques4,
              ques5: ques5,
              ques6: ques6,
              ques7: ques7,
              ques8: ques8,
             ),
        ));
  }

  _saveData() async {
    await q3.setItem('q3', spot3);
    await q4.setItem('q4', spot4);
    await q5.setItem('q5', spot5);
  }

  @override
  Widget build(BuildContext context) {
    _saveData();
    return WillPopScope(
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              endDrawerEnableOpenDragGesture: false,
              endDrawer: DrawerMenu(),
              appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back,color: Colors.black,),
                    onPressed: () => Navigator.pushNamed(context, '/home')
                    //  Navigator.of(context).pop(),
                    ),
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text('TOEVOEGEN',style: TextStyle(color: Colors.black),),
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Text(date??"",style: TextStyle(color: Colors.black)),
                                  /*Text(
                                    text.substring(0, 2),
                                  ),
                                  Text(
                                    text.substring(2, 5),
                                  ),*/
                                  SizedBox(height: 5),
                                  Container(
                                    color: Colors.grey,
                                    height: 500,
                                    width: 1,
                                  )
                                ],
                              )),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(40, 8, 40, 8),
                                  margin: EdgeInsets.fromLTRB(40, 20, 40, 10),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 216, 188, 1.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    ' Spotting ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 15, bottom: 15),
                                  margin: EdgeInsets.only(left: 15, right: 20),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 216, 188, 1.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    'Is vandaag de eerste dag van de menstruatie?',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  // alignment: Alignment.centerRight,
                                  // margin: EdgeInsets.only(left: 10),
                                  child: Row(
                                    //Row elements.....first day of peroid Q3
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                color: Colors.black, width: 1)),
                                        child: RaisedButton(
                                            color: spot3 == 2 ? orangeColor : spot3 == 0 ? orangeColor : Colors.blue,
                                            child: Text('JA',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            onPressed: () {
                                              setState(() {
                                                btnColor2 = Color.fromRGBO(255, 125, 38, 1.0);
                                                btnColor = Colors.blue;
                                                spot3 = 1;
                                                print("spot");
                                                print(spot3);

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
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                color: Colors.black, width: 1)),
                                        child: RaisedButton(
                                            color: spot3 == 2
                                                ? orangeColor
                                                : spot3 == 0
                                                    ? Colors.blue
                                                    : orangeColor,
                                            child: Text('NEE',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            onPressed: () {
                                              setState(() {
                                                btnColor2 = Colors.blue;
                                                btnColor = Color.fromRGBO(
                                                    255, 125, 38, 1.0);
                                                spot3 = 0;
                                                print("spot");
                                                print(spot3);
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                                  margin: EdgeInsets.only(left: 15, right: 20),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 216, 188, 1.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    'Heb je vandaag alleen last gehad van spotting?',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Container(
                                  // alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(left: 5, top: 4),
                                  child: Row(
                                    //Row elements..... only spotting Q4
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                color: Colors.black, width: 1)),
                                        child: RaisedButton(
                                            color: spot4 == 2
                                                ? orangeColor
                                                : spot4 == 0
                                                    ? orangeColor
                                                    : Colors.blue,
                                            child: Text('JA',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            onPressed: () {
                                              setState(() {
                                                btnColor3 = Colors.blue;
                                                btnthree = Color.fromRGBO(
                                                    255, 125, 38, 1.0);
                                                spot4 = 1;
                                                print("spot");
                                                print(spot4);
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
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                color: Colors.black, width: 1)),
                                        child: RaisedButton(
                                            color: spot4 == 2
                                                ? orangeColor
                                                : spot4 == 0
                                                    ? Colors.blue
                                                    : orangeColor,
                                            child: Text('NEE',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            onPressed: () {
                                              setState(() {
                                                spot4 = 0;
                                                btnColor3 = Color.fromRGBO(
                                                    255, 125, 38, 1.0);
                                                btnthree = Colors.blue;
                                                print("spot");
                                                print(spot4);
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
                                  // margin: EdgeInsets.only(left: 40,right: 40),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 216, 188, 1.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    'Heb je vandaag alleen pijn gehad (dus zonder bloedverlies)?',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Container(
                                  // alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(left: 5, top: 4),
                                  child: Row(
                                    //Row elements.....today only pain Q5
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                color: Colors.black, width: 1)),
                                        child: RaisedButton(
                                            color: spot5 == 2
                                                ? orangeColor
                                                : spot5 == 0
                                                    ? orangeColor
                                                    : Colors.blue,
                                            child: Text('JA',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            onPressed: () {
                                              setState(() {
                                                btnColor4 = Colors.blue;
                                                btnfour = Color.fromRGBO(
                                                    255, 125, 38, 1.0);
                                                spot5 = 1;
                                                print("spot");
                                                print(spot5);
                                              });
                                            }),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 130,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                color: Colors.black, width: 1)),
                                        child: RaisedButton(
                                            color: spot5 == 2
                                                ? orangeColor
                                                : spot5 == 0
                                                    ? Colors.blue
                                                    : orangeColor,
                                            child: Text('NEE',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            onPressed: () {
                                              setState(() {
                                                btnColor4 = Color.fromRGBO(
                                                    255, 125, 38, 1.0);
                                                btnfour = Colors.blue;
                                                spot5 = 0;
                                                print("spot");
                                                print(spot5);
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 120, top: 10),
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                            color: Colors.black, width: 1)),
                                    child: RaisedButton(
                                        color:Color.fromRGBO(255, 125, 38, 1.0),
                                        child: Text('VOLGENDE',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400)),
                                        onPressed: () {
                                          if (spot3 == 2 || spot4 == 2 || spot5 == 2) {
                                            return showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title: Text('U bent vergeten antwoord te geven op een van de vragen. Wilt u dat alsnog doen?'),
                                                      actions: <Widget>[
                                                        // FlatButton(onPressed: () => (){}, child: Text("Yes")),
                                                        TextButton(
                                                            onPressed: () => Navigator.pop(context, false),
                                                            child: Text("OK")),
                                                      ],
                                                    ));
                                          } else if (spot4 == 1 || spot5 == 1) {
                                            print("else if function call");
                                            _sendDataoSecondScreen(context);
                                          } else {
                                            print("else function call");
                                            _sendDataToSecondScreen(context);
                                            // Navigator.pushNamed(context, '/pads');
                                          }

                                          setState(() {});
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
                            // _sendDataToSecondScreen(context);
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
                                margin: EdgeInsets.only(left: 5, right: 5),
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
                                margin: EdgeInsets.only(left: 5, right: 15),
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
                        ),


                      ]),
                ),
              ),


              /*bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // _sendDataToSecondScreen(context);
                        },
                        child: Container(
                            width: 250,
                            margin: EdgeInsets.all(5),
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
                              margin: EdgeInsets.only(left: 5, right: 5),
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
                              margin: EdgeInsets.only(left: 5, right: 15),
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
                      ),
                    ]),
              ),*/
            ),
          ),
        ),
        onWillPop: () {
          Navigator.pushNamed(context, '/home');

          return Future.value(true);
        });
  }
}
