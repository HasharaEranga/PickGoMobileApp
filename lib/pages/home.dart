import '/pages/account.dart';

import '/pages/const.dart';
import '/pages/packaging.dart';
import '/pages/shipment.dart';
import '/pages/web_api.dart';
import 'package:flutter/material.dart';

var data = [];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    my_product().then((v) {
      data = v;
      setState(() {});
    });

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          const Image(
                              image: AssetImage('images/assets/logo.png'),
                              height: 110.0,
                              width: 110.0),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: maincolor.withOpacity(0.1)),
                            child: Image(
                              image: AssetImage('images/assets/add.png'),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Shipment(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 5.0),
                        TextButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                              minimumSize: MaterialStateProperty.all(Size.zero),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Shipment(),
                                ),
                              );
                            },
                            child: Text(
                              'Add',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: maincolor.withOpacity(0.1)),
                            child: Image(
                              image: AssetImage('images/assets/balance.png'),
                            ),
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
                        SizedBox(height: 5.0),
                        TextButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                              minimumSize: MaterialStateProperty.all(Size.zero),
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
                            child: Text(
                              'My Packages',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: maincolor.withOpacity(0.1)),
                            child: Image(
                                image: AssetImage('images/assets/tracking.png'),
                                height: 98.0,
                                width: 97.0),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Account(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 5.0),
                        TextButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                              minimumSize: MaterialStateProperty.all(Size.zero),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Account(),
                                ),
                              );
                            },
                            child: Text(
                              'Account',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),

                for (var d in data)
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: maincolor.withOpacity(0.1),
                        ),
                        height: 140,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 5),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Image(
                                      image: AssetImage('images/assets/1.png'),
                                      height: 49,
                                      width: 48,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('status', style: Khomefirstrow),
                                    Text(
                                        d['status'] == 0
                                            ? "Pending"
                                            : d['status'] == 1
                                                ? "Pickup"
                                                : d['status'] == 2
                                                    ? "Delivering"
                                                    : d['status'] == 3
                                                        ? "Delivering"
                                                        : d['status'] == 4
                                                            ? "Delivering"
                                                            : d['status'] == 5
                                                                ? "Delivering"
                                                                : "Completed",
                                        style: Khomesecondrow),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('From', style: Khomethirdrow),
                                    Text(d['saddress'], style: Khomefirstrow),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Text('Price', style: Khomethirdrow),
                                    // Text('¥300', style: Khomefirstrow),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  SizedBox(height: 30),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('To', style: Khomethirdrow),
                                  Text(d['address'], style: Khomefirstrow),
                                ],
                              )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 20),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: maincolor.withOpacity(0.1),
                //   ),
                //   height: 140,
                //   child: Padding(
                //     padding: EdgeInsets.only(
                //         left: 10, right: 10, top: 10, bottom: 5),
                //     child: Row(
                //       children: [
                //         Expanded(
                //           child: Column(
                //             children: [
                //               Image(
                //                 image: AssetImage('images/assets/2.png'),
                //                 height: 49,
                //                 width: 48,
                //               ),
                //             ],
                //           ),
                //         ),
                //         SizedBox(
                //           width: 10,
                //         ),
                //         Expanded(
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text('status', style: Khomefirstrow),
                //               Text('shipping ', style: Khomesecondrow),
                //               SizedBox(
                //                 height: 10,
                //               ),
                //               Text('From', style: Khomethirdrow),
                //               Text('colombo', style: Khomefirstrow),
                //               SizedBox(
                //                 height: 10,
                //               ),
                //               Text('Price', style: Khomethirdrow),
                //               Text('¥300', style: Khomefirstrow),
                //               SizedBox(
                //                 height: 5,
                //               ),
                //             ],
                //           ),
                //         ),
                //         Expanded(
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text('Timer', style: Khomefirstrow),
                //               Text('08:00d', style: Khomesecondrow),
                //               SizedBox(
                //                 height: 10,
                //               ),
                //               Icon(
                //                 Icons.arrow_forward,
                //                 size: 20,
                //                 color: Colors.black,
                //               ),
                //             ],
                //           ),
                //         ),
                //         Expanded(
                //           child: Column(
                //             children: [
                //               ElevatedButton(
                //                 onPressed: () {},
                //                 child: Text(
                //                   'Map',
                //                   style: TextStyle(fontSize: 12),
                //                 ),
                //                 style: ElevatedButton.styleFrom(
                //                   primary: maincolor,
                //                   shape: CircleBorder(),
                //                   padding: EdgeInsets.all(20),
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 10,
                //               ),
                //               Text('To', style: Khomethirdrow),
                //               Text('kaluthara', style: Khomefirstrow),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
