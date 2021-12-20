import 'dart:convert';
import 'dart:io';
import 'package:mek/drawer/Drawer.dart';
import 'package:mek/screen/add_value.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mek/screen/spotting.dart';
import 'package:localstorage/localstorage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'package:mek/helpers/Database_Helper.dart';
import '../helpers/Database_Helper.dart';

class PainScore {
  String question1a;
  String question1b;
  String question1c;
  String question2a;
  String question2b;
  String question2c;
  String question3;
  String question4;
  String question5;
  String question6;
  String question7;
  String question8;
  String isMonth;
  String status;
  String creationDate;
  String reportedDate;
  String bloodloss;
  String studyNumber;
  String dob;

  PainScore(
      {this.question1a,
      this.question1b,
      this.question1c,
      this.question2a,
      this.question2b,
      this.question2c,
      this.question3,
      this.question4,
      this.question5,
      this.question6,
      this.question7,
      this.question8,
      this.bloodloss,
      this.creationDate,
      this.isMonth,
      this.reportedDate,
      this.status,
      this.dob,
      this.studyNumber});
}

LocalStorage studyNumber = LocalStorage('UserstudyNumber');
LocalStorage selectedDate = new LocalStorage('selected_date');

var year;
var responseData;
var dateInfo;
var monthInfo;
List months = [
  'JAN',
  'FEB',
  'MAR',
  'APR',
  'MAY',
  'JUN',
  'JUL',
  'AUG',
  'SEP',
  'OCT',
  'NOV',
  'DEC'
];

class HomeScreen extends StatefulWidget {
  final String stu;
  final String mon;

  @override
  HomeScreen({Key key, this.stu, this.mon}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState(stu, mon, dob);
}

class _HomeScreenState extends State<HomeScreen> {
  Map<DateTime, List<PainScore>> _events = new Map<DateTime, List<PainScore>>();
  List<PainScore> painScore = new List<PainScore>.empty(growable: true);
  LocalStorage storageDate = new LocalStorage('localstorage_date');
  // List<PainScore> = new List<PainScore>mpty(growable: true);

  final dbHelper = DatabaseHelper.instance;

  bool updateFirstTime = true;
  var stu;
  var mon;
  var db;
  var fdate;
  int padone;
  int padtwo;
  int padthree;

  int tampons1;
  int tampons2;
  int tampons3;

  int qu3;
  int qu4;
  int qu5;
  int qu6;
  int qu7;
  int qu8;

  _HomeScreenState(this.stu, this.mon, this.dob);

  LocalStorage bloodpbac = new LocalStorage('bloodpbac');
  LocalStorage score = new LocalStorage('score');
  LocalStorage pad1 = new LocalStorage('pad1');
  LocalStorage pad2 = new LocalStorage('pad2');
  LocalStorage pad3 = new LocalStorage('pad3');
  LocalStorage tam1 = new LocalStorage('tam1');
  LocalStorage tam2 = new LocalStorage('tam2');
  LocalStorage tam3 = new LocalStorage('tam3');
  LocalStorage currentMon = new LocalStorage('current_mon');
  LocalStorage dob = new LocalStorage('Userdob');

  int pbac;

  CalendarController _controller;
  List _selectedEvents = new List.empty(growable: true);
  Widget painScoreInfo = new Container();
  Map<CalendarFormat, String> availableCalendarFormats = const {
    CalendarFormat.month: 'maand',
    CalendarFormat.twoWeeks: '2 weken',
    CalendarFormat.week: 'week'
  };

  resetValues() {
    qu3 = 2;
    qu4 = 2;
    qu5 = 2;
    qu6 = 0;
    qu7 = 2;
    qu8 = 2;
    padone = 0;
    padtwo = 0;
    padthree = 0;
    tampons1 = 0;
    tampons2 = 0;
    tampons3 = 0;
  }

