import 'package:flutter/material.dart';

import 'const.dart';

class Packaging extends StatefulWidget {
  final data;
  const Packaging(this.data, {Key? key}) : super(key: key);

  @override
  _PackagingState createState() => _PackagingState();
}

class _PackagingState extends State<Packaging> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('packaging', style: Kappbartitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black87,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 9, right: 9),
          child: Column(
            children: [
              for (var d in widget.data)
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
                                      d['status'] == 1
                                          ? "Pending"
                                          : d['status'] == 2
                                              ? "Pickup"
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
            ],
          ),
        ),
      ),
    );
  }
}
