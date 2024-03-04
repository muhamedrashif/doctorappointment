import 'dart:developer';
import 'package:doctorappointment/screens/home_container_screen/home_container_screen.dart';
import 'package:doctorappointment/screens/splash_screen/start_screen.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadCounter();

    // Add a delay to simulate the splash screen duration
    // Timer(const Duration(seconds: 8), () {
    //   // Navigate to the main screen after the delay
    //
    // });
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    log("isLoggedIn = " + isLoggedIn.toString());

    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomeContainerScreen()));
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const StartScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.teal[200], // You can set your desired background color
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            const Spacer(),
            // Replace this with your app's logo or branding
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 200.adaptSize,
                    width: 200.adaptSize,
                    decoration: AppDecoration.fillPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder131),
                    child: CustomImageView(
                        imagePath: ImageConstant.asianFemale,
                        height: 200.adaptSize,
                        width: 200.adaptSize,
                        radius: BorderRadius.circular(131.h),
                        alignment: Alignment.center)),
                // child: CircleAvatar(
                //   backgroundImage: NetworkImage(
                //       "https://media.istockphoto.com/id/1522597990/photo/tranquil-healthcare-background-with-copy-space.jpg?s=612x612&w=0&k=20&c=4d8SIgUZfh35NfkdrynwxxJ-Wu0O-Ke3vuCpalsRs6Y="),
                //   radius: 60,
                //   //child: Image.network("https://media.istockphoto.com/id/1417080439/photo/water-drop-splash-on-the-blue-background.webp?b=1&s=170667a&w=0&k=20&c=SN_Bp-za0GIYa3nya6P4okt35205Mt7SeoMjzMs61to=",
                //   //  width: MediaQuery.of(context).size.width*0.3,
                //   //  ),
                // ),
              ),
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  'Health Hub',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
