import 'package:travelapp/models/user.dart';
import 'package:travelapp/screens/authenticate/register.dart';
import 'package:travelapp/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn;
  String dropdownValue = "User";
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {


      if(showSignIn == true)
        return SignInPage(toggleView:toggleView);
      else if(showSignIn == false)
        return SignUpScreen(toggleView:toggleView);
      else{
        return SafeArea(
          child: Material(
            type: MaterialType.transparency,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0,
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/bg.jpg",
                    fit: BoxFit.fitHeight,
                  ),
                ),

                Positioned(
                  left:MediaQuery.of(context).size.width - 90,
                  top: 15,
                  child: DropdownButton(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward,color: Colors.white,),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),

                    items: <String>['User','Driver'].map<DropdownMenuItem<String>>((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value,

                          style: TextStyle(
                            fontSize: 12,
                            background: Paint()..color = Color(0xff5F2F50)
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    focusColor: Colors.white,
                    autofocus: true,

                  ),

                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Image.asset(
                        "assets/images/icon.png",
                        width: 150,
                      ),
                      Spacer(),
                      Text(
                        "TraVeL",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 31,
                        ),
                      ),


                      Text(
                        "Prepare your own trip with us",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                        ),
                      ),
                      Spacer(),
                      MyButton(
                        buttonColor: Color(0xff48808d),
                        border: null,
                        buttonText: "Sign Up",
                        change:change
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      MyButton(
                        buttonColor: Colors.transparent,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        buttonText: "Sign In",
                          change:change
                      ),
                      Spacer(),
                    ],
                  ),
                )
              ],
            ),
          ),
        );

      }
  }

  void change(val){
    showSignIn = val;
    setState(() {

    });
  }
}

class MyButton extends StatelessWidget {
  final Color buttonColor;
  final Border border;
  final String buttonText;
  final Function change;
  const MyButton(
      {Key key, @required this.buttonColor, this.border, this.buttonText,this.change})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(buttonText == 'Sign Up'){
          change(false);
        }else{
          change(true);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.3,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(15),
          border: border,
        ),
        padding: EdgeInsets.symmetric(vertical: 9.0),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 21),
          ),
        ),
      ),
    );
  }
}
