import 'dart:convert';

import '/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

getbranch() async {
  var url = Uri.parse(rooturl + '/get-branches');

  var response = await http.post(url, body: {});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode != 200) {
    Fluttertoast.showToast(
        msg: "Network Error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    return [];
  }

  return jsonDecode(response.body);
}

addAvailability(from, to, time, date, capecity, details) async {
  var url = Uri.parse(rooturl + '/add-availability');

  var response = await http.post(url, body: {
    'rider_id': uid,
    'from_branch': from,
    'to_branch': to,
    'pickup_time': time,
    'date': date,
    'weight': capecity,
    'details': details,
  });
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode != 200) {
    Fluttertoast.showToast(
        msg: "Network Error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    return [];
  }

  return jsonDecode(response.body);
}

getAvailability() async {
  var url = Uri.parse(rooturl + '/get-availability');

  var response = await http.post(url, body: {'id': uid});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode != 200) {
    Fluttertoast.showToast(
        msg: "Network Error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    return [];
  }

  return jsonDecode(response.body);
}

// login(email, pass) async {
//   var url = Uri.parse(rooturl + '/login');

//   var response = await http.post(url, body: {'email': email, 'password': pass});
//   print('Response status: ${response.statusCode}');
//   print('Response body: ${response.body}');

//   if (response.statusCode != 200) {
//     Fluttertoast.showToast(
//         msg: "Network Error",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0);
//     return [];
//   }

//   return jsonDecode(response.body);
// }

//=========================================================================================

getCity() async {
  var url = Uri.parse(rooturl + '/get-city');

  var response = await http.post(url, body: {});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode != 200) {
    Fluttertoast.showToast(
        msg: "Network Error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    return [];
  }

  return jsonDecode(response.body);
}

my_product() async {
  var url = Uri.parse(rooturl + '/my-product');

  var response = await http.post(url, body: {
    'id': uid,
  });
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode != 200) {
    Fluttertoast.showToast(
        msg: "Network Error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    return [];
  }

  return jsonDecode(response.body);
}

add_product(name, email, address, state, zip, details, weight, size, sname,
    semail, sphone, saddress, city, scity, price) async {
  var url = Uri.parse(rooturl + '/addProduct');

  var response = await http.post(url, body: {
    'name': name,
    'email': email,
    'address': address,
    'state': state,
    'details': details,
    'weight': weight,
    'size': size,
    'sname': sname,
    'semail': semail,
    'sphone': sphone,
    'saddress': saddress,
    'city': city,
    'scity': scity,
    'price': price,
    'cid': uid,
  });
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode != 200) {
    Fluttertoast.showToast(
        msg: "Network Error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    return [];
  }

  return jsonDecode(response.body);
}

login(email, pass) async {
  var url = Uri.parse(rooturl + '/login');

  print(url);

  var response = await http.post(url, body: {'email': email, 'password': pass});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode != 200) {
    Fluttertoast.showToast(
        msg: "Network Error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    return [];
  }

  return jsonDecode(response.body);
}

getMyDetails(uid) async {
  var url = Uri.parse(rooturl + '/my-details');

  var response = await http.post(url, body: {'id': uid});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode != 200) {
    Fluttertoast.showToast(
        msg: "Network Error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    return [];
  }

  return jsonDecode(response.body);
}

calc_price(w, s, sc, ec) async {
  var url = Uri.parse(rooturl + '/price');

  var response = await http
      .post(url, body: {'weight': w, 'size': s, 'start': sc, 'end': ec});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode != 200) {
    Fluttertoast.showToast(
        msg: "Network Error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    return [];
  }

  return jsonDecode(response.body);
}
