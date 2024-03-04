import 'dart:developer';
import 'package:doctorappointment/screens/home_container_screen/home_container_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_otp.dart';

class InitializerWidget extends StatefulWidget {
  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  FirebaseAuth? auth;

  User? _user;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
    _user = auth!.currentUser;
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    log("user == " + _user.toString());
    return _isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : _user == null
            ? OtpLoginScreen()
            : HomeContainerScreen();
  }
}
