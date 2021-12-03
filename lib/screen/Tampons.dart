import 'package:flutter/material.dart';
import 'package:mek/helpers/GlobalVariables.dart' as globals;

class Tampons extends StatefulWidget {
  _TamponsState createState() => _TamponsState();
}

class _TamponsState extends State<Tampons> {
 
  int _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
       persistentFooterButtons: <Widget>[
        RaisedButton.icon(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          label: Text("Prevoius", style: TextStyle(fontSize: 10,color: Colors.black)),
          textColor: Colors.white,
          color: globals.primaryColor,
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/pads');
          },
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: RaisedButton.icon(
            label: Text("Next", style: TextStyle(fontSize: 10)),
            icon: Icon(Icons.arrow_forward),
            textColor: Colors.white,
            color: globals.primaryColor,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/onlypain');
            },
          ),
        ),
      ],
      //resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
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
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text('menu')),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text('contacts')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('settings'))
        ],
        selectedItemColor: globals.primaryColor,
        unselectedItemColor: Colors.blue[100],
      ),
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'image/asset/Logo.png',
            width: 80,
            height: 80,
          ),
        ),
      ),
      body:Center(child: Text('tampoons'),)
      
    );
  }
}
