import 'package:mek/helpers/global_variables.dart' as globals;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mek/screen/setting4.dart';
import 'contact.dart';
import 'home_screen.dart';
import '../drawer/menu.dart';
import 'Setting.dart';

class AfterCalender extends StatefulWidget {
  @override
  _AfterCalenderState createState() => _AfterCalenderState();
}

class _AfterCalenderState extends State<AfterCalender> {
  LocalStorage spots = new LocalStorage('spots');
  LocalStorage noblood = new LocalStorage('noblood');
  var noBlood = 0;
  var spot = 1;

  int _currentIndex = 0;
  List<Widget> children = [
    HomeScreen(),
    Menu(),
    Contact(),
    Setting(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Image.asset(
          'image/asset/Logob.png',
          width: 80,
          height: 80,
        )),
      ),
      body: ListView(children: <Widget>[
        Card(
          child: ListTile(
            onTap: () {
              noblood.setItem('noblood', noBlood);
              print(noBlood);
            },
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("image/asset/s.png"),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('No blood Loss No Pain'.tr() )
            

              // Text(AppLocalizations.of(context).tr('No blood Loss No Pain')),
          ),
        ),
        Card(
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/onlypain');
            },
            leading: Image.asset(
              'image/asset/onlypain.png',
              width: 30,
              height: 30,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text( 'Only Pain'.tr() ),
          ),
        ),
        Card(
          child: ListTile(
            onTap: () {
              spots.setItem('spots', spot);
              print(spot);
            },
            leading: Image.asset(
              'image/asset/dropblack.png',
              width: 30,
              height: 30,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text( 'Spots'.tr() ),
          ),
        ),
        Card(
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/pads');
            },
            leading: Image.asset(
              'image/asset/mens.png',
              width: 40,
              height: 40,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text( 'Menstruation'.tr() ),
          ),
        )
      ]),
      persistentFooterButtons: <Widget>[
        RaisedButton.icon(
          icon: Icon(Icons.arrow_back),
          label: Text("Back", style: TextStyle(fontSize: 10)),
          textColor: Colors.white,
          color: globals.primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        RaisedButton.icon(
          icon: Icon(Icons.info),
          label: Text(
            "Explain The App",
            style: TextStyle(fontSize: 10),
          ),
          textColor: Colors.white,
          color: globals.primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, '/explain');
          },
        ),
        RaisedButton.icon(
          icon: Icon(Icons.share),
          label: Text(('Legend'.tr()),
              style: TextStyle(fontSize: 10)),
          textColor: Colors.white,
          color: globals.primaryColor,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Center(
                      child: Text(
                        ('Legend'.tr()),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('image/asset/spot.png',
                              width: 20, height: 20),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Spots',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('image/asset/spot.png',
                              width: 20, height: 20),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            ' Slight Blood Loss',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('image/asset/spot.png',
                              width: 20, height: 20),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            ' Normal Blood Loss',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('image/asset/spot.png',
                              width: 20, height: 20),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            ' Heavy Blood Loss',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      FlatButton(
                        child: Text(
                          'OK',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
          },
        ),
      ],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 1) {
              Navigator.pushReplacementNamed(context, '/menu');
            } else if (_currentIndex == 2) {
              Navigator.pushReplacementNamed(context, '/contact');
            } else if (_currentIndex == 3) {
              Navigator.pushReplacementNamed(context, '/setting');
            } else {
              Navigator.pushReplacementNamed(context, '/home');
            }
          });
        },
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), label: 'contacts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'settings')
        ],
        selectedItemColor: globals.primaryColor,
        unselectedItemColor: Colors.blue[100],
      ),
    );
  }
}
