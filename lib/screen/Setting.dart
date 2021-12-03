// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:mek/drawer/Bottom_Navigation.dart';
// import 'package:mek/helpers/Database_Helper.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:localstorage/localstorage.dart';
// import 'package:mek/screen/Login.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
//
//
// class Item {
//   const Item(this.name, this.icon);
//
//   final String name;
//
//   final Icon icon;
// }
//
// bool isInstructionView = false;
//
//
// class Setting extends StatefulWidget {
//   @override
//   _SettingState createState() => _SettingState();
// }
//
// final dbHelper = DatabaseHelper.instance;
// int hr;
// int min;
//
// class _SettingState extends State<Setting> with WidgetsBindingObserver {
//
//
//   var studi;
//   var id;
//   var dtext;
//   var time;
//   var selectedTime = DateFormat('jm').format(DateTime.now());
//   int selectedHr = 0;
//   int selectedMin = 0;
//   int minute = 1;
//   DateTime selectDateTime = DateTime.now();
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   TextEditingController studyNumber_controller = new TextEditingController();
//   TextEditingController dob_controller = new TextEditingController();
//
//   final format_date = DateFormat("yyyy-MM-dd");
//   final format_time = new DateFormat("HH:mm");
//
//   bool _reminder = false;
//   bool _snooze = false;
//
//   Item selectedUser;
//
//   void getTextField() async {
//     setState(() {
//       var dtext = studyNumber.getItem('UserstudyNumber');
//       time = dob.getItem('Userdob');
//       studyNumber_controller = TextEditingController(text: dtext);
//       dob_controller = TextEditingController(text: time);
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     WidgetsBinding.instance.addObserver(this);
//     _configureLocalTimeZone();
//     _requestPermissions();
//
//     var initializationSettingsAndroid = AndroidInitializationSettings(
//         '@mipmap/app_logo');
//
//     var initializationSettingsIOS = IOSInitializationSettings();
//
//
//     var initSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//
//     flutterLocalNotificationsPlugin.initialize(
//         initSettings, onSelectNotification: onSelectNotification);
//
//     dtext = studyNumber.getItem('UserstudyNumber');
//     time = dob.getItem('Userdob');
//
//     setState(() {
//       getTextField();
//     });
//     AwesomeNotifications().actionStream.listen((notification) {
//       if (notification.channelKey == 'basic_channel' && Platform.isIOS) {
//         AwesomeNotifications().getGlobalBadgeCounter().then(
//               (value) => AwesomeNotifications().setGlobalBadgeCounter(value - 1),
//         );
//       }
//
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(
//           builder: (_) => Setting(),
//         ),
//             (route) => route.isFirst,
//       );
//     });
//     //_scheduleFromNowNotification();
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }
//
//   void _requestPermissions() {
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//         IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//         MacOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
//
//   Future<void> _configureLocalTimeZone() async {
//     tz.initializeTimeZones();
//     final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
//     tz.setLocalLocation(tz.getLocation(timeZoneName));
//   }
//
//   void showInSnackBar(String message) {
//     scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   LocalStorage userId = new LocalStorage('UserId');
//   LocalStorage studyNumber = new LocalStorage('UserstudyNumber');
//   LocalStorage dob = new LocalStorage('Userdob');
//   LocalStorage current_date = new LocalStorage('current_date');
//   LocalStorage current_mon = new LocalStorage('current_mon');
//   AppLifecycleState appLifecycleState = AppLifecycleState.detached;
//
//   void getData() async {
//     await http.post('https://mek.researchsurvey.nl/pbac/usercheck', body: {
//       'studyNumber': studyNumber_controller.text,
//       'dob': dob_controller.text
//     }, headers: {
//       "content-type": "application/x-www-form-urlencoded",
//     }).then((response) {
//       Map Data = jsonDecode(response.body);
//       if (Data["id"].isEmpty) {
//         print("error");
//       }
//
//       print(Data);
//       id = Data['id'];
//       userId.setItem('UserId', id);
//       var month = DateTime.now().toString().substring(5, 7);
//       current_mon.setItem('current_date', month);
//       print(month);
//     });
//   }
//
//   tz.TZDateTime _nextInstanceFromNow() {
//     //print("selected Time=" + selectedTime.toString());
//     int addHours = 0;
//     String removePmAm = "1";
//     try {
//       String getTimePmAm = DateFormat('j').format(selectDateTime);
//       if (getTimePmAm.contains("PM")) {
//         addHours = 12;
//         removePmAm = getTimePmAm.replaceAll(" PM", "");
//       } else {
//         removePmAm = getTimePmAm.replaceAll(" AM", "");
//       }
//       selectedHr = int.parse(removePmAm);
//       print("hr=" + selectedHr.toString());
//
//       String getTimePmAm1 = DateFormat('m').format(selectDateTime);
//       String removePmAm1 = getTimePmAm1.replaceAll(" PM", "");
//       String removePmAm2 = removePmAm1.replaceAll(" AM", "");
//
//       selectedMin = int.parse(removePmAm2);
//       print("min=" + selectedMin.toString());
//     } catch (error) {
//       print(error);
//     }
//     // String removedAM1 = DateFormat('m').format(selectDateTime).replaceAll(" AM", "");
//     // String removePM1 = removedAM1.replaceAll(" PM", "");
//     // selectedMin = int.parse(removePM1);
//
//
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     tz.TZDateTime scheduledDate = tz.TZDateTime(
//         tz.local, now.year, now.month, now.day, selectedHr + addHours,
//         selectedMin);
//     print("schedule");
//     print(scheduledDate);
//     print("now");
//     print(now);
//     print(scheduledDate.timeZone);
//     if (scheduledDate.isBefore(now)) {
//       // scheduledDate = scheduledDate.add(const Duration(seconds: 30));
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }
//
//     return scheduledDate;
//   }
//     /*if(_reminder){
//       if(scheduledDate.isBefore(now)){
//         print("reminder");
//         scheduledDate = scheduledDate.add(const Duration(seconds: 30));
//       }
//     }
//     if(_snooze){
//       if(scheduledDate.isBefore(now)){
//         print("Today Date");
//         scheduledDate = scheduledDate.add(const Duration(seconds: 30));
//
//       }else{
//         print("Snooze Date");
//         scheduledDate = scheduledDate.add(const Duration(days: 1));
//         // _scheduleFromNowNotification();
//       }
//     }*/
//
//
//   /*callRepeatFunction() async{
//     await AwesomeNotifications().createNotification(
//         content: NotificationContent(
//         id: 0,
//     channelKey: 'scheduled_channel',
//     title: 'Add some water to your plant!',
//     body: 'Water your plant regularly to keep it healthy.',
//     notificationLayout: NotificationLayout.Default,
//      category: NotificationCategory.Alarm,
//     ),
//       schedule: NotificationInterval(
//         interval: 61,
//         preciseAlarm: true,
//         repeats: true,
//
//         //timezone: await AwesomeNotifications().getLocalTimeZoneIdentifier()
//       ),
//     );
//   }*/
//
//   Future<void> _cancelAllNotifications() async {
//     await flutterLocalNotificationsPlugin.cancelAll();
//   }
//
//
//   Future<void> NewNotification() async {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//         2,
//         'Reminder',
//         'Herinnering\n Vergeet u vandaag niet uw dagboek bij te houden?',
//         _nextInstanceFromNow(),
//         const NotificationDetails(
//           android: AndroidNotificationDetails(
//               '101', 'your channel name', 'your channel description'),
//           iOS: IOSNotificationDetails(),),
//         androidAllowWhileIdle: true,
//         uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//         matchDateTimeComponents: DateTimeComponents.time
//     );
//   }
//
//
//
//
// /*  Future<void>  NewNotification() async {
//     if (_snooze) {
//       await flutterLocalNotificationsPlugin.zonedSchedule(
//         0,
//         'Now scheduled notification title',
//         'Now scheduled notification body',
//         _nextInstanceFromNow(),
//         const NotificationDetails(iOS: IOSNotificationDetails(),
//           android: AndroidNotificationDetails(
//             'daily notification channel id', 'daily notification channel name',
//             'cc',
//           ),
//         ),
//         androidAllowWhileIdle: true,
//           uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//           matchDateTimeComponents: DateTimeComponents.time
//       );
//     }else if (_snooze && _reminder) {
//       await flutterLocalNotificationsPlugin.zonedSchedule(
//           0,
//           'Now scheduled notification title',
//           'Now scheduled notification body',
//
//           _nextInstanceFromNow(),
//           const NotificationDetails(iOS: IOSNotificationDetails(),
//             android: AndroidNotificationDetails(
//               'daily notification channel id', 'daily notification channel name',
//               'cc',
//             ),
//           ),
//           androidAllowWhileIdle: true,
//           uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//           matchDateTimeComponents: DateTimeComponents.time
//       );
//     }else{
//       await flutterLocalNotificationsPlugin.zonedSchedule(
//           0,
//           'Now scheduled notification title',
//           'Now scheduled notification body',
//           _nextInstanceFromNow(),
//           const NotificationDetails(iOS: IOSNotificationDetails(),
//             android: AndroidNotificationDetails(
//               'daily notification channel id', 'daily notification channel name',
//               'cc',
//             ),
//           ),
//           androidAllowWhileIdle: true,
//           uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//           matchDateTimeComponents: DateTimeComponents.time
//       );
//
//     }
//   }*/
//
//   /*Future<void>  _scheduleFromNowNotification() async {
//     if (_snooze) {
//       await flutterLocalNotificationsPlugin.show(
//         0,
//         'Now scheduled notification title',
//         'Now scheduled notification body',
//         const NotificationDetails(iOS: IOSNotificationDetails(),
//           android: AndroidNotificationDetails(
//             'daily notification channel id', 'daily notification channel name',
//             'cc',
//           ),
//         ),
//
//
//       );
//     }
//   }*/
//
//
//   /*await flutterLocalNotificationsPlugin.zonedSchedule(
//         0,
//         'Now scheduled notification title',
//         'Now scheduled notification body',
//         _nextInstanceFromNow(),
//         const NotificationDetails(
//           android: AndroidNotificationDetails('daily notification channel id', 'daily notification channel name','cc',
//               ),
//         ),
//         androidAllowWhileIdle: true,
//         uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//         matchDateTimeComponents: DateTimeComponents.time);*/
//
//
// /*
//   Future<void> _withoutsnoozeNotification() async {
//     if (_reminder) {
//       print("snooze notification");
//
//       await flutterLocalNotificationsPlugin.zonedSchedule(
//             2,
//             'Reminder',
//             'Herinnering\n Vergeet u vandaag niet uw dagboek bij te houden?',
//             _nextInstanceOfTime(),
//             const NotificationDetails(
//                 android: AndroidNotificationDetails('101', 'your channel name', 'your channel description'),
//                 iOS: IOSNotificationDetails(threadIdentifier: 'thread_id'
//
//                 )),
//             androidAllowWhileIdle: true,
//             uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime,
//             matchDateTimeComponents: DateTimeComponents.time
//         );
//
//     }
//   }
// */
//
//
//   @override
//   Widget build(BuildContext context) {
//     var data = EasyLocalizationProvider
//         .of(context)
//         .data;
//     double screenWidth = MediaQuery
//         .of(context)
//         .size
//         .width;
//     return EasyLocalizationProvider(
//       data: data,
//       child: Container(
//         color: Colors.white,
//         child: SafeArea(
//           child: Scaffold(
//             key: scaffoldKey,
//             resizeToAvoidBottomInset: false,
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               title: Text('INSTELLINGEN', style: TextStyle(color: Colors.black),
//                 textAlign: TextAlign.center,),
//               // title: Center(child: Text('INSTELLINGEN',style: TextStyle(color: Colors.black),)),
//             ),
//             body: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Center(
//                     child: Container(
//                       margin: EdgeInsets.all(20),
//                       alignment: Alignment.centerRight,
//                       height: 100,
//                       width: 100,
//                       // margin: EdgeInsets.all(10),
//                       // padding: EdgeInsets.all(10),
//                       child: Image.asset(
//                         'image/asset/app_logo.png',
//                         width: 200,
//                         height: 170,
//                       ),
//                     ),
//                   ),
//                   Divider(
//                     height: 5,
//                     color: Color.fromRGBO(131, 131, 131, 1.0),
//                     endIndent: 5,
//                     indent: 10,
//                   ),
//                   Container(
//                       margin: EdgeInsets.all(20),
//                       child: Center(
//                           child: Text(
//                             'Studienummer:  $dtext',
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 color: Color.fromRGBO(131, 131, 131, 1.0)),
//                           ))),
//                   Divider(
//                     height: 5,
//                     color: Color.fromRGBO(131, 131, 131, 1.0),
//                     endIndent: 5,
//                     indent: 10,
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(20),
//                     child: Center(
//                         child: Text('Geboorte datum :  $time',
//                             style: TextStyle(
//                                 fontSize: 19,
//                                 color: Color.fromRGBO(131, 131, 131, 1.0)))),
//                   ),
//                   Divider(
//                     height: 5,
//                     color: Color.fromRGBO(131, 131, 131, 1.0),
//                     endIndent: 5,
//                     indent: 10,
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     width: screenWidth,
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text("Reminder",
//                                 style: TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.w600)),
//                             CupertinoSwitch(
//                               value: _reminder,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _reminder = value;
//                                 });
//                                 if (_reminder){
//                                  // ReminderNotification();
//
//                                   //NewNotification();
//                                   // _scheduleFromNowNotification();
//                                   // _zonedScheduleNotification();
//                                   //_scheduleFromNowNotification();
//                                 }
//                               },
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text("Time of reminder", style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w600)),
//
//                             TextButton(
//                                 onPressed: () {
//                                   DatePicker.showTime12hPicker(context,
//                                       showTitleActions: true,
//                                       onChanged: (date) {
//                                         // print(date.timeZoneOffset.inMinutes+10);
//                                         print('change $date in time zone ' +
//                                             date.timeZoneOffset.inHours
//                                                 .toString());
//                                       }, onConfirm: (date) {
//                                         print('confirm $date');
//                                         setState(() {
//                                           selectDateTime = date;
//                                           print("before selected time");
//                                           print(selectedTime);
//                                           selectedTime = DateFormat('jm').format(date);
//                                           print("after selected time");
//                                           print(selectedTime);
//                                           _reminder = false;
//                                           _snooze = false;
//
//                                         });
//
//                                        // NewNotification();
//                                         /* const fiveSeconds = const Duration(seconds: 1);
//                                         Timer.periodic(fiveSeconds, (Timer t) => NewNotification());*/
//                                         //_nextInstanceFromNow();
//                                         // _scheduleFromNowNotification();
//                                         //_zonedScheduleNotification();
//
//                                         // _scheduleFromNowNotification();
//                                       }, currentTime: selectDateTime);
//                                 },
//                                 child: Text(
//                                   selectedTime,
//                                   style: TextStyle(color: Colors.black),
//                                 )),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text("Snooze", style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w600)),
//                             CupertinoSwitch(
//                               value: _snooze,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _snooze = value;
//                                 });
//                                 if (_snooze) {
//                                 //  ReminderNotification();
//                                   NewNotification();
//                                 }
//                                 //_scheduleFromNowNotification();
//                                 /*const fiveSeconds = const Duration(seconds: 30);
//                                 Timer.periodic(fiveSeconds, (Timer t) => snoozeTime());*/
//                               },
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     height: 5,
//                     color: Color.fromRGBO(131, 131, 131, 1.0),
//                     endIndent: 5,
//                     indent: 10,
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(40),
//                     child: ListTile(
//                       tileColor: Color.fromRGBO(249, 100, 0, 1.0),
//                       leading: Icon(
//                         Icons.logout,
//                         size: 30,
//                         color: Colors.white,
//                       ),
//                       onTap: () async {
//                         Map<String, dynamic> _studyNumberRow = {
//                           'meta_key': 'study_number',
//                           'meta_value': "",
//                         };
//                         Map<String, dynamic> _pincodeRow = {
//                           'meta_key': 'pin_code',
//                           'meta_value': "",
//                         };
//
//                         // dbHelper.update('settings', _studyNumberRow,
//                         //     'meta_key=?', ['study_number']);
//
//                         await dbHelper.update('settings', _studyNumberRow,
//                             'meta_key=?', ['study_number']).then((value) async {
//                           dbHelper.delete('settings', 'study_number');
//                           dbHelper.delete('settings', 'pin_code');
//
//                           await dbHelper.update('settings', _pincodeRow,
//                               'meta_key=?', ['pin_code']).then((_value) {
//                             Navigator.pushNamed(context, '/login');
//                             dbHelper
//                                 .queryAllRows('settings')
//                                 .then((value) => print(value));
//                             print(_value);
//                           });
//                         });
//                       },
//                       title: Text(
//                         'Afmelden',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 17,
//                             fontWeight: FontWeight.w100),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             bottomNavigationBar: BottomNavigation(),
//
//             /* bottomNavigationBar: Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(context, '/spotting');
//                       },
//                       child: Container(
//                           width: 250,
//                           margin: EdgeInsets.only(left: 5),
//                           child: Image.asset(
//                             'image/asset/add.png',
//                             height: 50,
//                             width: 150,
//                           )),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         GestureDetector(
//                           child: Container(
//                             margin: EdgeInsets.only(right: 15),
//                             child: Image.asset(
//                               'image/asset/new_home.png',
//                               height: 40,
//                             ),
//                           ),
//                           onTap: () {
//                             Navigator.pushNamed(context, '/home');
//                           },
//                         ),
//                         GestureDetector(
//                           child: Container(
//                             margin: EdgeInsets.only(right: 15),
//                             child: Image.asset(
//                               'image/asset/new_leg.png',
//                               height: 40,
//                             ),
//                           ),
//                           onTap: () {
//                             Navigator.pushNamed(context, '/legend');
//                           },
//                         ),
//                       ],
//                     ),
//                   ]),
//             ),*/
//           ),
//         ),
//       ),
//     );
//   }
//
//
//  /* snoozeTime() async {
//     print("snooze");
//     selectDateTime = selectDateTime.add(Duration(seconds: 30));
//     print("snooze timing");
//     print(selectDateTime);
//     if (_snooze) {
//       print("snooze notification");
//       await flutterLocalNotificationsPlugin.show(
//         2,
//         'Reminder',
//         'Herinnering\n Vergeet u vandaag niet uw dagboek bij te houden?',
//         const NotificationDetails(
//             android: AndroidNotificationDetails(
//                 '101', 'your channel name', 'your channel description'),
//             iOS: IOSNotificationDetails(threadIdentifier: 'thread_id'
//
//             )),
//
//       );
//     }
//   }*/
//
//  /* void snooze(bool es) {
//     setState(() {
//       if (es) {
//         _snooze = true;
//         es = true;
//       } else {
//         _snooze = false;
//         es = false;
//       }
//     });
//   }*/
//
//   Future onSelectNotification(String payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: ' + payload);
//     }
//
//     await Navigator.push(
//       context,
//       new MaterialPageRoute(builder: (context) => new Login()),
//     );
//   }
//
//
//   Future<void> ReminderNotification() async {
//     int addHours = 0;
//     String removePmAm = "1";
//     try {
//       String getTimePmAm = DateFormat('j').format(selectDateTime);
//       if (getTimePmAm.contains("PM")) {
//         addHours = 12;
//         removePmAm = getTimePmAm.replaceAll(" PM", "");
//       } else {
//         removePmAm = getTimePmAm.replaceAll(" AM", "");
//       }
//       selectedHr = int.parse(removePmAm);
//       print("hr=" + selectedHr.toString());
//
//       String getTimePmAm1 = DateFormat('m').format(selectDateTime);
//       String removePmAm1 = getTimePmAm1.replaceAll(" PM", "");
//       String removePmAm2 = removePmAm1.replaceAll(" AM", "");
//
//       selectedMin = int.parse(removePmAm2);
//       print("min=" + selectedMin.toString());
//     } catch (error) {
//       print(error);
//     }
//
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, selectedHr + addHours, selectedMin);
//     print("schedule");
//     print(scheduledDate);
//     print("now");
//     print(now);
//       print("repeat schedule day ");
//       print(scheduledDate);
//
//         await AwesomeNotifications().createNotification(
//             content: NotificationContent(
//               id: createUniqueId(),
//               channelKey: 'scheduled_channel',
//               title: 'Reminder',
//               body: 'Herinnering\n Vergeet u vandaag niet uw dagboek bij te houden?',
//               notificationLayout: NotificationLayout.Default,
//               wakeUpScreen: true,
//             ),
//
//             schedule: NotificationCalendar.fromDate(
//                 date: scheduledDate, repeats: true, preciseAlarm: true));
//
//
//
//
//
//
//   }
//
//   Future<void> cancelScheduledNotifications() async {
//     await AwesomeNotifications().cancelAllSchedules();
//   }
//
// }
//
// /*  Future onSelectNotification(String payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: ' + payload);
//     }
//
//     await Navigator.push(
//       context,
//       new MaterialPageRoute(builder: (context) => new Setting()),
//     );
//   }
//
// }*/
//
// int createUniqueId() {
//   return DateTime.now().millisecondsSinceEpoch.remainder(100000);
// }