  Widget buildCalander(_events) {
    return TableCalendar(
        locale: 'nl',
        events: _events,
        initialCalendarFormat: CalendarFormat.month,
        formatAnimation: FormatAnimation.slide,
        availableGestures: AvailableGestures.all,
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          todayColor: Colors.orange,
          selectedColor: Theme.of(context).primaryColor,
          todayStyle: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
        ),
        availableCalendarFormats: availableCalendarFormats,
        headerStyle: HeaderStyle(
          formatButtonVisible: true,
          centerHeaderTitle: true,
          formatButtonDecoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20.0),
          ),
          formatButtonTextStyle: TextStyle(color: Colors.white),
          formatButtonShowsNext: false,
        ),
        initialSelectedDay: DateTime.now(),
        startingDayOfWeek: StartingDayOfWeek.monday,
        onVisibleDaysChanged: (DateTime date, DateTime last, CalendarFormat format) {
          print('changed');

          setState(() {
            painScoreInfo = Text(" ");
            mon = date.toString().substring(5, 7);
            year = date.toString().substring(0, 4);

            print('mon is $mon');
            print('year is $year');
          });
        },
        onDaySelected: (DateTime date, List events, _selectedEvents) {
          setState(() {
            // fdate = date;
            // String format = DateFormat('dd -MM ').format(fdate);
            // print('f us $format');

            var da = date.toString().substring(0, 10);
            String select_date = da.substring(8, 10);
            var select_month = date.month;
            var selectmonthInfo = months[select_month - 1];
            String date_save = select_date + selectmonthInfo;
            print("change date");
            print(date_save);
            storageDate.setItem("date", date_save);

            if (date.isAfter(DateTime.now().add(new Duration(hours: 1)))) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Center(
                        child: Text(
                          "Alert",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      actions: <Widget>[
                        Center(
                            child: Text(
                          "U kunt geen gegevens instellen voor toekomstige datums",
                          //You Cannot Set data for Future Dates
                          style: TextStyle(fontSize: 15),
                        )),
                        TextButton(
                          child: Text('OK',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });
            }

            if (_selectedEvents.isEmpty) {
              resetValues();
              painScoreInfo = Center(
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 212, 184, 1.0),
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(25),
                        margin: EdgeInsets.all(50),
                        // color: Colors.orange[100],
                        child: Center(
                          child: Text(
                            'U heeft voor deze dag nog niets ingevuld',
                            style: TextStyle(
                                fontSize: 22,
                                color: Color.fromRGBO(147, 137, 131, 1.0)),
                            maxLines: 2,
                          ),
                        )),
                  ],
                ),
              );

              mon = date.toString().substring(5, 7);
              year = date.toString().substring(0, 4);

              print('mon is $mon');
              print('year is $year');

              var da = date.toString().substring(0, 10);

              dateInfo = da.substring(8, 10);

              var month_Info = date.month;

              monthInfo = months[month_Info - 1];

              selected_date.setItem('selected_date', da);

              events.map((e) {
                createCalanderInfo(e);
              }).toList();
            }


            pad1.deleteItem('pad1');
            pad2.deleteItem('pad2');
            pad3.deleteItem('pad3');
            tam1.deleteItem('tam1');
            tam2.deleteItem('tam2');
            tam3.deleteItem('tam3');
            currentMon.deleteItem('current_mon');
            score.deleteItem('score');
            _selectedEvents = events;
            print('selected events$_selectedEvents');
          });
        },
        calendarController: _controller,
        builders: CalendarBuilders(
          todayDayBuilder: (context, date, _) {
            return Center(
              child: Container(
                // padding: EdgeInsets.only(top: 2, bottom: 4),
                // margin: const EdgeInsets.all(4.0),

                width: 42,
                height: 42,
                decoration: (BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange[500])),
                child: Center(
                  child: Text('${date.day}',
                    style: TextStyle(color: Colors.white).copyWith(fontSize: 16.0),
                  ),
                ),
              ),
            );
          },
          selectedDayBuilder: (context, date, _) {
            return Center(
              child: Container(
                // margin:EdgeInsets.only(top:1),
                margin: EdgeInsets.only(bottom: 1),
                // color: Colors.deepOrange[300],
                height: 42,
                width: 42,
                decoration: (BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue[300])),
                child: Center(
                  child: Text('${date.day}',
                    style: TextStyle(color: Colors.white).copyWith(fontSize: 16.0),
                  ),
                ),
              ),
            );
          },
          singleMarkerBuilder: (context, date, events) {
            int blood = events.bloodloss == 'null' ? 0 : int.tryParse(events.bloodloss);

            int bl = events.question4 == 'null' ? 0 : int.tryParse(events.question4);

            int pain = events.question5 == "null" ? 0 : int.tryParse(events.question5);

            // if (qu4 == 1) {
            //   return Image.asset('image.asset/blank.png',
            //   width: 10,
            //   height: 10,);
            // } else
            // if (qu4 == 1) {
            //   return Image.asset('image/asset/blank_orange.jpg',
            //    width: 10,
            //     height: 10,);
            // }

            if (bl == 1) {
              return Center(
                child: Container(
                  height: 42,
                  width: 42,
                  padding:
                      EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.orange),
                  ),
                  child: Center(
                    child: Image.asset(
                      'image/asset/black.png',
                      width: 10,
                      height: 10,
                    ),
                  ),
                ),
              );
            } else {
              if (pain == 1) {
                return Center(
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                );
                /////////////////////////////
              } else if (blood >= 1 && blood < 20) {
                return Center(
                  child: Container(
                    height: 42,
                    width: 42,
                    padding: EdgeInsets.only(
                        top: 25, left: 15, right: 15, bottom: 3),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      'image/asset/doto_water.png',
                      width: 10,
                      height: 10,
                    ),
                  ),
                );

                ////////////////////////////////////////////////////////
              } else if (blood >= 20 && blood <= 50) {
                return Center(
                  child: Container(
                    height: 42,
                    width: 42,
                    padding: EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'image/asset/doto_water.png',
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'image/asset/doto_water.png',
                          width: 10,
                          height: 10,
                        )
                      ],
                    ),
                  ),
                );
                /////////////////////////////
              } else if (blood > 50) {
                return Center(
                  child: Container(
                    height: 42,
                    width: 42,
                    padding: EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'image/asset/doto_water.png',
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'image/asset/doto_water.png',
                          width: 10,
                          height: 10,
                        ),
                        Image.asset(
                          'image/asset/doto_water.png',
                          width: 10,
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  width: 42,
                  height: 42,
                );
              }
            }
          },
        ));
  }

  // Widget createdrop(PainScore event) {} //

  Widget createCalanderInfo(PainScore event) {
    //  print(event.question1a.runtimeType);
    // String report = event.reporteddate;
    // int ques = event.question;
    // String cd = event.creationdate;
    // String st = event.status;

    var view3;
    var view7;
    var view4;
    var view8;

    String date = event.reportedDate;

    DateTime dateTime = DateTime.parse(date);
    qu3 = event.question3 == 'null' ? 0 : int.tryParse(event.question3);
    qu4 = event.question4 == 'null' ? 0 : int.tryParse(event.question4);
    qu5 = event.question5 == 'null' ? 0 : int.tryParse(event.question5);
    qu6 = event.question6 == 'null' ? 0 : int.tryParse(event.question6);
    qu7 = event.question7 == 'null' ? 0 : int.tryParse(event.question7);
    qu8 = event.question8 == 'null' ? 0 : int.tryParse(event.question8);
    int blood = event.bloodloss == 'null' ? 0 : int.tryParse(event.bloodloss);
    print(blood);
    padone = event.question1a == 'null' ? 0 : int.tryParse(event.question1a);
    padtwo = event.question1b == 'null' ? 0 : int.tryParse(event.question1b);
    padthree = event.question1c == 'null' ? 0 : int.tryParse(event.question1c);

    tampons1 = event.question2a == 'null' ? 0 : int.tryParse(event.question2a);
    tampons2 = event.question2b == 'null' ? 0 : int.tryParse(event.question2b);
    tampons3 = event.question2c == 'null' ? 0 : int.tryParse(event.question2c);

    int pads = padone + padtwo + padthree;
    int tampons = tampons1 + tampons2 + tampons3;
    if (qu3 == 1) {
      view3 = "JA";
    } else {
      view3 = 'NEE';
    }

    if (qu7 == 1) {
      view7 = "JA";
    } else {
      view7 = 'NEE';
    }

    if (qu4 == 1) {
      view4 = "JA";
    } else {
      view4 = 'NEE';
    }

    if (qu8 == 1) {
      view8 = "JA";
    } else {
      view8 = 'NEE';
    }

    var textColor = Color.fromRGBO(147, 137, 131, 1.0);

    int painScore =
        event.question6 == 'null' ? 0 : int.tryParse(event.question6);
    pbac = (padone * 1) + (padtwo * 5) + (padthree * 20) + (tampons1 * 1) + (tampons2 * 5) + (tampons3 * 10);

    painScoreInfo = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Expanded(child:
          Container(
            child: Column(
              children: [
                Text(
                  dateInfo != null ? dateInfo : "",
                  style: TextStyle(
                    color: Colors.black87,fontSize: MediaQuery.of(context).devicePixelRatio*4
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(monthInfo != null ? monthInfo : "", style: TextStyle( color: Colors.black87,fontSize: MediaQuery.of(context).devicePixelRatio*4)),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 190,
                  color: Color.fromRGBO(213, 213, 213, 1.0),
                  width: 2,
                )
              ],
            ),
          ),
        //),

        Container(
            child: Column(children: <Widget>[
          Container(
             margin: EdgeInsets.only(left: MediaQuery.of(context).devicePixelRatio*1, right: MediaQuery.of(context).devicePixelRatio*1, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(255, 212, 184, 1.0),
            ),
            child: Center(
              child: Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).devicePixelRatio*2, right: MediaQuery.of(context).devicePixelRatio*1, bottom: 15, top: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Eerste dag menstruatie: ',
                            style: TextStyle(fontSize: 18, color: textColor)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Tampons:',
                            style: TextStyle(fontSize: 18, color: textColor)),
                        Text('Maandverbanden:',
                            style: TextStyle(fontSize: 18, color: textColor)),
                        Text('Pijnscore:',
                            style: TextStyle(fontSize: 18, color: textColor)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Pijnstillers:',
                            style: TextStyle(fontSize: 18, color: textColor)),
                        Text('Spotting:',
                            style: TextStyle(fontSize: 18, color: textColor)),
                        Text('Belemmerd:',
                            style: TextStyle(fontSize: 18, color: textColor)),
                        Text('Bloedverlies:',
                            style: TextStyle(fontSize: 18, color: textColor)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(view3,
                            style: TextStyle(fontSize: 18, color: textColor)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(tampons.toString(),
                            style: TextStyle(fontSize: 18, color: textColor)),
                        Text(pads.toString(),
                            style: TextStyle(fontSize: 18, color: textColor)),
                        Text(painScore.toString(),
                            style: TextStyle(fontSize: 18, color: textColor)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(view7,
                            style: TextStyle(fontSize: 18, color: textColor)),
                        Text(view4,
                            style: TextStyle(fontSize: 18, color: textColor)),
                        Text(view8,
                            style: TextStyle(fontSize: 18, color: textColor)),
                        Text('${pbac.toString()} punten',
                            style: TextStyle(fontSize: 18, color: textColor)),
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ])),
      ],
    );
    return painScoreInfo;
  }

  @override
  void initState() {
    //  Navigator.pushNamed(context, '/home');
    super.initState();

    _controller = CalendarController();
    painScoreInfo = Column(
      children: [
        SizedBox(height: 100),
        Text(''),
      ],
    );

    stu = studyNumber.getItem('UserstudyNumber');
    db = dob.getItem('Userdob');
    print('the db is $db');
    mon = DateTime.now().toString().substring(5, 7);
    year = DateTime.now().toString().substring(0, 4);
    print('study no. is $stu');
    print("the new db is$db");
    print(mon);
    print(year);
    print("the dob is $dob");
    String today = DateTime.now().toString().substring(0, 10);
    dateInfo = today.substring(8, 10);
    var currentMonth = DateTime.now().month;
    monthInfo = months[currentMonth - 1];
    String date_save = dateInfo + monthInfo;
    print("change date");
    print(date_save);
    storageDate.setItem("date", date_save);
    _saveDate(today);
  }

  _saveDate(String today) async {
    await selected_date.ready;
    selected_date.setItem('selected_date', today);
  }

  @override
  void dispose() {
    _events.clear();
    super.dispose();
  }

  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = dateInfo + monthInfo;
    print('text to send $textToSend');
    print('ques6 is $qu6 ');


    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Spotting(
                text: textToSend,
                value: padone.toString(),
                value2: padtwo.toString(),
                value3: padthree.toString(),
                tamValue: tampons1.toString(),
                tamValue2: tampons2.toString(),
                tamValue3: tampons3.toString(),
                ques3: qu3.toString(),
                ques4: qu4.toString(),
                ques5: qu5.toString(),
                ques7: qu7.toString(),
                ques8: qu8.toString(),
                ques6: qu6.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            endDrawerEnableOpenDragGesture: false,
            endDrawer: DrawerMenu(),
            appBar: AppBar(
              shadowColor: Colors.orange,
             backgroundColor: Colors.white,
              title: Center(child: Text('KALENDER',style: new TextStyle(
                color:Colors.black
              ),)),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  FutureBuilder<http.Response>(
                      future: http.post(
                          'https://mek.researchsurvey.nl/pbac/view',
                          body: {
                            'studyNumber': stu,
                            'year': year,
                            'month': mon,
                            'dob': db,
                          },
                          headers: {
                            "content-type": "application/x-www-form-urlencoded",
                          }),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print("studyNumber");
                          print(stu);
                          print("year");
                          print(year);
                          print("month");
                          print(mon);
                          print("dob");
                          print(db);
                          responseData = jsonDecode(snapshot.data.body);
                          print('response is $responseData');
                          //debugPrint(responseData);
                          if (responseData.length >= 0) {
                            for (var i = 0; i < responseData.length; i++) {
                              DateFormat dateFormat = DateFormat('yyyy-MM-dd');
                              // print(responseData[i]);

                              var dateTime = DateTime.parse(responseData[i]['reporteddate'].toString().trim());

                              print(dateTime);

                              _events.putIfAbsent(dateTime,
                                  () => [
                                        PainScore(
                                          question1a: responseData[i]['question1a'].toString().trim(),
                                          question1b: responseData[i]['question1b'].toString().trim(),
                                          question1c: responseData[i]['question1c'].toString().trim(),
                                          question2a: responseData[i]['question2a'].toString().trim(),
                                          question2b: responseData[i]['question2b'].toString().trim(),
                                          question2c: responseData[i]['question2c'].toString().trim(),
                                          question3: responseData[i]['question3'].toString().trim(),
                                          question4: responseData[i]['question4'].toString().trim(),
                                          question5: responseData[i]['question5'].toString().trim(),
                                          question6: responseData[i]['question6'].toString().trim(),
                                          question7: responseData[i]['question7'].toString().trim(),
                                          question8: responseData[i]['question8'].toString().trim(),
                                          creationDate: responseData[i]['creationdate'].toString().trim(),
                                          isMonth: responseData[i]['isMonth'].toString().trim(),
                                          reportedDate: responseData[i]['reporteddate'].toString().trim(),
                                          dob: responseData[i]['dob'].toString().trim(),
                                          bloodloss: responseData[i]['bloodloss'].toString().trim(),
                                          status: responseData[i]['status'].toString().trim(),
                                          studyNumber: responseData[i]['studyNumber'].toString().trim(),
                                        )
                                      ]);
                            }
                            try {
                              String today = DateTime.now().toString().substring(0, 10);
                              List entryList = _events.entries.toList();
                              PainScore painScore;
                              for (int i = 0; i < entryList.length; i++) {
                                if (today == entryList[i].key.toString().substring(0, 10)) {
                                  painScore = entryList[i].value[0];
                                }
                              }
                              if (painScore != null) {
                                if (updateFirstTime) {
                                  updateFirstTime = false;
                                  createCalanderInfo(painScore);
                                }
                              }
                            } catch (error) {
                              print(error);
                            }
                            return buildCalander(_events);
                          } else {
                            return Container(
                                height: 400,
                                child:
                                    Center(child: CircularProgressIndicator()));
                          }
                        } else {
                          if (snapshot.hasError) {
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
                                  "Het internet is niet verbonden of u hebt geen gegevens ingevoerd!",
                                  //Either Internet is not Connected or You Have not Entered Details!
                                  style: TextStyle(fontSize: 15),
                                )),
                                TextButton(
                                  child: Text(
                                    'ok',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/home');
                                  },
                                ),
                              ],
                            );
                          } else {
                            return Container(
                                height: 400,
                                child:
                                    Center(child: CircularProgressIndicator()));
                          }
                        }
                      }),
                  Divider(
                    color: Colors.orange,
                    height: 40,
                    endIndent: 2,
                  ),
                  painScoreInfo,

                  SizedBox(
                    height: 60,
                  ),
                ],
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
                          // print(qu3 + qu4 + qu5);
                          _sendDataToSecondScreen(context);
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
          ),
        ),
      ),
    );
  }

  Future<bool> onBackPress() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Do you want to quit'),
              actions: <Widget>[
                TextButton(onPressed: () => exit(0), child: Text("Yes")),
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text("No")),
              ],
            ));
  }
}
