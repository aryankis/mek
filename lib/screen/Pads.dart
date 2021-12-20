import 'package:flutter/material.dart';
import 'package:mek/drawer/Drawer.dart';
import 'package:mek/helpers/Database_Helper.dart';
import 'package:mek/screen/only_pain.dart';
import 'package:mek/screen/spotting.dart';
import 'package:localstorage/localstorage.dart';

class Pads extends StatefulWidget {
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

  Pads(
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

  @override
  _PadsState createState() => _PadsState(text, value, value2, value3, tamValue,
      tamValue2, tamValue3, ques7, ques8, ques6, ques3, ques4, ques5);
}

class _PadsState extends State<Pads> {
  final dbHelper = DatabaseHelper.instance;
  LocalStorage tam1 = new LocalStorage('tam1');
  LocalStorage tam2 = new LocalStorage('tam2');
  LocalStorage tam3 = new LocalStorage('tam3');
  LocalStorage pad1 = new LocalStorage('pad1');
  LocalStorage pad2 = new LocalStorage('pad2');
  LocalStorage pad3 = new LocalStorage('pad3');

  String text;
  String value;
  String value2;
  String value3;

  final String tamValue;
  final String tamValue2;
  final String tamValue3;
  final String ques7;
  final String ques8;
  final String ques6;

  final String ques3;
  final String ques4;
  final String ques5;

  _PadsState(
      this.text,
      this.value,
      this.value2,
      this.value3,
      this.tamValue,
      this.tamValue2,
      this.tamValue3,
      this.ques7,
      this.ques8,
      this.ques6,
      this.ques3,
      this.ques4,
      this.ques5);

  int val;
  int val2;
  int val3;

  int valone;
  int valtwo;
  int valthree;
  var date;
  LocalStorage storageDate = new LocalStorage('localstorage_date');

