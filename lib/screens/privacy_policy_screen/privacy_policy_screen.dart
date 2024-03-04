import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/app_bar/appbar_title.dart';
import 'package:doctorappointment/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

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
                  padding: EdgeInsets.only(left: 32.h, top: 123.v, right: 32.h),
                  child: Column(children: [
                    SizedBox(
                        width: 321.h,
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "App Store (Privacy policy for iOS Apps)\nApp Store requirements regarding privacy can be found in “App Store Review Guidelines” available here and in “Apple Developer Program License Agreement” which can be found ",
                                  style: CustomTextStyles.bodyLargeGray600
                                      .copyWith(height: 1.25)),
                              TextSpan(
                                  text: "here",
                                  style: CustomTextStyles.bodyLargeGray600),
                              TextSpan(
                                  text:
                                      "; however, the most useful to app owners and developers are these recently published official Apple’s guidelines on privacy policies of mobile apps, which can be found ",
                                  style: CustomTextStyles.bodyLargeGray600),
                              TextSpan(
                                  text:
                                      "here. Let’s sum up the requirements in terms of privacy policy for mobile apps and its contents.",
                                  style: CustomTextStyles.bodyLargeGray600)
                            ]),
                            textAlign: TextAlign.justify)),
                    SizedBox(height: 34.v),
                    SizedBox(
                        width: 321.h,
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "Google Play (Privacy policy for Android Apps)\nGoogle Play requirements regarding privacy policy are available in ",
                                  style: CustomTextStyles.bodyLargeGray600
                                      .copyWith(height: 1.25)),
                              TextSpan(
                                  text:
                                      "“The Google Play Developer Distribution Agreement,”",
                                  style: CustomTextStyles.bodyLargeGray600),
                              TextSpan(
                                  text: " which can be found here and in",
                                  style: CustomTextStyles.bodyLargeGray600),
                              TextSpan(
                                  text: " Google’s developer Policy Center.",
                                  style: CustomTextStyles.bodyLargeGray600)
                            ]),
                            textAlign: TextAlign.justify)),
                    SizedBox(height: 5.v)
                  ])),
            )));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 58.h,
        leading: Container(
            height: 38.adaptSize,
            width: 38.adaptSize,
            margin: EdgeInsets.only(left: 16.h, top: 7.v, bottom: 7.v),
            child: Stack(alignment: Alignment.centerLeft, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeft,
                  height: 18.v,
                  width: 9.h,
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.fromLTRB(8.h, 14.v, 25.h, 10.v),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              CustomIconButton(
                  height: 30.adaptSize,
                  width: 34.adaptSize,
                  alignment: Alignment.centerLeft,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CustomImageView(
                      imagePath: ImageConstant.imgArrowLeftPrimary))
            ])),
        centerTitle: true,
        title: AppbarTitle(text: "Privacy & Policy"));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates back to the previous screen.
  onTapBtnArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
