import 'package:flutter/material.dart';
import 'package:mek/helpers/global_variables.dart' as globals;
import 'package:easy_localization/easy_localization.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
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
            margin: EdgeInsets.fromLTRB(10, 5, 10, 2),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              onTap: () {
                Navigator.pushNamed(context, '/faq');
              },
              leading: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("image/asset/faq.png"),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text(('Frequently Asked Questions'.tr())),
            ),
          ),

          Card(
            margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              onTap: () {
                Navigator.pushNamed(context, '/explain');
              },
              leading: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("image/asset/explain.png")
                
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text(('Explain This App'.tr())),
            ),
          ),

          Card(
            margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
            
            child: ListTile(
              
              contentPadding: EdgeInsets.all(10),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
             leading: CircleAvatar(
               radius: 15,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("image/asset/contact.png"),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text(('Contact'.tr())),
            ),
          ),
          
          Card(
            margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              
              leading: Image.asset(
                'image/asset/date.png',
                width: 25,
                height: 25,
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text(('Change the Date'.tr())),
            ),
          )
        ]),


        persistentFooterButtons: <Widget>[
          
          Row(
            
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton.icon(
              
              icon: Icon(Icons.arrow_back),
              label: Text('Back', style: TextStyle(fontSize: 10)),
              textColor: Colors.white,
              color: globals.primaryColor,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton.icon(
              icon: Icon(Icons.info),
              label: Flexible(
                  child:
                      Text('Explain This App', style: TextStyle(fontSize: 10))),
              textColor: Colors.white,
              color: globals.primaryColor,
              onPressed: () {
                Navigator.pushNamed(context, '/explain');
              },
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton.icon(
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
                          child: Text( " Legend ",
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
          ),
            ],

          ),

        ],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              //print(_children[_currentIndex]);

              if (_currentIndex == 1) {
                Navigator.pushReplacementNamed(context, '/menu');
              } else if (_currentIndex == 2) {
                Navigator.pushNamed(context, '/contact');
              } else if (_currentIndex == 3) {
                Navigator.pushNamed(context, '/setting');
              } else {
                Navigator.pushReplacementNamed(context, '/home');
              }
            });
          },
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu), title: Text('menu')),
            BottomNavigationBarItem(
                icon: Icon(Icons.contacts), title: Text('contacts')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text('settings'))
          ],
          selectedItemColor: globals.primaryColor,
          unselectedItemColor: Colors.blue[100],
        ),
      ),
    );
  }
}
