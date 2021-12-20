import 'package:mek/helpers/global_variables.dart' as globals;
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class Confirm extends StatefulWidget {
  String text;

  @override
  Confirm({Key key, @required this.text}) : super(key: key);

  _ConfirmState createState() => _ConfirmState(text);
}

class _ConfirmState extends State<Confirm> {
  final text;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void showInSnackBar(String message) {
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
    
  }

  _ConfirmState(this.text);
  TextEditingController pinNumberConfirm = new TextEditingController();
  LocalStorage userKey = new LocalStorage('userKey');

  confirmPin() {
    if (text == pinNumberConfirm.text) {
      //   String text1 = text;
      //  Navigator.pop(context, text1);
      userKey.setItem('userKey', pinNumberConfirm.text);
      Navigator.pushReplacementNamed(context, '/setting');
    } else {
      showInSnackBar("Pin Does not Match");
      print('NO match');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[

          Container(
          //  child: Text('hello'),
          ),

          // Container(
          //   child: Image.asset('image/logo.png',
          //   height: 50,
          //   width: 50,),
          // )
          // ,
          // Container(
          //   height: MediaQuery.of(context).size.height / 2.5,
          //   width: MediaQuery.of(context).size.width,
          //   color: globals.primaryColor,
          //   child: Image.asset(
          //     'image/asset/Logob.png',
          //     width: 150,
          //     height: 150,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: pinNumberConfirm,
                          style: new TextStyle(
                            fontSize: 15.0,
                          ),
                          decoration: InputDecoration(
                            errorText: "wrong password",
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            border: UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: globals.secondaryColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: globals.primaryColor)),
                            //icon: Icon(Icons.calendar_today,),
                            hintText: 'PIN',
                            suffixStyle: TextStyle(fontSize: 10),
                            labelText: 'Please Choose A Security Code',
                          ),

                          // Navigator.pushNamed(context,  '/afterCalender')
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          autofocus: true,
                          onSubmitted: (ss) {
                            confirmPin();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: () async {
                          confirmPin();
                        },
                        color: Colors.orange,
                        textColor: Colors.white,
                        elevation: 1.0,
                        child: Text('Confirm', style: TextStyle(fontSize: 15)),
                        padding: EdgeInsets.all(15.0),
                        // shape: CircleBorder(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
