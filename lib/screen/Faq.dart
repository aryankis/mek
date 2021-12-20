
import 'package:flutter/material.dart';
import 'package:mek/drawer/bottom_navigation.dart';

import 'package:mek/helpers/global_variables.dart';
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
class Ques {
  String question;

  Ques({this.question});
}

class Faq extends StatefulWidget {
  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  List<Ques> questions = new List<Ques>.empty(growable: true);

  void initState() {
    // TODO: implement initState
    super.initState();

    String today = DateTime.now().toString().substring(0, 10);
    dateInfo = today.substring(8, 10);
    var currentMonth = DateTime.now().month;
    monthInfo = months[currentMonth - 1];
    questions = [
      new Ques(question: 'Question 1 : Where do i find out my study number ? '),
      new Ques(
          question:
              'Question 2 : Can i use this app if do not participate in the research ?'),
      new Ques(
          question: 'Question 3 : Can i enter more data from previous day'),
      new Ques(question: 'Question 4 : Where do i find out my study number ? '),
      new Ques(question: 'Question 5 : Where do i find out my study number ? '),
      new Ques(question: 'Question 6 : Where do i find out my study number ? '),
      new Ques(question: 'Question 7 : Where do i find out my study number ? '),
      new Ques(question: 'Question 8 : Where do i find out my study number ? '),
      new Ques(question: 'Question 9 : Where do i find out my study number ? '),
    ];
  }

  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text('F.A.Q',style: TextStyle(color: Colors.black),),

