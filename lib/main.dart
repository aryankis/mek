import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mek/screen/dashboard_screen.dart';
import 'package:mek/helpers/global_variables.dart' as globals;
import 'package:mek/screen/only_pain.dart';
import 'package:mek/screen/pads.dart';
import 'package:mek/screen/setting4.dart';
import 'package:mek/screen/spotting.dart';
import 'package:mek/screen/add_value.dart';
import 'package:mek/screen/legenda.dart';
import 'package:mek/screen/login.dart';
import 'package:localstorage/localstorage.dart';
import 'screen/after_calendar.dart';
import 'screen/confirm.dart';
import 'screen/contact.dart';
import 'screen/explain.dart';
import 'drawer/menu.dart';
import 'screen/Setting.dart';
import 'screen/tampons.dart';
import 'helpers/database_helper.dart';
import 'screen/home_screen.dart';
import 'screen/faq.dart';


void main() {
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(EasyLocalization(child: new MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;

    return EasyLocalizationProvider(
      data: data,

      child: new MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/home': (BuildContext context) => new HomeScreen(),
          '/afterCalender': (BuildContext context) => new AfterCalender(),
          '/contact': (BuildContext context) => new Contact(),
          '/faq': (BuildContext context) => new Faq(),
          '/onlypain': (BuildContext context) => new Onlypain(text: ""),
          '/setting': (BuildContext context) => new Setting(),
          '/pads': (BuildContext context) => new Pads(text: "Messgae",),
          '/explain': (BuildContext context) => new Explain(),
          '/tampons': (BuildContext context) => new Tampons(),
          '/menu': (BuildContext context) => new Menu(),
          '/confirm': (BuildContext context) => new Confirm(text: ""),
          '/spotting': (BuildContext context) => new Spotting(text: "'heelo'",),
          '/addvalue': (BuildContext context) => new Value(text: "mesage"),
          '/login': (BuildContext context) => new Login(),
          '/dashboard': (BuildContext context) => new DashboardScreen(),
          '/legend': (BuildContext context) => new Legenda()
        },
        theme: new ThemeData(
           brightness: Brightness.light,
          primaryColor: globals.primaryColor,
          accentColor: globals.secondaryColor,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
          ),
          fontFamily: 'Poppins',
        ),
        home: new SplashScreen(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasyLocalizationDelegate(
            locale: data.locale,
            path: 'image/asset/asset_lang',
          )
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('bg', 'BG'),
          Locale('de', 'DE'),
          Locale('nl', 'NL')
        ],
        locale: data.locale,
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  // _SplashScreenState
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LocalStorage pin = new LocalStorage('pin');
  bool pincode;

  @override
  void initState() {
    checkKey();
    setTimer();
    super.initState();
  }

  // Future getPin() async {
  //   pincode = await pin.getItem('pin');
  //   print('-->');
  //   return pincode;
  // }

  setTimer() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  final dbHelper = DatabaseHelper.instance;
  Future<bool> checkKey() async {
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
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardScreen()));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body:  Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*SizedBox(
                height: 150,
              ),*/
              Image.asset(
                'image/asset/image.jpg',
                width: 200,
                height: 200,
              ),
             /* SizedBox(
                height: MediaQuery.of(context).size.height*0.2,//200
              ),

              Image.asset(
                'image/asset/icon_without_background.png',
                width: 250,
                height: 170,
              ),*/
             
            ],
          ),
        ),

    );
  }
}