  @override
  void initState() {
    super.initState();
    date = storageDate.getItem("date");
    print("select calendar date");
    print(date);

    print("value1");
    print(this.value);
    print("value2");
    print(this.value2);
    print("value3");
    print(this.value3);
    print("tam value");
    print(this.tamValue);
    print("tam Value2");
    print(this.tamValue2);
    print("tam Value3");
    print(this.tamValue3);


    if (this.value == 'null') {
      val = 0;
    } else if(this.value == null){
      print("else if");
      val = 0;
    }else {
      val = int.parse(this.value);
    }

    if (this.value2 == 'null') {
      val2 = 0;
    } else if(this.value2 == null){
      print("else if");
      val2 = 0;
    } else {
      val2 = int.parse(this.value2);
    }

    if (this.value3 == 'null') {
      val3 = 0;
    } else if(this.value3 == null){
      print("else if");
      val3 = 0;
    }else {
      val3 = int.parse(this.value3);
    }

    if (this.tamValue == 'null') {
      valone = 0;
    } else if(this.tamValue == null){
      print("else if");
      valone = 0;
    }else {
      valone = int.parse(this.tamValue);
    }

    if (this.tamValue2 == 'null') {
      valtwo = 0;
    }else if (this.tamValue2 == null) {
      valtwo = 0;
    } else {
      valtwo = int.parse(this.tamValue2);
    }

    if (this.tamValue3 == 'null') {
      valthree = 0;
    } else if (this.tamValue3 == null) {
      valthree = 0;
    }else {
      valthree = int.parse(this.tamValue3);
    }


  }

  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = text;
    print('text to send $textToSend');
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

                )));
  }

  void _sendDataToSpottingScreen(BuildContext context) {
    String textToSend = text;
    print('text to send $textToSend');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Spotting(text: textToSend, ques3: ques3, ques4: ques4, ques5: ques5),),);
  }

  int _currentIndex = 0;
  var value_ist = 0;
  var value_sec = 0;
  var value_third = 0;
  var tam_ist = 0;
  var tam_sec = 0;
  var tam_third = 0;

  @override
  Widget build(BuildContext context) {
    pad1.setItem('pad1', val);
    pad2.setItem('pad2', val2);
    pad3.setItem('pad3', val3);
    tam1.setItem('tam1', valone);
    tam2.setItem('tam2', valtwo);
    tam3.setItem('tam3', valthree);

    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                endDrawerEnableOpenDragGesture: false,
                endDrawer: DrawerMenu(),
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

                //resizeToAvoidBottomPadding: false,
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  backgroundColor: Colors.white,
                  title: Center(
                    child: Text('TOEVOEGEN',style: TextStyle(color: Colors.black),),

                  ),
                ),
                body: SingleChildScrollView(
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 5, top: 20),
                            child: Column(
                              children: [
                                Text(date??"",style: TextStyle(color: Colors.black)),
                                /*Text(text.substring(0, 2)),
                                Text(text.substring(2, 5)),*/
                                SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  height: 570,
                                  width: 1,
                                  color: Color.fromRGBO(217, 217, 217, 1.0),
                                )
                              ],
                            )),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Container(
                                  width: 266,
                                  padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                                  margin: EdgeInsets.all(10),
                                  /*padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                                  margin: EdgeInsets.fromLTRB(40, 20, 40, 10),*/
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 212, 184, 1.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Text(
                                      ' Bloedverlies',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                 margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 200,
                                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                       // margin: EdgeInsets.only(bottom: 20, right: 10,),
                                        // color: Colors.orange[100],
                                        decoration: BoxDecoration(color: Color.fromRGBO(255, 212, 184, 1.0),
                                            borderRadius: BorderRadius.circular(20)),
                                        child: RotatedBox(
                                          quarterTurns: 3,
                                          child: Center(
                                              child: Text('TAMPONS',
                                                  style: TextStyle(
                                                      letterSpacing: 2,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        children: <Widget>[
                                          //Start Tampons Counts
                                          Container(
                                            padding: EdgeInsets.only(right: 5),
                                            width: MediaQuery.of(context).size.width/1.5,
                                            child: Card(
                                              child: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      'image/asset/tam1.jpg',
                                                      width: 55,
                                                      height: 55,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      color: Color.fromRGBO(
                                                          255, 125, 38, 1.0),
                                                      child: IconButton(
                                                        color: Colors.white,
                                                        icon: Center(
                                                            child: Icon(
                                                          Icons.remove,
                                                        )),
                                                        onPressed: () {
                                                          if (valone != 0) {
                                                            setState(() => valone--);
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(4),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      color: Colors.orange[100],
                                                      child: Text(
                                                        valone.toString(),
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                    Container(
                                                      color: Color.fromRGBO(
                                                          255, 125, 38, 1.0),
                                                      child: IconButton(
                                                        color: Colors.white,
                                                        icon: Icon(Icons.add),
                                                        onPressed: () {
                                                          setState(
                                                              () => valone++);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),

                                          Container(
                                            padding: EdgeInsets.only(right: 5),
                                            width:  MediaQuery.of(context).size.width/1.5,
                                            child: Card(
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      'image/asset/tam2.png',
                                                      width: 55,
                                                      height: 55,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      color: Color.fromRGBO(
                                                          255, 125, 38, 1.0),
                                                      child: IconButton(
                                                        color: Colors.white,
                                                        icon: Icon(Icons.remove),
                                                        onPressed: () {
                                                          if (valtwo != 0) {
                                                            setState(() => valtwo--);
                                                          }
                                                          ;
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(4),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      color: Colors.orange[100],
                                                      child: Text(
                                                        valtwo.toString(),
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                    Container(
                                                      color: Color.fromRGBO(
                                                          255, 125, 38, 1.0),
                                                      child: IconButton(
                                                        color: Colors.white,
                                                        icon: Icon(Icons.add),
                                                        onPressed: () {
                                                          setState(
                                                              () => valtwo++);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),

                                          Container(
                                            padding: EdgeInsets.only(right: 5),
                                            width: MediaQuery.of(context).size.width/1.5,
                                            child: Card(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      'image/asset/tam3.png',
                                                      height: 55,
                                                      width: 55,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      color: Color.fromRGBO(
                                                          255, 125, 38, 1.0),
                                                      child: IconButton(
                                                        color: Colors.white,
                                                        icon:
                                                            Icon(Icons.remove),
                                                        onPressed: () {
                                                          if (valthree != 0) {
                                                            setState(() =>
                                                                valthree--);
                                                          }
                                                          ;
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(4),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      color: Colors.orange[100],
                                                      child: Text(
                                                        valthree.toString(),
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                    Container(
                                                      color: Color.fromRGBO(
                                                          255, 125, 38, 1.0),
                                                      child: IconButton(
                                                        icon: Icon(Icons.add,
                                                            color:
                                                                Colors.white),
                                                        onPressed: () {
                                                          setState(
                                                              () => valthree++);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                                    // alignment: Alignment.center,
                                    //margin: EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 200,
                                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                        //  margin: EdgeInsets.only(bottom: 20, right: 10),
                                          // color: Colors.orange[100],
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  255, 212, 184, 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: RotatedBox(
                                            quarterTurns: 3,
                                            child: Center(
                                                child: Text('VERBANDEN',
                                                    style: TextStyle(
                                                        letterSpacing: 2,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(right: 5),
                                              width: MediaQuery.of(context).size.width/1.5,
                                              child: Card(
                                                // elevation: 5,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: <Widget>[
                                                      Image.asset(
                                                        'image/asset/padone.png',
                                                        width: 55,
                                                        height: 55,
                                                      ),
                                                      SizedBox(
                                                        width: 2,
                                                      ),
                                                      Container(
                                                        // margin: EdgeInsets.only(ri),
                                                        color: Color.fromRGBO(
                                                            255, 125, 38, 1.0),
                                                        child: IconButton(
                                                          icon: new Icon(
                                                              Icons.remove,
                                                              color:
                                                                  Colors.white),
                                                          onPressed: () {
                                                            if (val != 0) {
                                                              print(
                                                                  'value is $val');
                                                              setState(
                                                                  () => val--);
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(4),
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        color:
                                                            Colors.orange[100],
                                                        child: Text(
                                                          val.toString(),
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                      Container(
                                                        color: Color.fromRGBO(
                                                            255, 125, 38, 1.0),
                                                        child: IconButton(
                                                          icon: Icon(Icons.add,
                                                              color:
                                                                  Colors.white),
                                                          onPressed: () {
                                                            if (val < 99) {
                                                              setState(
                                                                  () => val++);
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),

                                            Container(
                                              padding:
                                                  EdgeInsets.only(right: 5),
                                              width: MediaQuery.of(context).size.width/1.5,
                                              child: Card(
                                                // elevation: 8,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: <Widget>[
                                                      Image.asset(
                                                        'image/asset/padtwo.png',
                                                        width: 55,
                                                        height: 55,
                                                      ),
                                                      SizedBox(
                                                        width: 2,
                                                      ),
                                                      Container(
                                                        color: Color.fromRGBO(
                                                            255, 125, 38, 1.0),
                                                        child: IconButton(
                                                          icon: Icon(
                                                              Icons.remove,
                                                              color:
                                                                  Colors.white),
                                                          onPressed: () {
                                                            if (val2 != 0) {
                                                              setState(
                                                                  () => val2--);
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(4),
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        color:
                                                            Colors.orange[100],
                                                        child: Text(
                                                          val2.toString(),
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                      Container(
                                                        color: Color.fromRGBO(
                                                            255, 125, 38, 1.0),
                                                        child: IconButton(
                                                          icon: Icon(Icons.add,
                                                              color:
                                                                  Colors.white),
                                                          onPressed: () {
                                                            if (value_sec <
                                                                99) {
                                                              setState(
                                                                  () => val2++);
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(right: 5),
                                              width: MediaQuery.of(context).size.width/1.5,
                                              child: Card(
                                                //
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: <Widget>[
                                                      Image.asset(
                                                        'image/asset/padthree.png',
                                                        width: 55,
                                                        height: 55,
                                                      ),
                                                      SizedBox(
                                                        width: 2,
                                                      ),
                                                      Container(
                                                        color: Color.fromRGBO(
                                                            255, 125, 38, 1.0),
                                                        child: IconButton(
                                                          icon: Icon(
                                                              Icons.remove,
                                                              color:
                                                                  Colors.white),
                                                          onPressed: () {
                                                            if (val3 != 0) {
                                                              setState(
                                                                  () => val3--);
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(4),
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        color:
                                                            Colors.orange[100],
                                                        child: Text(
                                                          val3.toString(),
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                      Container(
                                                        color: Color.fromRGBO(
                                                            255, 125, 38, 1.0),
                                                        child: IconButton(
                                                          icon: Icon(Icons.add,
                                                              color:
                                                                  Colors.white),
                                                          onPressed: () {
                                                            if (val3 < 99) {
                                                              setState(
                                                                  () => val3++);
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.45,top: 5),
                               // margin: EdgeInsets.only(left: 145, top: 5),
                                child: Container(
                                  height: 40,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: RaisedButton(
                                      color: Color.fromRGBO(255, 125, 38, 1.0),
                                      child: Text('VOLGENDE',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20)),
                                      onPressed: () {
                                        _sendDataToSecondScreen(context);
                                      }),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