              // child: Image.asset(
              //   'image/asset/Logo.png',
              //   width: 80,
              //   height: 80,
              // ),

          ),
          body: new ListView(
            children: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 50, 5),
                  margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  decoration: BoxDecoration(
                      color: quesColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '1.	Wat moet ik doen als ik vergeet om de app in te vullen?',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                // alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 160, right: 55),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: orgColor),
                    child: Text('ANTWOORD'),
                    onPressed: () {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      AlertDialog alert = AlertDialog(
                         title: Text("Antwoord"),
                        content: Text(
                            "Als je een datum in het verleden selecteert (bijvoorbeeld gisteren), dan kan je alsnog de vragen beantwoorden. Ja kan ok via de instellingen een herinnering aanzetten zodat je elke dag een melding krijgt om de vragen te beantwoorden. "),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }),
              ),
              SizedBox(
                height: 5,
              ),

              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 50, 5),
                  margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  decoration: BoxDecoration(
                      color: quesColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '2.	Kan ik achteraf de vragen in de app beantwoorden? ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),

              Container(
                // alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 160, right: 55),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: orgColor),
                    child: Text('ANTWOORD'),
                    onPressed: () {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      AlertDialog alert = AlertDialog(
                        title: Text("Antwoord"),
                        content: Text(
                            "Zeker, je kan de gewenste dag selecteren en de vragen beantwoorden. Je kan echter niet een dag in de toekomst selecteren.  "),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }),
              ),
              SizedBox(
                height: 5,
              ),

              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 50, 5),
                  margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  decoration: BoxDecoration(
                      color: quesColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '3.	Kan ik elke dag een melding krijgen zodat ik eraan word herinnerd om de app bij te houden?',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                // alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 160, right: 55),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: orgColor),
                    child: Text('ANTWOORD'),
                    onPressed: () {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      AlertDialog alert = AlertDialog(
                        title: Text("Antwoord"),
                        content: Text(
                            "Ja dat kan zeker. Via instellingen kun je de functie “reminder” inschakelen en ook zelf bepalen hoe laat je een herinneringsmelding wilt ontvangen. "),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }),
              ),

              SizedBox(
                height: 5,
              ),

              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 50, 5),
                  margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  decoration: BoxDecoration(
                      color: quesColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '4.	Wat moet ik doen als ik mijn pincode niet meer weet?',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                // alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 160, right: 55),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: orgColor),
                    child: Text('ANTWOORD'),
                    onPressed: () {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      AlertDialog alert = AlertDialog(
                        title: Text("Antwoord"),
                        content: Text(
                            "Alleen jij kent de pincode, je kan hem niet ergens opzoeken. Als je hem vergeten bent kan je het beste de app van je telefoon verwijderen en opnieuw installeren. Je kan dan een nieuwe pincode kiezen. Wees gerust, je eerder beantwoorde vragen worden niet verwijderd maar zullen opnieuw in je app tevoorschijn komen. "),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }),
              ),

              SizedBox(
                height: 5,
              ),
              //5

              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 50, 5),
                  margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  decoration: BoxDecoration(
                      color: quesColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '5.	Kan je de ingevulde gegevens uit de app overzetten naar je agenda van je telefoon  danwel naar een andere app?',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                // alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 160, right: 55),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: orgColor),
                    child: Text('ANTWOORD'),
                    onPressed: () {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      AlertDialog alert = AlertDialog(
                        title: Text("Antwoord"),
                        content: Text("Nee dat kan helaas (nog) niet. "),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }),
              ),

              SizedBox(
                height: 5,
              ),

              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 50, 5),
                  margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  decoration: BoxDecoration(
                      color: quesColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '6.	Ik gebruik een menstruatie cup en weet niet welk antwoord het beste past bij mijn bloedverlies. Wat vul ik dan in?',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                // alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 160, right: 55),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: orgColor),
                    child: Text('ANTWOORD'),
                    onPressed: () {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      AlertDialog alert = AlertDialog(
                        title: Text("Antwoord"),
                        content: Text(
                            "Voor dit onderzoek adviseren wij om maandverband of tampons te gebruiken. De menstruatie cup is nooit onderzocht in het verband van hevig bloedverlies, maar dat zal wel komen in de toekomst."),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }),
              ),

              SizedBox(
                height: 5,
              ),

              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 50, 5),
                  margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  decoration: BoxDecoration(
                      color: quesColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '7.	Ik gebruik pijnstillers tijdens mijn menstruatie, geef ik dan een score aan de pijn met of zonder pijnstillers?',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                // alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 160, right: 55),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: orgColor),
                    child: Text('ANTWOORD'),
                    onPressed: () {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      AlertDialog alert = AlertDialog(
                        title: Text("Antwoord"),
                        content: Text(
                            "Je moet een pijnscore aangeven zoals je het op die dag ervaren hebt, ongeacht je medicatie gebruik of je gedrag. Als je dus bijvoorbeeld door sporten een hogere pijnscore hebt, geef je toch die hogere pijnscore. Of wanneer je door pijnmedicatie een lagere pijnscore hebt, geef je toch die lagere score door. "),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }),
              ),

              SizedBox(
                height: 5,
              ),

              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 50, 5),
                  margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  decoration: BoxDecoration(
                      color: quesColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '8.	Waar staat MEK voor?',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                // alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 160, right: 55),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: orgColor),
                    child: Text('ANTWOORD'),
                    onPressed: () {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      AlertDialog alert = AlertDialog(
                        title: Text("Antwoord"),
                        content: Text(
                            "MEK staat voor Menstruatie Educatie Kalender "),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }),
              ),

              SizedBox(
                height: 5,
              ),

              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 50, 5),
                  margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  decoration: BoxDecoration(
                      color: quesColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '9.	Waarom heb ik een studienummer?',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                // alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 160, right: 55),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: orgColor),
                   // color: orgColor,
                    child: Text('ANTWOORD'),
                    onPressed: () {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      AlertDialog alert = AlertDialog(
                        title: Text("Antwoord"),
                        content: Text(
                            "Zodat de ingevulde gegevens anoniem kunnen worden opgeslagen en gebruikt voor wetenschappelijk onderzoek "),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }),
              ),

              SizedBox(
                height: 5,
              ),

              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 50, 5),
                  margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  decoration: BoxDecoration(
                      color: quesColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '10.	Heb ik internet verbinding nodig om de app te gebruiken?',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                // alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 160, right: 55),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: orgColor),
                    child: Text('ANTWOORD'),
                    onPressed: () {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      AlertDialog alert = AlertDialog(
                        title: Text("Antwoord"),
                        content: Text(
                            "Nee, voor het gebruik van de app heb je geen internetverbinding nodig. Je kan wel de vragen beantwoorden wanneer je geen internet hebt en wanneer je dan weer bereik hebt worden de antwoorden geupload voor ons onderzoek."),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }),
              ),

              SizedBox(
                height: 5,
              ),

              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 50, 5),
                  margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  decoration: BoxDecoration(
                      color: quesColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '11.	Wat gebeurd er met de ingevulde gegevens?',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                // alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 160, right: 55),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: orgColor),
                    child: Text('ANTWOORD'),
                    onPressed: () {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      AlertDialog alert = AlertDialog(
                        title: Text("Antwoord"),
                        content: Text(
                            "De gegevens worden anoniem verwerkt voor onderzoeksdoeleinden.  "),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }),
              ),

              SizedBox(
                height: 5,
              ),

              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 50, 5),
                  margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  decoration: BoxDecoration(
                      color: quesColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '12.	Stel ik verwijder de app, gaan dan alle gegevens ook verloren?',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                // alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 160, right: 55),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: orgColor),
                    child: Text('ANTWOORD'),
                    onPressed: () {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      AlertDialog alert = AlertDialog(
                        title: Text("Antwoord"),
                        content: Text(
                            "Nee, je antwoorden worden zodra je internet verbinding hebt opgeslagen in de cloud. "),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }),
              ),

              SizedBox(
                height: 5,
              ),

              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 50, 5),
                  margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  decoration: BoxDecoration(
                      color: quesColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '13.	Mijn vraag staat hier niet tussen, aan wie kan ik mijn vraag stellen?',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                // alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 160, right: 55),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: orgColor),
                    child: Text('ANTWOORD'),
                    onPressed: () {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      AlertDialog alert = AlertDialog(
                        title: Text("Antwoord"),
                        content: Text(
                            "Onder “contact“ staat het mailadres waar je naar kunt mailen. We proberen dan zo snel mogelijk antwoord te geven. "),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }),
              ),

            ],
          ),
         bottomNavigationBar: bottomNavigation(),
         /* bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/spotting');
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
                          margin: EdgeInsets.only(right: 15),
                          child: Image.asset(
                            'image/asset/new_home.png',
                            height: 40,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Image.asset(
                            'image/asset/new_leg.png',
                            height: 40,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/legend');
                        },
                      ),
                    ],
                  )
                  //  BottomNavigationBar(
                  //   onTap: (int index) {
                  //     setState(() {
                  //       _currentIndex = index;
                  //       //print(_children[_currentIndex]);

                  //       if (_currentIndex == 0) {
                  //         Navigator.pushReplacementNamed(context, '/spotting');
                  //       } else if (_currentIndex == 1) {
                  //         Navigator.pushReplacementNamed(context, '/home');
                  //       } else if (_currentIndex == 2) {
                  //         Navigator.pushReplacementNamed(context, '/contact');
                  //       } else {
                  //         Navigator.pushReplacementNamed(context, '/legend');
                  //       }
                  //     });
                  //   },
                  //   showSelectedLabels: false,
                  //   currentIndex: _currentIndex,
                  //   items: <BottomNavigationBarItem>[
                  //     BottomNavigationBarItem(
                  //         icon: Icon(
                  //           Icons.add_circle_sharp,
                  //           size: 35,
                  //           color: Colors.red,
                  //         ),
                  //         label: 'menu'),
                  //     BottomNavigationBarItem(
                  //       icon: Icon(
                  //         Icons.home_outlined,
                  //         color: Colors.red,
                  //         size: 40,
                  //       ),
                  //       label: 'home',
                  //     ),
                  //     BottomNavigationBarItem(
                  //         icon: Icon(
                  //           Icons.contacts,
                  //           size: 35,
                  //           color: Colors.red,
                  //         ),
                  //         label: 'contacts'),
                  //     BottomNavigationBarItem(
                  //         icon: Icon(
                  //           Icons.today_rounded,
                  //           size: 38,
                  //           color: Colors.red,
                  //         ),
                  //         label: 'settings')
                  //   ],
                  //   selectedItemColor: globals.primaryColor,
                  //   unselectedItemColor: Colors.blue[100],
                  // ),
                ]),
          ),*/
        ),
      ),
    );
  }
}
