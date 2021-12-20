import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:mek/helpers/global_variables.dart' as globals;
import 'package:mek/helpers/global_variables.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mek/screen/login.dart';
import 'confirm.dart';
import 'home_screen.dart';
import '../helpers/Database_Helper.dart';


void bh(context) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    print("Connected to Mobile Network");
  } else if (connectivityResult == ConnectivityResult.wifi) {
    print("Connected to WiFi");
  } else {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Connectivity ",
                style: TextStyle(fontSize: 15),
              ),
            ),
            actions: <Widget>[
              Center(
                  child: Text(
                "Please Check your Internet Connection.",
                style: TextStyle(fontSize: 15),
              )),
              TextButton(
                child: Text(
                  'ok',
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => new _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final dbHelper = DatabaseHelper.instance;
  TextEditingController pinNumber = new TextEditingController();
  LocalStorage dob = new LocalStorage('Userdob');

  bool hasKey;
  var userKeyValue;
  bool pincode;

  void showInSnackBar(String message) {
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void initState() {
    var db = dob.getItem('Userdob');
    print('dashboar db');
    super.initState();
    // checkKeys();
    checkKey();
    // setTimer();
    bh(context);
  }

  navigationPage() async {
    print('pincod is $pincode');
    if (pincode == false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    } else {

     // null;
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => DashboardScreen()));
    }
  }

  setTimer() async {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, navigationPage);
  }

  Future<bool> checkKey() async {
    List checkPin = await dbHelper.queryRowCountWhere('settings',
        'meta_key=? ANd meta_value=?', ['pin_code', pinNumber.text]);
    print(checkPin);
    if (checkPin.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> checkKeys() async {
    List checkPin = await dbHelper.queryRowCountWhere(
        'settings', 'meta_key=? ANd meta_value<>""', ['pin_code']);
    print('chekcpin is $checkPin');
    if (checkPin.length == 0) {
      pincode = false;
      return pincode;
    } else {
      pincode = true;
      return pincode;
    }
  }

  void sendDataNav(BuildContext context) {
    String textToSend = pinNumber.text;

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Confirm(text: textToSend),
        ));
  }

  var study_no;
  var select_mon;
  LocalStorage mon = LocalStorage('mon');
  LocalStorage studyNumber = LocalStorage('UserstudyNumber');
  void start(context) async {
    select_mon = DateTime.now().toString().substring(5, 7);
    print("study number $study_no");
    if (study_no == null) {
      print("in $study_no");
      Future.delayed(Duration.zero, () {
        Navigator.pushNamed(context, '/setting');
      });
    } else {
      print(select_mon);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(stu: study_no, mon: select_mon),
          ));
    }
  }

  /* submitPin() async {
    if (pinNumber.text.length < 1) {
      showInSnackBar("Enter Pin");
      print('invalid');
      return;
    }

    userKeyValue = await pin.getItem('pin');
    if (userKeyValue == null) {
      hasKey = false;
    } else {
      hasKey = true;
    }
    if (hasKey) {
      if (userKeyValue != pinNumber.text) {
        // show error message
        showInSnackBar("Wrong Pin");
        print('not valid');
      } else {
        print('valid');
        study_no = studyNumber.getItem('UserstudyNumber').toString();
        start(context);
        showInSnackBar("Sucessful");
      }
    } else {
      if (pinNumber.text.length != 4) {
        showInSnackBar("Enter Pin of 4 Numbers");
        // show error message of length
        print('hello');
      } else {
        setState(() {
          sendDataNav(context);
        });

        // userKey.setItem('userKey', pinNumber.text);
      }
    }
  } */

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.white,
       //   resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: false,
          key: scaffoldKey,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(50),
                    child: Image.asset(
                      'image/asset/logo.jpg',
                      height: 100,
                      width: 100,
                    )),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                obscureText: true,
                                controller: pinNumber,
                                style: new TextStyle(
                                  fontSize: 15.0,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  border: UnderlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: globals.secondaryColor)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: globals.primaryColor)),
                                  //icon: Icon(Icons.calendar_today,),
                                  hintText: 'PIN',
                                  suffixStyle: TextStyle(fontSize: 10),
                                  labelText: 'Log in met uw pincode',
                                  labelStyle: TextStyle(fontSize: 20)
                                ),

                                // Navigator.pushNamed(context,  '/afterCalender')
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                autofocus: true,
                                onSubmitted: (ss) async {
                                  checkKey().then((value) {
                                    if (value == true) {
                                      Navigator.pushNamed(context, '/home');
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 70),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: orgColor),
                              onPressed: () async {
                                checkKey().then((value) {
                                  print(value);
                                  if (value == true) {
                                    Navigator.pushNamed(context, '/home');
                                  }else{
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Center(
                                              child: Text(
                                                "",
                                              ),
                                            ),
                                            actions: <Widget>[
                                              Center(
                                                  child: Text(
                                                    "Uw pincode is onjuist",
                                                    style: TextStyle(fontSize: 15),
                                                  )),
                                              TextButton(
                                                child: Text(
                                                  'ok',
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  }
                                });
                              },
                           //   color: Color.fromRGBO(255, 87, 0, 1.0),
                            //  textColor: Colors.white,
                            //  elevation: 1.0,
                              child:
                                  Text('Login', style: TextStyle(fontSize: 15)),
                           //   padding: EdgeInsets.all(15.0),
                              // shape: CircleBorder(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 250,
                        ),
                        Image.asset(
                          'image/asset/icon_without_background.png',
                          height: 100,
                          width: 150,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onWillPop: onBackPress);
  }

  Future<bool> onBackPress() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('voer de pincode in'),
              actions: <Widget>[
                // FlatButton(onPressed: () => (){}, child: Text("Yes")),
                TextButton(
                    onPressed: () =>
                        // Navigator.pushNamed(context, '/login'),
                        Navigator.pop(context, false),
                    child: Text("OK")),
              ],
            ));
  }
}
