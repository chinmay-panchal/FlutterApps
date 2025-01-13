import 'dart:convert';

import 'package:apijson/details_screen..dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  Future signup() async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/register'), body: {
        'email': '${emailcontroller.text.toString()}',
        'password': '${passcontroller.text.toString()}'
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print('succesful');
        print(data['id']);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailsScreen(id: data['id'], token: data['token'])));
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('sign up screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: passcontroller,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: signup,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text('Register')),
                ),
              )
            ],
          ),
        ));
  }
}
