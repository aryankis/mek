import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Container(
          color: Color.fromRGBO(249, 100, 0, 1.0),
          child: ListView(
            children: [
              Container(
                height: 100,
                child: DrawerHeader(
                  child: Center(
                      child: Container(
                    child: Text('MENU',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    alignment: Alignment.topCenter,
                  )),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(249, 100, 0, 1.0),
                  ),
                ),
              ),
           /*   Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Color.fromRGBO(249, 100, 0, 1.0),
                  onTap: () => Navigator.pushReplacementNamed(context, '/home'),
                  leading: Icon(
                    Icons.home_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Dashboard',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.white,
              ),*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () => Navigator.pushReplacementNamed(context, '/home'),
                  tileColor: Color.fromRGBO(249, 100, 0, 1.0),
                  leading: Icon(
                    Icons.calendar_today_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Kalender',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/faq');
                  },
                  tileColor: Color.fromRGBO(249, 100, 0, 1.0),
                  leading: Icon(
                    Icons.question_answer_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Veel gestelde vragen',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Color.fromRGBO(249, 100, 0, 1.0),
                  onTap: () => Navigator.pushNamed(context, '/setting'),
                  leading: Icon(
                    Icons.settings_applications_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Instellingen',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Color.fromRGBO(249, 100, 0, 1.0),
                  onTap: () => Navigator.pushNamed(context, '/legend'),
                  leading: Image.asset(
                    'image/asset/paper.png',
                    height: 25,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Legenda',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Color.fromRGBO(249, 100, 0, 1.0),
                  onTap: () => Navigator.pushNamed(context, '/explain'),
                  leading:  Image.asset(
                    'image/asset/explain-app.png',
                    height: 25,
                  ),
                  title: Text('Uitlegh over de app',
                    style: TextStyle(color: Colors.white,
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Color.fromRGBO(249, 100, 0, 1.0),
                  onTap: () => Navigator.pushNamed(context, '/contact'),
                  leading: Icon(
                    Icons.alternate_email_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Contact',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 150,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  'image/asset/girl_face.png',
                  width: 100,
                  height: 70,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
