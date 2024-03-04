import 'package:flutter/material.dart';

class DoctorScreen extends StatefulWidget {
  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Colors.teal[200], // You can set your desired background color
      body:  Column(
        children: [
          
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'Doctor',
                style: TextStyle(
                 
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
