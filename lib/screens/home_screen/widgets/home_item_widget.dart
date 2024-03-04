
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.v),
      decoration: AppDecoration.fillTeal.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 19.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20.v,
                  width: 116.h,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle4,
                        height: 20.v,
                        width: 116.h,
                        alignment: Alignment.center,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 27.h),
                          child: Text(
                            "At Home",
                            style: CustomTextStyles.bodyMediumOnPrimary_2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.v),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "through",
                          style: CustomTextStyles.bodySmallBlack900_1,
                        ),
                        TextSpan(
                          text: " ",
                        ),
                        TextSpan(
                          text: "DDC Lab",
                          style: CustomTextStyles.bodyMediumBlack900,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              right: 94.h,
            ),
            child: Row(
              children: [
                CustomIconButton(
                  height: 42.adaptSize,
                  width: 42.adaptSize,
                  padding: EdgeInsets.all(6.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgNotificationOnprimarycontainer,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 34.h,
                    top: 13.v,
                    bottom: 10.v,
                  ),
                  child: Text(
                    "Lab Tests and Packages",
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
