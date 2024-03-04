import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class NotificationItemWidget extends StatefulWidget {
  const NotificationItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 28.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.outlinePrimary3.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 1.v),
            padding: EdgeInsets.symmetric(
              horizontal: 19.h,
              vertical: 24.v,
            ),
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder26,
            ),
            child: SizedBox(
              width: 29.h,
              child: Text(
                "10\nDec",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyLargeOnPrimary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 1.v,
              bottom: 13.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 14.v),
                      child: Text(
                        "Appointment Today",
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    // CustomImageView(
                    //   imagePath: ImageConstant.imgGroup12,
                    //   height: 21.v,
                    //   width: 5.h,
                    //   margin: EdgeInsets.only(bottom: 9.v),
                    // ),
                  ],
                ),
                SizedBox(height: 5.v),
                Text(
                  "Consulting with Dr. Raj Krishna today.",
                  style: CustomTextStyles.bodySmallGray600_1,
                ),
                SizedBox(height: 4.v),
                Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgVectorBlack90020x18,
                      height: 20.v,
                      width: 18.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8.h,
                        top: 3.v,
                        bottom: 2.v,
                      ),
                      child: Text(
                        "5:00 PM to 5:30 PM",
                        style: CustomTextStyles.bodySmallGray600_1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
