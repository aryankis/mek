import 'package:flutter/material.dart';
import 'package:mek/drawer/bottom_navigation.dart';


class Explain extends StatefulWidget {
  @override
  _ExplainState createState() => _ExplainState();
}

// SA0000 with date of birth 21 September 1993
// 01-001 with date of birth 25 februari 1982

class _ExplainState extends State<Explain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
       child: Scaffold(
         appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
           title :Text("Uitleg over de app" ,style: TextStyle(color: Colors.black),),

        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(5, 20, 5, 10),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                     padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'Uitleg over de app',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),

                  ),
                  Container(
                    child: Text(
                      'U wordt verzocht de app dagelijks in te vullen, ook als u geen bloedverlies of alleen pijn klachten heeft. \n\n'

                       'Gebruik bij voorkeur maxi maandverband en / of maxi tampons. Wees niet zuinig met het gebruik van verbanden en tampons. Houd bij voorkeur een tampon in tijdens het plassen, ontlasting, douche of bad en verwissel pas daarna. Elke keer wanneer u een verband of tampon verwijdert, vergelijkt u het zichbare bloedverlies met de afbeeldingen. Op de dagen dat u alleen wat licht bloedverlies heeft (dit heet  spotting), dan vult u bij de vraag “Heb je vandaag alleen last gehad van spotting?” JA in. Dan hoeft u geen verbanden of tampons in te vullen \n\n'

                        'Mocht u toch nog vragen hebben, neem dan contact met ons op, of kijk op onze website www.mijnmenstruatie.nl',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            /*  Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  'Settings',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),*/
              Container(
                child: Text(
                  "",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
           /*   Text(
                'How to use the app ?',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),*/
              Container(
                child: Text(
                  '',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
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
                  ),
                ])),*/
      )),
    );
  }
}
