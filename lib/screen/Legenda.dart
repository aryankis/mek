import 'package:flutter/material.dart';
import 'package:mek/drawer/Bottom_Navigation.dart';

class Legenda extends StatefulWidget {
  @override
  _LegendaState createState() => _LegendaState();
}

class _LegendaState extends State<Legenda> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 3;

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.black,),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            title:Text('LEGENDA',style: TextStyle(color: Colors.black),),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 42,
                                width: 42,
                                padding: EdgeInsets.only(top: 25),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(21)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'image/asset/spots.png',
                                      width: 10,
                                      height: 10,
                                    ),
                                    Image.asset(
                                      'image/asset/spots.png',
                                      width: 10,
                                      height: 10,
                                    ),
                                    Image.asset(
                                      'image/asset/spots.png',
                                      width: 10,
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Container(
                                height: 42,
                                width: 42,
                                padding: EdgeInsets.only(top: 25),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(21)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'image/asset/spots.png',
                                      width: 10,
                                      height: 10,
                                    ),
                                    Image.asset(
                                      'image/asset/spots.png',
                                      width: 10,
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Container(
                                height: 42,
                                width: 42,
                                padding: EdgeInsets.only(
                                    top: 25, left: 15, right: 15, bottom: 3),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(21)),
                                child: Image.asset(
                                  'image/asset/spots.png',
                                  width: 10,
                                  height: 10,
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Container(
                                  height: 42,
                                  width: 42,
                                  padding: EdgeInsets.only(
                                      top: 10, left: 15, right: 15, bottom: 3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(21),
                                    border: Border.all(color: Colors.orange),
                                  ),
                                  child: Container(
                                    child: Image.asset(
                                      'image/asset/blank_agin.png',
                                      width: 10,
                                      height: 10,
                                    ),
                                  )),
                              SizedBox(
                                height: 1,
                              ),
                              Container(
                                height: 42,
                                width: 42,
                                padding: EdgeInsets.only(
                                    top: 25, left: 15, right: 15, bottom: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(21),
                                  border: Border.all(color: Colors.orange),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hevig bloedverlies',
                                  style: TextStyle(
                                      color:
                                          Color.fromRGBO(117, 117, 117, 1.0))),
                              SizedBox(
                                height: 25,
                              ),
                              Text('Mild bloedverlies',
                                  style: TextStyle(
                                      color:
                                          Color.fromRGBO(117, 117, 117, 1.0))),
                              SizedBox(
                                height: 25,
                              ),
                              Text('Weinig bloedverlies',
                                  style: TextStyle(
                                      color:
                                          Color.fromRGBO(117, 117, 117, 1.0))),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                'Spotting',
                                style: TextStyle(
                                    color: Color.fromRGBO(117, 117, 117, 1.0)),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text('Geen bloedverlies',
                                  style: TextStyle(
                                      color:
                                          Color.fromRGBO(117, 117, 117, 1.0)))
                            ],
                          ),
                        ],
                      )

                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Container(
                      //         height: 42,
                      //         width: 42,
                      //         padding: EdgeInsets.only(top: 25),
                      //         decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.orange),
                      //             borderRadius: BorderRadius.circular(20)),
                      //         child: Row(
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: <Widget>[
                      //             Image.asset(
                      //               'image/asset/spots.png',
                      //               width: 10,
                      //               height: 10,
                      //             ),
                      //             Image.asset(
                      //               'image/asset/spots.png',
                      //               width: 10,
                      //               height: 10,
                      //             ),
                      //             Image.asset(
                      //               'image/asset/spots.png',
                      //               width: 10,
                      //               height: 10,
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 50,
                      //       ),
                      //       Text('Hevig bloedverlies',
                      //           style: TextStyle(
                      //               color: Color.fromRGBO(117, 117, 117, 1.0)))
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(right: 70),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Container(
                      //         height: 42,
                      //         width: 42,
                      //         padding: EdgeInsets.only(top: 25),
                      //         decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.orange),
                      //             borderRadius: BorderRadius.circular(20)),
                      //         child: Row(
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: <Widget>[
                      //             Image.asset(
                      //               'image/asset/spots.png',
                      //               width: 10,
                      //               height: 10,
                      //             ),
                      //             Image.asset(
                      //               'image/asset/spots.png',
                      //               width: 10,
                      //               height: 10,
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 50,
                      //       ),
                      //       Text('Mild bloedverlies',
                      //           style: TextStyle(
                      //               color: Color.fromRGBO(117, 117, 117, 1.0)))
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(right: 60, bottom: 20),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Row(
                      //         children: <Widget>[
                      //           Container(
                      //             height: 42,
                      //             width: 42,
                      //             padding: EdgeInsets.only(
                      //                 top: 25, left: 15, right: 15, bottom: 3),
                      //             decoration: BoxDecoration(
                      //                 border: Border.all(color: Colors.orange),
                      //                 borderRadius: BorderRadius.circular(20)),
                      //             child: Image.asset(
                      //               'image/asset/spots.png',
                      //               width: 10,
                      //               height: 10,
                      //             ),
                      //           ),
                      //           // Image.asset(
                      //           //   'image/asset/spots.png',
                      //           //   width: 10,
                      //           //   height: 10,
                      //           // ),
                      //           // Image.asset(
                      //           //   'image/asset/spots.png',
                      //           //   width: 10,
                      //           //   height: 10,
                      //           // ),
                      //         ],
                      //       ),
                      //       SizedBox(
                      //         width: 50,
                      //       ),
                      //       Text('Weinig bloedverlies',
                      //           style: TextStyle(
                      //               color: Color.fromRGBO(117, 117, 117, 1.0)))
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(right: 135, bottom: 10),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Container(
                      //           height: 42,
                      //           width: 42,
                      //           padding: EdgeInsets.only(
                      //               top: 10, left: 15, right: 15, bottom: 3),
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(20),
                      //             border: Border.all(color: Colors.orange),
                      //           ),
                      //           child: Container(
                      //             child: Image.asset(
                      //               'image/asset/blank_agin.png',
                      //               width: 10,
                      //               height: 10,
                      //             ),
                      //           )
                      //           ),
                      //       SizedBox(
                      //         width: 50,
                      //       ),
                      //       Text(
                      //         'Spotting',
                      //         style: TextStyle(
                      //             color: Color.fromRGBO(117, 117, 117, 1.0)),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(right: 80, bottom: 20),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Container(
                      //         height: 42,
                      //         width: 42,
                      //         padding: EdgeInsets.only(
                      //             top: 25, left: 15, right: 15, bottom: 3),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(20),
                      //           border: Border.all(color: Colors.orange),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 50,
                      //       ),
                      //       Text('Geen bloedverlies',
                      //           style: TextStyle(
                      //               color: Color.fromRGBO(117, 117, 117, 1.0)))
                      // ],
                      ),
             /*     Divider(
                    height: 5,
                    color: Colors.grey,
                    indent: 20,
                    endIndent: 20,
                  ),*/
                  /*    Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                        'Gebruik bij voorkeur maxi maandverband en / of maxi tampons.  '
                            'Wees niet zuinig met het gebruik van verbanden en tampons en '
                            'probeer hierin zoveel mogelijk al het menstruatiebloed op te vangen. '
                            ' Houd bij woorkeur een tampon in tijdens plassen, ontlasting, douche of '
                            'bad en verwissel pas daarna.  Elke keer wanneer u een verband of tampon'
                            ' verwijdert, vergelijkt u het zichtbare bloedverlies met de afbeeldingen. '
                            ' Op de dagen dat u alleen wat licht bioedverlies heett (spotting vult u.alleen '
                            'spotting ja in. ',
                        style: TextStyle(color: Colors.grey, wordSpacing: 2)),
                  ),*/
               /*  Container(
                      margin: EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'image/asset/tam1.png',
                            width: 60,
                            height: 60,
                          ),
                          Image.asset(
                            'image/asset/tam2.png',
                            width: 60,
                            height: 60,
                          ),
                          Image.asset(
                            'image/asset/tam3.png',
                            width: 60,
                            height: 60,
                          ),
                        ],
                      ),
                  ),*/

                /*SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'image/asset/padone.png',
                          width: 60,
                          height: 60,
                        ),

                        // SizedBox(width: 5),
                        Image.asset(
                          'image/asset/padtwo.png',
                          width: 60,
                          height: 60,
                        ),
                        Image.asset(
                          'image/asset/padthree.png',
                          width: 60,
                          height: 60,
                        ),
                      ],
                    ),
                  ),*/
                ],
              ),
            ),
          ),
          bottomNavigationBar: bottomNavigation(),
          /*bottomNavigationBar: Padding(
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
                ]),
          ),*/
        ),
      ),
    );
    // TODO: implement build
  }
}
