import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mek/screen/spotting.dart';

class bottomNavigation extends StatefulWidget {
  @override
  bottomNavigationState createState() => bottomNavigationState();
}

class bottomNavigationState extends State<bottomNavigation> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>Spotting()));
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

    );
  }
}





