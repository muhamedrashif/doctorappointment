import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/app_bar/appbar_title.dart';
import 'package:doctorappointment/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

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
                  padding:
                      EdgeInsets.symmetric(horizontal: 34.h, vertical: 26.v),
                  child: Column(children: [
                    Container(
                        height: 262.adaptSize,
                        width: 262.adaptSize,
                        decoration: AppDecoration.fillPrimary.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder131),
                        child: CustomImageView(
                            imagePath: ImageConstant.asianFemale,
                            height: 262.adaptSize,
                            width: 262.adaptSize,
                            radius: BorderRadius.circular(131.h),
                            alignment: Alignment.center)),
                    SizedBox(height: 20.v),
                    SizedBox(
                        width: 321.h,
                        child: Text(
                            "A mission to transform health visits into uplifting experiences. We're not just about treating ailments; we're crafting a sanctuary where compassionate care meets cutting-edge expertise. Join us on a journey where wellness feels like a warm embrace, and every patient leaves with a smile and a step towards a healthier tomorrow.\"",
                            maxLines: 8,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            style: CustomTextStyles.bodyLargeGray600_1
                                .copyWith(height: 1.25))),
                    SizedBox(height: 23.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                            width: 196.h,
                            child: Text(
                                "Our Values:\nCollaborative & Friendly\nAlways Learning\nCommitted\nHigh Performance",
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.bodyLargeGray600_1))),
                    SizedBox(height: 20.v),
                    Container(
                        width: 309.h,
                        margin: EdgeInsets.only(left: 7.h, right: 5.h),
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "Contact Us\nWe’re always open to feedback, questions and for opportunities for partnerships or contributions. You can ",
                                  style: CustomTextStyles.bodyLargeGray600),
                              TextSpan(
                                  text: "get in touch with us here",
                                  style: CustomTextStyles.bodyLargeGray600)
                            ]),
                            textAlign: TextAlign.left)),
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
        title: AppbarTitle(text: "About Us"));
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
