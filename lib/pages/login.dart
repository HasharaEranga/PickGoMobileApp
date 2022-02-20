import '/main.dart';
import '/pages/home.dart';
import '/pages/web_api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'const.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  void initState() {
    //checkloginstatus(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                        image: AssetImage('images/assets/logo.png'),
                        height: 150.0,
                        width: 150.0),
                  ],
                ),
              ),
              Container(
                height: 180,
                margin: EdgeInsets.only(left: 20, right: 20, top: 60),
                padding: EdgeInsets.fromLTRB(18, 10, 18, 0),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffBDBDBD),
                        blurRadius: 5,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3.0)),
                child: Column(
                  children: [
                    TextField(
                        controller: email,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: maincolor,
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: Colors.black54,
                          ),
                        )),
                    SizedBox(height: 20.0),
                    TextField(
                        controller: password,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: maincolor,
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Colors.black54,
                            ))),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: maincolor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.fromLTRB(85, 11, 86, 10),
                    ),
                    onPressed: () {
                      if (email.text.isEmpty || password.text.isEmpty) {
                        return;
                      }

                      login(email.text, password.text).then((data) async {
                        if (data['status'] == '1') {
                          uid = data['data']['id'].toString();
                          user.add(data['data']);
                          print(data);
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('uid', uid);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        } else {}
                      });
                    },
                    child: Text('Login', style: Kloginbutton),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

checkloginstatus(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var value = prefs.getString('uid');
  if (value != null) {
    getMyDetails(value).then((d) {
      user.add(d);
      uid = value;
      print("********");
      print(user);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  } else {
    print(user);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );

    print("not loging");
  }
}
