import 'package:flutter/material.dart';
import 'package:mek/drawer/Drawer.dart';
import 'package:mek/helpers/Database_Helper.dart';
import 'package:mek/screen/spotting.dart';
import 'package:mek/screen/add_value.dart';
import 'package:localstorage/localstorage.dart';


class PainScore {
  bool changeButtonColor;
  int id;
  String name;

  PainScore({this.id, this.name, this.changeButtonColor = true});
}

int _currentIndex = 0;

// final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// void showInSnackBar(String message) {
//   scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
// }

class Onlypain extends StatefulWidget {
  final String text;
  final String ques7;
  final String ques8;
  final String ques6;
  final String ques3;
  final String ques4;
  final String ques5;

  Onlypain(
      {Key key,
        @required this.text,
        this.ques7,
        this.ques8,
        this.ques6,
        this.ques3,
        this.ques4,
        this.ques5})
      : super(key: key);


  @override
  _OnlypainState createState() => _OnlypainState(text, ques7, ques8, ques6, ques3, ques4, ques5);
}

class _OnlypainState extends State<Onlypain> {
  final dbHelper = DatabaseHelper.instance;
  List<PainScore> painScore = new List<PainScore>();
  double _currentSlidervalue;
  double _currentSlideValue;
  final String text;
  final String ques7;
  final String ques8;
  final String ques6;
  final String ques3;
  final String ques4;
  final String ques5;
  var date;

  LocalStorage storageDate = new LocalStorage('localstorage_date');

  _OnlypainState(this.text, this.ques7, this.ques8, this.ques6, this.ques3,
      this.ques4, this.ques5);

  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = text;
    print('text to send $textToSend');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Value(
              text: textToSend,
              ques7: ques7,
              ques8: ques8,
              ques3: ques3,
              ques4: ques4,
              ques5: ques5),
        ));
  }

  void _sendDataToSpottingScreen(BuildContext context) {
    String textToSend = text;

    print('text to send $textToSend');
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Spotting(text: textToSend, ques3: ques3, ques4: ques4, ques5: ques5),
        ),
    );
  }

  @override
  void initState() {
    //print("666" + ques6);

   print("only pain");
    date = storageDate.getItem("date");
    print("select calendar date");
    print(date);
    if (ques6 != null && ques6 != "null") {
      _currentSlideValue = double.parse(ques6);
    } else {
      _currentSlideValue = 0;
    }
    super.initState();
    _currentSlidervalue = 2;

    painScore = [
      new PainScore(id: 0, name: ' No Pain '),
      new PainScore(id: 1, name: ''),
      new PainScore(id: 2, name: ''),
      new PainScore(id: 3, name: ''),
      new PainScore(id: 4, name: 'Moderate Pain'),
      new PainScore(id: 5, name: ''),
      new PainScore(id: 6, name: ''),
      new PainScore(id: 7, name: ''),
      new PainScore(id: 8, name: ''),
      new PainScore(id: 9, name: 'Worst Pain'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    int sliderValue = _currentSlideValue.toInt();
    LocalStorage score = new LocalStorage('score');

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          endDrawerEnableOpenDragGesture: false,
          endDrawer: DrawerMenu(),
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.black,),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            title:  Text('TOEVOEGEN',style: TextStyle(color: Colors.black)
            ),
          ),
          body: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 15, left: 15, right: 10),
                    child: Column(
                      children: [
                        Text(date??"",style: TextStyle(color: Colors.black),),
                        /*Text(
                          text.substring(0, 2),
                        ),
                        Text(
                          text.substring(2, 5),
                        ),*/
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 540,
                          width: 1,
                          color: Color.fromRGBO(217, 217, 217, 1.0),
                        )
                      ],
                    ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(2),
                      height: 40,
                      margin: EdgeInsets.all(20),
                      width: 250,
                      child: Center(
                          child: Text(
                            'Pijn: $sliderValue',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                                fontSize: 20),
                          ),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(254, 217, 191, 0.5),
                          borderRadius: BorderRadius.circular(20)),
                    ),

                    // RotatedBox(
                    //   quarterTurns: 3,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'image/asset/green-smile.png',
                              height: 70,
                              width: 70,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Image.asset('image/asset/light-green-smile.png',
                              height: 70,
                              width: 70,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Image.asset('image/asset/yellow-smile.png',
                              height: 70,
                              width: 70,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Image.asset('image/asset/orange-smile.png',
                              height: 70,
                              width: 70,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Image.asset('image/asset/darrk-orange-smile.png',
                              height: 70,
                              width: 70,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Image.asset('image/asset/reg-smile.png',
                              height: 70,
                              width: 70,
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 490,
                          child: RotatedBox(
                            quarterTurns: 5,
                            child: Container(
                              // height: 500,

                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                    activeTickMarkColor: Colors.black,
                                    trackHeight: 40,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 20.0),
                                    thumbColor:
                                    Color.fromRGBO(255, 87, 0, 1.0),
                                    activeTrackColor: Color.fromRGBO(
                                        255, 216, 188, 1.0),
                                    disabledActiveTrackColor:
                                    Color.fromRGBO(
                                        255, 216, 188, 1.0),
                                    inactiveTrackColor: Color.fromRGBO(
                                        255, 216, 188, 1.0)),
                                child: Slider(
                                  value: _currentSlideValue ?? 2,
                                  min: 0,
                                  max: 10,
                                  divisions: 10,

                                  // label: sliderValue.toString(),
                                  // activeColor: Color.fromRGBO(255, 216, 188, 1.0),
                                  // inactiveColor: Color.fromRGBO(255, 216, 188, 1.0),

                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSlideValue = value;
                                    });
                                    print("pain value");
                                    print(_currentSlideValue);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 500,
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('geen pijn',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('milde pijn',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Text('matige pijn',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Text('veel pijn',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Text('vreselijke pijn',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Text('onhoudbare pijn ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),


                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 120, top: 4),
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: Colors.black, width: 1)),
                        child: RaisedButton(
                          child: Text(
                            "VOLGENDE",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          textColor: Colors.white,
                          color: Color.fromRGBO(255, 125, 38, 1.0),
                          onPressed: () {
                            print("slider Value");
                            print(sliderValue);
                            score.setItem('score', sliderValue);
                            print('p score is $sliderValue');
                            _sendDataToSecondScreen(context);
                          },
                        ),
                      ),
                    )
                  ],
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
    );


    /*bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _sendDataToSpottingScreen(context);
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
                                  height: 40,
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
                                  height: 40,
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, '/legend');
                              },
                            ),
                          ],
                        )


                      ]),
                ))));*/
  }
}
