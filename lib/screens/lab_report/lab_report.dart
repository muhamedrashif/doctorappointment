import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:doctorappointment/widgets/app_bar/appbar_title.dart';
import 'package:doctorappointment/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorappointment/widgets/custom_elevated_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class LabTestScreen extends StatefulWidget {
  const LabTestScreen({Key? key}) : super(key: key);

  @override
  State<LabTestScreen> createState() => _LabTestScreenState();
}

class _LabTestScreenState extends State<LabTestScreen> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 27.v),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.h),
                        child: Column(children: [
                          _buildFrame2(context),
                          SizedBox(height: 21.v),
                          _buildFrame4(context),
                          SizedBox(height: 21.v),
                          _buildFrame6(context),
                          SizedBox(height: 13.v),
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 58.h,
        leading: AppbarLeadingIconbuttonOne(
            imagePath: ImageConstant.imgArrowLeftPrimary,
            margin: EdgeInsets.only(left: 16.h, top: 7.v, bottom: 7.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Lab Report"));
  }

  /// Section Widget
  Widget _buildFrame2(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 11.v),
        decoration: AppDecoration.outlineTeal
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 8.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomElevatedButton(
                            width: 71.h,
                            text: "Blood Test",
                            margin: EdgeInsets.only(bottom: 3.v)),
                        _buildDrRajKrishna(context,
                            drRajKrishna: "Dr. Raj Krishna",
                            uploadedAug: "Uploaded: 07 Aug 2023")
                      ])),
              SizedBox(height: 4.v),
              Padding(
                  padding: EdgeInsets.only(right: 3.h),
                  child: _buildFrame(context, view: "View")),
              SizedBox(height: 2.v)
            ]));
  }

  /// Section Widget
  Widget _buildFrame4(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        color: theme.colorScheme.onPrimary.withOpacity(1),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: appTheme.teal400, width: 1.h),
            borderRadius: BorderRadiusStyle.roundedBorder20),
        child: Container(
            height: 262.v,
            width: 358.h,
            decoration: AppDecoration.outlineTeal
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: EdgeInsets.only(left: 8.h, top: 13.v),
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.h, vertical: 3.v),
                      decoration: AppDecoration.fillTeal50.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 2.v),
                            Text("X-Ray",
                                style: CustomTextStyles.bodySmallTeal500)
                          ]))),
              Padding(
                  padding:
                      EdgeInsets.only(left: 8.h, right: 11.h, bottom: 15.v),
                  child: _buildFrame(context, view: "View")),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: EdgeInsets.only(top: 12.v, right: 66.h),
                      child: Text("Dr. Raj Krishna",
                          style: theme.textTheme.bodySmall))),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: EdgeInsets.only(top: 26.v, right: 16.h),
                      child: Text("Uploaded: 07 Aug 2023",
                          style: theme.textTheme.bodySmall))),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 7.h, vertical: 11.v),
                      decoration: AppDecoration.outlineTeal400.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder20),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(right: 8.h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomElevatedButton(
                                          width: 45.h,
                                          text: "X-Ray",
                                          margin: EdgeInsets.only(bottom: 3.v)),
                                      _buildDrRajKrishna(context,
                                          drRajKrishna: "Dr. Raj Krishna",
                                          uploadedAug: "Uploaded: 07 Aug 2023")
                                    ])),
                            SizedBox(height: 4.v),
                            Container(
                                margin: EdgeInsets.only(right: 3.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 62.h, vertical: 10.v),
                                decoration: AppDecoration.fillBlueGray.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder5),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomImageView(
                                          imagePath: ImageConstant
                                              .imgHassprescription159x214,
                                          height: 159.v,
                                          width: 214.h),
                                      SizedBox(height: 7.v),
                                      Text("View",
                                          style: theme.textTheme.bodySmall)
                                    ])),
                            SizedBox(height: 2.v)
                          ])))
            ])));
  }

  /// Section Widget
  Widget _buildFrame6(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 11.v),
        decoration: AppDecoration.outlineTeal
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 8.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomElevatedButton(
                            width: 84.h,
                            text: "Antigen-Test",
                            margin: EdgeInsets.only(bottom: 3.v)),
                        _buildDrRajKrishna(context,
                            drRajKrishna: "Dr. Raj Krishna",
                            uploadedAug: "Uploaded: 07 Aug 2023")
                      ])),
              SizedBox(height: 4.v),
              Padding(
                  padding: EdgeInsets.only(right: 3.h),
                  child: _buildFrame(context, view: "View")),
              SizedBox(height: 2.v)
            ]));
  }

  /// Common widget
  Widget _buildFrame(
    BuildContext context, {
    required String view,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 62.h, vertical: 10.v),
        decoration: AppDecoration.fillBlueGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgHassprescription159x214,
                  height: 159.v,
                  width: 214.h),
              SizedBox(height: 7.v),
              Text(view,
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: appTheme.gray40002))
            ]));
  }

  /// Common widget
  Widget _buildDrRajKrishna(
    BuildContext context, {
    required String drRajKrishna,
    required String uploadedAug,
  }) {
    return SizedBox(
        height: 26.v,
        width: 131.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text(drRajKrishna,
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: appTheme.gray40002))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Text(uploadedAug,
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: appTheme.gray40002)))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
