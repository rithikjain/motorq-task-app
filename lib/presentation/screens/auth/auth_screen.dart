import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vitclasses/presentation/widgets/snackbar.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _regNoController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 52),
              RichText(
                text: TextSpan(
                  text: "VIT",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: " Classes",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Let's get you started 😊",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 64),
              Text("Registration Number"),
              SizedBox(height: 8),
              TextField(
                controller: _regNoController,
                maxLines: 1,
                decoration: InputDecoration(hintText: '19BDS0014'),
              ),
              SizedBox(height: 32),
              Text("Name"),
              SizedBox(height: 8),
              TextField(
                controller: _nameController,
                maxLines: 1,
                decoration: InputDecoration(hintText: 'Rithik Jain'),
              ),
              SizedBox(height: 64),
              Container(
                width: double.maxFinite,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    if (_nameController.value.text.isNotEmpty &&
                        _regNoController.value.text.isNotEmpty) {
                      log("Move forward");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        errorSnackbar("Please fill both the fields :)"),
                      );
                    }
                  },
                  child: Text("Let's go"),
                ),
              ),
              SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}
