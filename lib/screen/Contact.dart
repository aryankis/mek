import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('CONTACT',style: TextStyle(color: Colors.black),)
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  'WebSite: www.mekapp.com',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),

                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Email: contact@mek.app',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),

                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 5,
                  color: Colors.grey,
                )

                // Text(('Contact'.tr()),
                //     style: new TextStyle(
                //       fontSize: 30.0,
                //     )),

                // Column(
                //   children: <Widget>[
                //     Padding(
                //       padding: const EdgeInsets.all(12.0),
                //       child: Text('Website :www.oconstudy.com',
                //           style: new TextStyle(
                //             fontSize: 20.0,
                //           )),
                //     )
                //   ],
                // ),

                // Column(
                //   children: <Widget>[
                //     Padding(
                //       padding: const EdgeInsets.all(12.0),
                //       child: Text('Email : info@oconstudy.com',
                //           style: new TextStyle(
                //             fontSize: 20.0,
                //           )),
                //     )
                //   ],
                // ),

                /*       Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.blue,
                      ),
                      Text('contact'),
                    ],
                  ),
                ),
                Text('Bel  ons op :020 -444 444 4'),
                SizedBox(
                  height: 5,
                ),
                Text('info@mijnmenstruatie.nl'),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  height: 5,
                  color: Colors.grey,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.timelapse, color: Colors.blue),
                      Text('Onderzoeksinformatie'),
                    ],
                  ),
                ),
                Text('METC geodkeuring : XXX'),
                SizedBox(
                  height: 5,
                ),
                Text('Hoofdonderzoeker: prof. Dr J.A.F Huirne'),
                SizedBox(
                  height: 5,
                ),
                Text('Contactpersoon: Dr. R.A de Leeuw '),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Container(
                    height: 80,
                    width: 150,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'image/asset/adam_one.png',
                      width: 100,
                      height: 70,
                    ),
                  ),
                )*/
              ],
            ),
          ),
        ),
      ),
/*      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            //print(_children[_currentIndex]);

            if (_currentIndex == 1) {
              Navigator.pushNamed(context, '/home');
            } else if (_currentIndex == 2) {
              Navigator.pushReplacementNamed(context, '/contact');
            } else if (_currentIndex == 3) {
              Navigator.pushNamed(context, '/setting');
            } else {
              Navigator.pushReplacementNamed(context, '/home');
            }
          });
        },
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_sharp,
                size: 35,
                color: Colors.red,
              ),
              label: 'menu'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.red,
              size: 40,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.contacts,
                size: 35,
                color: Colors.red,
              ),
              label: 'contacts'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.today_rounded,
                size: 38,
                color: Colors.red,
              ),
              label: 'settings')
        ],
        selectedItemColor: globals.primaryColor,
        unselectedItemColor: Colors.blue[100],
      ),*/
    );
  }
}
