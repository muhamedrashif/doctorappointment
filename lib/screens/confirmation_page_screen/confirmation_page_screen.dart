import 'package:doctorappointment/screens/splash_screen/sucess_splash_screen.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_button_style.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/app_bar/appbar_title.dart';
import 'package:doctorappointment/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorappointment/widgets/custom_elevated_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:doctorappointment/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class ConfirmationPageScreen extends StatefulWidget {
  final String docImage;
  final String docName;
  final String docSpecialised;
  final String docQualification;
  final String docTime;
  final String date;
  final String bookingid;
  const ConfirmationPageScreen(
      {super.key,
      required this.docImage,
      required this.docName,
      required this.docSpecialised,
      required this.docQualification,
      required this.docTime,
      required this.date,
      required this.bookingid
      });

  @override
  State<ConfirmationPageScreen> createState() => _ConfirmationPageScreenState();
}

class _ConfirmationPageScreenState extends State<ConfirmationPageScreen> {
  @override
  Widget build(BuildContext context) {

    
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 48.v),
                  child: Column(children: [
                    SizedBox(height: 27.v),
                    Container(
                        height: 262.adaptSize,
                        width: 262.adaptSize,
                        decoration: AppDecoration.fillPrimary.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder131),
                        child: CustomImageView(
                            fit: BoxFit.cover,
                            imagePath: widget.docImage,
                            height: 262.adaptSize,
                            width: 262.adaptSize,
                            radius: BorderRadius.circular(131.h),
                            alignment: Alignment.center)),
                    SizedBox(height: 37.v),
                    Text(widget.docName, style: theme.textTheme.titleLarge),
                    SizedBox(height: 3.v),
                    Text(widget.docSpecialised,
                        style: CustomTextStyles.titleLargeGray600),
                    SizedBox(height: 39.v),
                    Text("Date: "+widget.date,
                        style: CustomTextStyles.titleLargeGray600),
                    SizedBox(height: 9.v),
                    Text("Time: "+widget.docTime,
                        style: CustomTextStyles.titleLargeGray600),
                    SizedBox(height: 7.v),
                    Text("Booking ID: BKD"+widget.bookingid,
                        style: CustomTextStyles.titleLargeGray600),
                    SizedBox(height: 39.v),
                    CustomElevatedButton(
                        height: 48.v,
                        width: 250.h,
                        text: "Confirmed",
                        buttonStyle: CustomButtonStyles.fillPrimary,
                        buttonTextStyle: CustomTextStyles.titleLargeOnPrimary,
                        onPressed: () {
                          onTapConfirmed(context);
                        }),
                    SizedBox(height: 25.v),
                    CustomOutlinedButton(
                        width: 300.h,
                        text:
                            "For More information please call +91-04842320919",
                        leftIcon: Container(
                            margin: EdgeInsets.only(right: 2.h),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgHospitalsvgrepocom1,
                                height: 26.adaptSize,
                                width: 26.adaptSize)))
                  ])),
            )));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        // leadingWidth: 57.h,
        // leading: Container(
        //     height: 42.adaptSize,
        //     width: 42.adaptSize,
        //     margin: EdgeInsets.only(left: 15.h, top: 7.v, bottom: 7.v),
        //     child: Stack(alignment: Alignment.center, children: [
        //       CustomImageView(
        //           imagePath: ImageConstant.imgArrowLeft,
        //           height: 18.v,
        //           width: 9.h,
        //           alignment: Alignment.bottomLeft,
        //           margin: EdgeInsets.fromLTRB(9.h, 14.v, 24.h, 10.v),
        //           onTap: () {
        //             onTapImgArrowLeft(context);
        //           }),
        //       CustomIconButton(
        //           height: 42.adaptSize,
        //           width: 42.adaptSize,
        //           alignment: Alignment.center,
        //           onTap: () {
        //             onTapBtnArrowLeft(context);
        //           },
        //           child: CustomImageView(
        //               imagePath: ImageConstant.imgArrowLeftPrimary))
        //     ])),
        centerTitle: true,
        title: AppbarTitle(text: "Appointment Confirmed"));
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapConfirmed(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const SuccessScreen();
      },
    ));
    // Navigator.pushNamed(context, AppRoutes.homeContainerScreen);
  }
}
