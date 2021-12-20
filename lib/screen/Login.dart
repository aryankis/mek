import 'dart:async';
import 'dart:convert';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mek/helpers/global_variables.dart';
import 'package:localstorage/localstorage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../helpers/Database_Helper.dart';

class Login extends StatefulWidget {
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  LocalStorage userId = new LocalStorage('UserId');
  LocalStorage studyNumber = new LocalStorage('UserstudyNumber');
  LocalStorage dob = new LocalStorage('Userdob');
  LocalStorage pin = new LocalStorage('pin');

  TextEditingController studyNumber_controller = new TextEditingController();
  TextEditingController dob_controller = new TextEditingController();
  TextEditingController _pincontroller = new TextEditingController();
  TextEditingController _confirmcontroller = new TextEditingController();
  bool _load = false;
  String date;
  String dt;
  String newDate;

  Widget loadingIndicator = new Container();

  final dbHelper = DatabaseHelper.instance;

  var id;
  bool getDataCheck = false;

  @protected
  void initState() {
    loadingIndicator = new Container();
    super.initState();
  }

  Future<bool> getAndUpdatedata() async {
    date = dob_controller.text;
    String y = dob_controller.text.substring(6, 10);
    String m = dob_controller.text.substring(3, 5);
    String d = date.substring(0, 2);
    dt = y + "-" + m + "-" + d;
    newDate = dt.substring(0, 10);

    // date = dob_controller.text;
    // var dot = DateTime.parse(date);
    // final f = new DateFormat('yyyy-MM-dd');
    // dt = f.format(dot);
    // print('date is $date');

    await http.post(Uri.parse('https://mek.researchsurvey.nl/pbac/usercheck'),
        body: {
      'studyNumber': studyNumber_controller.text,
      'dob': newDate,
    }, headers: {
      "content-type": "application/x-www-form-urlencoded",
    }).then((response) async {
      Map Data = await jsonDecode(response.body);
      print('data is $Data');

      if (Data["id"].isEmpty) {
        print("eroor");
        getDataCheck = false;
        return false;
      }
      //id, studynumber

      userId.setItem('UserId', id);
      studyNumber.setItem('UserstudyNumber', studyNumber_controller.text);
      dob.setItem('Userdob', dob_controller.text);
      var date = DateTime.now().toString().substring(0, 10);

      /* Check and Insert studynumber and pincode in the database  */
      final studyNumberCheck = await dbHelper
          .queryRowCountWhere('settings', 'meta_key=?', ['study_number']);
      print(studyNumberCheck);
      if (studyNumberCheck.isNotEmpty) {
        print(studyNumberCheck);
      } else {
        Map<String, dynamic> _studyNumberRow = {
          'meta_key': 'study_number',
          'meta_value': studyNumber_controller.text,
        };
        final _id = await dbHelper.insert('settings', _studyNumberRow);
        print('inserted study number id: $_id');
      }

      /* Check and insert pincode in the database */
      final pinCodeCheck = await dbHelper
          .queryRowCountWhere('settings', 'meta_key=?', ['pin_code']);
      if (studyNumberCheck.isNotEmpty) {
        print(studyNumberCheck);
      } else {
        Map<String, dynamic> pinCodeRow = {
          'meta_key': 'pin_code',
          'meta_value': _pincontroller.text
        };
        final _id = await dbHelper.insert('settings', pinCodeRow);
        print(_id);
        print('inserted pin code id: $_id');
      }
      getDataCheck = true;
      return true;
    });
    
  }

