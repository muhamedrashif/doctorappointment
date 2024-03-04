import 'package:doctorappointment/screens/home_container_screen/home_container_screen.dart';
import 'package:doctorappointment/theme/custom_button_style.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://media.istockphoto.com/id/175434051/photo/green-check.jpg?s=612x612&w=0&k=20&c=LLH5yefmDwKVGKBlQJ8F7VXV2glA5KOe1at-KdhN8mk=",
              ),
              radius: 60,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Thank You!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          const Padding(
            padding: EdgeInsets.all(2.0),
            child: Text("Your Appoinment Created",
                style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: CustomElevatedButton(
                height: 48.v,
                width: 250.h,
                text: "Done",
                buttonStyle: CustomButtonStyles.fillPrimary,
                buttonTextStyle: CustomTextStyles.titleLargeOnPrimary,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) =>  HomeContainerScreen()));
                }),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(30.0),
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.of(context).pushReplacement(
          //           MaterialPageRoute(builder: (context) => const HomePage()));
          //     },
          //     // child: Container(
          //     //   child: _isLoading
          //     //       ?  const CircularProgressIndicator(
          //     //           color: Colors.white,
          //     //         )
          //     //       :  const Text('Done',
          //     //           style: TextStyle(
          //     //               color: Colors.white, fontWeight: FontWeight.w600)),
          //     //   width: MediaQuery.of(context).size.width / 2,
          //     //   alignment: Alignment.center,
          //     //   padding: const EdgeInsets.symmetric(vertical: 12),
          //     //   decoration: const ShapeDecoration(
          //     //       shape: RoundedRectangleBorder(
          //     //           borderRadius: BorderRadius.all(
          //     //         Radius.circular(4),
          //     //       )),
          //     //       color: Colors.teal),
          //     // ),
          //   ),
          // ),
        ],
      )),
    );
  }
}
