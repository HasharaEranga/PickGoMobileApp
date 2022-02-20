import '/main.dart';
import '/pages/home.dart';
import '/pages/success_shipment.dart';
import '/pages/web_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'const.dart';

class Shipment extends StatefulWidget {
  const Shipment({Key? key}) : super(key: key);

  @override
  _ShipmentState createState() => _ShipmentState();
}

class _ShipmentState extends State<Shipment> {
  var cities = [];
  var city_hint = "select city";
  var scity_hint = "select city";
  var city = "";
  var scity = "";
  var price = "";
  var name = TextEditingController();
  var email = TextEditingController();
  var address = TextEditingController();
  var state = TextEditingController();
  var zip = TextEditingController();
  var details = TextEditingController();
  var weight = TextEditingController();
  var size = TextEditingController();
  var sname = TextEditingController();
  var semail = TextEditingController();
  var sphone = TextEditingController();
  var saddress = TextEditingController();

  @override
  void initState() {
    getCity().then((v) {
      cities.addAll(v);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Add Shipment', style: Kappbartitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black87,
          onPressed: () => Navigator.pop(context, true),
        ),
      ),
      bottomSheet: Container(
        child: Container(
          width: double.infinity,
          height: 80.0,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: maincolor,
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                // padding: EdgeInsets.fromLTRB(134.42, 12.19, 133.58, 12.81),
              ),
              onPressed: () {
                // if (pickup == "") showmsg("Please Select Pickup branch");
                if (city == "" ||
                    scity == "" ||
                    name.text.isEmpty ||
                    email.text.isEmpty ||
                    address.text.isEmpty ||
                    state.text.isEmpty ||
                    zip.text.isEmpty ||
                    details.text.isEmpty ||
                    weight.text.isEmpty ||
                    size.text.isEmpty ||
                    sname.text.isEmpty ||
                    semail.text.isEmpty ||
                    sphone.text.isEmpty ||
                    saddress.text.isEmpty) {
                  showmsg("Please Fill Details");
                  return;
                }
                add_product(
                        name.text,
                        email.text,
                        address.text,
                        state.text,
                        zip.text,
                        details.text,
                        weight.text,
                        size.text,
                        sname.text,
                        semail.text,
                        sphone.text,
                        saddress.text,
                        city,
                        scity,
                        price)
                    .then((vv) {
                  print(vv);
                  showmsg("Successfully added your request");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          success_shipment(vv['price'], vv['time']),
                    ),
                  );
                });
              },
              child: Text('Conform', style: Kloginbutton),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Billing Name', style: Kformhead),
                ],
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.4, color: Colors.grey),
                ),
                child: TextField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(top: 1, left: 15, bottom: 15),
                    hintText: 'Billing Name',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Billing Email', style: Kformhead),
                ],
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.4, color: Colors.grey),
                ),
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(top: 1, left: 15, bottom: 15),
                    hintText: 'Billing Email',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Billing Address', style: Kformhead),
                ],
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.4, color: Colors.grey),
                ),
                child: TextField(
                  controller: address,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(top: 1, left: 15, bottom: 15),
                    hintText: 'Billing Address',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Billing State', style: Kformhead),
                ],
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.4, color: Colors.grey),
                ),
                child: TextField(
                  controller: state,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(top: 1, left: 15, bottom: 15),
                    hintText: 'Billing State',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Billing Zip', style: Kformhead),
                ],
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.4, color: Colors.grey),
                ),
                child: TextField(
                  controller: zip,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(top: 1, left: 15, bottom: 15),
                    hintText: 'Billing Zip',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Billing City',
                    style: Kformhead,
                  ),
                  Text('*', style: Kformrequset),
                ],
              ),
              SizedBox(height: 5),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffFFFFFF),
                  border: Border.all(width: 0.4, color: Colors.grey),
                ),
                padding: EdgeInsets.only(left: 15, right: 15),
                child: DropdownButton(
                  //borderRadius: BorderRadius.circular(10),
                  hint: Text(
                    city_hint,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
                    ),
                  ),
                  underline: SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  isExpanded: true,
                  elevation: 8,
                  style: const TextStyle(color: Colors.deepPurple),
                  // underline: Container(
                  //   height: 2,
                  //   color: Colors.deepPurpleAccent,
                  // ),
                  onChanged: (newValue) {
                    var s = [];
                    s.add(newValue);
                    setState(() {
                      city = s[0]['id'].toString();
                      city_hint = s[0]['name'];
                    });
                  },
                  items: cities.map<DropdownMenuItem>((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value['name']),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Sender Name', style: Kformhead),
                ],
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.4, color: Colors.grey),
                ),
                child: TextField(
                  controller: sname,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(top: 1, left: 15, bottom: 15),
                    hintText: 'Sender Name',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Sender Email', style: Kformhead),
                ],
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.4, color: Colors.grey),
                ),
                child: TextField(
                  controller: semail,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(top: 1, left: 15, bottom: 15),
                    hintText: 'Sender Email',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Sender Phone', style: Kformhead),
                ],
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.4, color: Colors.grey),
                ),
                child: TextField(
                  controller: sphone,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(top: 1, left: 15, bottom: 15),
                    hintText: 'Sender Phone',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Sender Address', style: Kformhead),
                ],
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.4, color: Colors.grey),
                ),
                child: TextField(
                  controller: saddress,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(top: 1, left: 15, bottom: 15),
                    hintText: 'Sender Address',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Senter City',
                    style: Kformhead,
                  ),
                  Text('*', style: Kformrequset),
                ],
              ),
              SizedBox(height: 5),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffFFFFFF),
                  border: Border.all(width: 0.4, color: Colors.grey),
                ),
                padding: EdgeInsets.only(left: 15, right: 15),
                child: DropdownButton(
                  //borderRadius: BorderRadius.circular(10),
                  hint: Text(
                    scity_hint,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
                    ),
                  ),
                  underline: SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  isExpanded: true,
                  elevation: 8,
                  style: const TextStyle(color: Colors.deepPurple),
                  // underline: Container(
                  //   height: 2,
                  //   color: Colors.deepPurpleAccent,
                  // ),
                  onChanged: (newValue) {
                    var s = [];
                    s.add(newValue);
                    setState(() {
                      scity = s[0]['id'].toString();
                      scity_hint = s[0]['name'];
                    });
                  },
                  items: cities.map<DropdownMenuItem>((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value['name']),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Package Details', style: Kformhead),
                ],
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.4, color: Colors.grey),
                ),
                child: TextField(
                  controller: details,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(top: 1, left: 15, bottom: 15),
                    hintText: 'Package Details',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Package Weight (Kg)', style: Kformhead),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.4, color: Colors.grey),
                      ),
                      height: 45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextField(
                              controller: weight,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    top: 1, left: 15, bottom: 15),
                                hintText: 'enter capacity',
                                hintStyle: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0x80000000),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Kg',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Package Size - W * L * H (cm)', style: Kformhead),
                ],
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.4, color: Colors.grey),
                ),
                child: TextField(
                  controller: size,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(top: 1, left: 15, bottom: 15),
                    hintText: '10*10*10',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