  final format_date = DateFormat("yyyy-MM-dd"); //yyyy-MM-dd
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: SizedBox(),
            title: Text('LOGIN',style:TextStyle(color: Colors.black,)),
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
    physics: ClampingScrollPhysics(),
    child:Center(
            child: Container(
              color: Colors.white24,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(40),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('STUDIENUMMER'),
                          TextFormField(
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: false),
                            controller: studyNumber_controller,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Invalid studynumber';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(child: Text('GEBOORTE DATUM')),
                          SizedBox(
                            height: 5,
                          ),

                          DateTimeField(
                            keyboardType: TextInputType.datetime,
                            format: DateFormat('dd-MM-yyyy'),
                            controller: dob_controller,
                            //controller: shipDate,
                            onShowPicker: (context, currentValue) {
                              return DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(1900, 1, 1),
                                  maxTime: DateTime.now(),
                                  theme: DatePickerTheme(
                                      headerColor: Colors.orange,
                                      backgroundColor: Colors.white,
                                      itemStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      doneStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16)), onChanged: (date) {
                                print('change $date in time zone ' +
                                    date.timeZoneOffset.inHours.toString());
                              }, onConfirm: (date) {
                                print('confirm $date');
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.nl);
                            },
                          ),
                          // return showDatePicker(
                          //   context: context,
                          //   fieldLabelText: "datum invoeren",
                          //   errorFormatText: "ongeldig formaat",
                          //   cancelText: "annuleren",
                          //   confirmText: "OK",
                          //   firstDate: DateTime(1900),
                          //   initialDate: currentValue ?? DateTime.now(),
                          //   lastDate: DateTime.now(),
                          //   initialEntryMode: DatePickerEntryMode.input,

                          // );
                          // },
                          /* decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green, style: BorderStyle.solid),
                              borderRadius: new BorderRadius.circular(23.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(23.0),
                            ),
                            //icon: Icon(Icons.calendar_today,),
                          ), */
                          // onChanged: (val) {},
                          // ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('PINCODE '),
                          TextFormField(
                            controller: _pincontroller,
                            maxLength: 4,
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value.isEmpty ||
                                  value.length < 4 ||
                                  value.length > 4) {
                                return 'Invalid pincode';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('HERHAAL PINCODE'),
                          TextFormField(
                            controller: _confirmcontroller,
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty ||
                                  value.length < 4 ||
                                  value.length > 4 ||
                                  value != _pincontroller.text) {
                                return 'Invalid pincode';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 330,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: orgColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            loadingIndicator ?? Container(),
                            Text(
                              'LOG IN',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        onPressed: () async {
                          print('date is $date');
                          print('date new nw new  is $newDate');

                          print(dob_controller.text);

                          setState(() {});
                     /*     (() {
                            loadingIndicator = new Container(
                              color: Colors.grey[300],
                              width: 70.0,
                              height: 70.0,
                              child: new Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: new Center(
                                      child: new CircularProgressIndicator())),
                            );
                          });*/

                          if (_formKey.currentState.validate()) {
                            print('if');

                            // Fluttertoast.showToast(
                            //     msg: "please wait",
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.CENTER,
                            //     timeInSecForIosWeb: 1,
                            //     backgroundColor: Colors.red,
                            //     textColor: Colors.white,
                            //     fontSize: 16.0);

                            // If the form is valid, display a Snackbar.
                            // Scaffold.of(context)
                            //     .showSnackBar(SnackBar(content: Text('Processing Data')));
                            await getAndUpdatedata().then((check) {
                              print('here');
                              print(getDataCheck);
                              setState(() {});
                             /* (() {
                                loadingIndicator = new Container();
                              });*/

                              if (getDataCheck == false) {
                                // Show a toast. Invalid detials
                                setState(() {});
                             /*   (() {
                                  loadingIndicator = new Container();
                                });*/
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          title: Text('Alert'),
                                          content: RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                                style: TextStyle(color: Colors.black),
                                                text: "Uw studienummer en geboortedatum komen niet overeen.Corrigeer uw gegevens of meld u aan voor een account via "),
                                            TextSpan(
                                                style: TextStyle(
                                                    color: Colors.blue),
                                                text: "www.mijnmenstruatie.nl.",
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () async {
                                                        final url =
                                                            'https://mijnmenstruatie.nl.';
                                                        if (await canLaunch(
                                                            url)) {
                                                          await launch(
                                                            url,
                                                            forceSafariVC:
                                                                false,
                                                          );
                                                        }
                                                      })
                                          ])),

                                          // Text(
                                          //     'Uw studienummer en geboortedatum komen niet overeen.Corrigeer uw gegevens of meld u aan voor een account viawww.mijnmenstruatie.nl'),

                                          actions: [
                                            TextButton(
                                              child: Text(
                                                'OK',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ]);
                                    });
                                return false;
                              } else {
                                print('Else');
                                setState(() {
                                  loadingIndicator = new Container();
                                });

                                Navigator.pushNamed(context, '/dashboard');
                                //return

                                // Navigator.pushNamed(context, '/dashboard');

                              }
                            });
                          }

                          /* if(_pincontroller.text.length < 4 || _pincontroller.text != _confirmcontroller.text ) {
                          AlertDialog(
                              content: Text('Invalid Pincode.'),
                              actions: [
                                TextButton(
                                  child: Text(
                                    'OK',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ]);
                          return;
                        } */
                        }),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'image/asset/icon_without_background.png',
                      width: 200,
                      height: 170,
                    ),
                  ),
                ],
              ),
            ),
          ),),
        ),
        onWillPop: onBackPress);
  }

  Future<bool> onBackPress() {
    return null;
  }
}
