import 'package:doctorappointment/screens/doctor/doctor.dart';
import 'package:doctorappointment/screens/otp/checking.dart';
import 'package:doctorappointment/theme/custom_button_style.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_elevated_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  // void navigateToHome() {
  //   Navigator.of(context)
  //       .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  // }
  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapPATIENT(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => InitializerWidget()));
    // Navigator.pushNamed(context, AppRoutes.homeContainerScreen);
  }

  onTapDoctor(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => DoctorScreen()));
    // Navigator.pushNamed(context, AppRoutes.homeContainerScreen);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimary.withOpacity(1),
            body: SizedBox(
                height: mediaQueryData.size.height,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.topCenter, children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                          height: 1067.v,
                          width: double.maxFinite,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 490,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(171, 234, 223, 1),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.elliptical(818, 290),
                                        topRight: Radius.elliptical(140, -325),
                                      )),
                                ),
                                CustomImageView(
                                    imagePath: ImageConstant.imgAsianFemaleDo,
                                    height: 1096.v,
                                    width: 350.h,
                                    alignment: Alignment.topCenter),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        height: 636.v,
                                        width: double.maxFinite,
                                        margin: EdgeInsets.only(top: 493.v),
                                        child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 560,
                                                decoration: const BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        0, 135, 113, 1),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.elliptical(
                                                              718, 590),
                                                      topRight:
                                                          Radius.elliptical(
                                                              718, 590),
                                                    )),
                                              ),
                                              _buildEightyOne(context)
                                            ])))
                              ]))),
                ]))));
  }

  /// Section Widget
  Widget _buildEightyOne(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
            padding: EdgeInsets.only(left: 32.h, top: 59.v, right: 32.h),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  width: 309.h,
                  margin: EdgeInsets.symmetric(horizontal: 8.h),
                  child: Text("BOOK \nYOUR APPOINMENT",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineLarge)),
              SizedBox(height: 22.v),
              SizedBox(
                  width: 325.h,
                  child: Text(
                      "Effortlessly book and manage doctor consultations with our clinic's dedicated app for a streamlined and patient-centric healthcare experience.",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmallOnPrimary_1)),
              SizedBox(height: 19.v),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomElevatedButton(
                            height: 42.v,
                            width: 130.h,
                            text: "PATIENT",
                            buttonStyle: CustomButtonStyles.fillOnPrimary,
                            buttonTextStyle: CustomTextStyles.titleLargePrimary,
                            onPressed: () {
                              onTapPATIENT(context);
                            }),
                        CustomElevatedButton(
                            height: 42.v,
                            width: 130.h,
                            text: "DOCTOR",
                            margin: EdgeInsets.only(left: 21.h),
                            buttonStyle: CustomButtonStyles.fillOnPrimary,
                            buttonTextStyle: CustomTextStyles.titleLargePrimary,
                            onPressed: () {
                              onTapDoctor(context);
                            })
                      ]))
            ])));
  }
}
