import '/main.dart';
import '/pages/home.dart';
import '/pages/login.dart';
import '/pages/packaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'const.dart';

class Account extends StatefulWidget {
  const Account({
    Key? key,
  }) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffBDBDBD),
                          blurRadius: 5,
                        )
                      ],
                      color: Colors.white),
                  child: Image(
                    image: AssetImage('images/assets/profile.png'),
                  ),
                ),
                SizedBox(height: 3),
                Text(user[0]['name'],
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff000000),
                    )),
                Text(
                  user[0]['email'],
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: Color(0x4D000000),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Account', style: Kinboxtext),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Image(
                              image: AssetImage('images/assets/8.png'),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          TextButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                minimumSize:
                                    MaterialStateProperty.all(Size.zero),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              },
                              child: Text('Home', style: Kaccountrequest))
                        ],
                      ),
                    ),
                    IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: maincolor,
                        iconSize: 15,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        }),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Color(0xffE5E5E5),
                  ),
                  height: 1,
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Image(
                              image: AssetImage('images/assets/9.png'),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Packaging(data),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          TextButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                minimumSize:
                                    MaterialStateProperty.all(Size.zero),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Packaging(data),
                                  ),
                                );
                              },
                              child:
                                  Text('my packaging', style: Kaccountrequest))
                        ],
                      ),
                    ),
                    IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: maincolor,
                        iconSize: 15,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Packaging(data),
                            ),
                          );
                        }),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Color(0xffE5E5E5),
                  ),
                  height: 1,
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('General', style: Kinboxtext),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('images/assets/12.png'),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          TextButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                minimumSize:
                                    MaterialStateProperty.all(Size.zero),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {},
                              child: Text('Help & Support',
                                  style: Kaccountrequest))
                        ],
                      ),
                    ),
                    IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: maincolor,
                        iconSize: 15,
                        onPressed: () {}),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Color(0xffE5E5E5),
                  ),
                  height: 1,
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('images/assets/13.png'),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          TextButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                minimumSize:
                                    MaterialStateProperty.all(Size.zero),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {},
                              child: Text('Term & Conditions',
                                  style: Kaccountrequest))
                        ],
                      ),
                    ),
                    IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: maincolor,
                        iconSize: 15,
                        onPressed: () {}),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Color(0xffE5E5E5),
                  ),
                  height: 1,
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('images/assets/14.png'),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          TextButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                minimumSize:
                                    MaterialStateProperty.all(Size.zero),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {},
                              child: Text('Privacy Policy',
                                  style: Kaccountrequest))
                        ],
                      ),
                    ),
                    IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: maincolor,
                        iconSize: 15,
                        onPressed: () {}),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Color(0xffE5E5E5),
                  ),
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('images/assets/11.png'),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          TextButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                minimumSize:
                                    MaterialStateProperty.all(Size.zero),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () async {
                                SharedPreferences preferences =
                                    await SharedPreferences.getInstance();
                                await preferences.remove('uid');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ),
                                );
                              },
                              child: Text('Logout', style: Kaccountrequest))
                        ],
                      ),
                    ),
                    IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: maincolor,
                        iconSize: 15,
                        onPressed: () async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          await preferences.remove('uid');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
