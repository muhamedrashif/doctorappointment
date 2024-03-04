import 'package:doctorappointment/screens/about_us_screen/about_us_screen.dart';
import 'package:doctorappointment/screens/help_screen/help_screen.dart';
import 'package:doctorappointment/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HelpItemWidget extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  const HelpItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  State<HelpItemWidget> createState() => _HelpItemWidgetState();
}

class _HelpItemWidgetState extends State<HelpItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (widget.title) {
          case "Help":
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const HelpScreen();
              },
            ));
          case "Privacy Policy":
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const PrivacyPolicyScreen();
              },
            ));
          case "Abut Us":
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const AboutUsScreen();
              },
            ));
            break;
          default:
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 13.h,
          vertical: 10.v,
        ),
        decoration: AppDecoration.outlinePrimary1.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButton(
              height: 44.adaptSize,
              width: 44.adaptSize,
              padding: EdgeInsets.all(10.h),
              decoration: IconButtonStyleHelper.fillGrayC,
              child: CustomImageView(
                imagePath: ImageConstant.imgFrame22Onprimary,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                top: 6.v,
                bottom: 4.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 1.v),
                  Text(
                    widget.subtitle,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomImageView(
              imagePath: widget.image,
              height: 11.v,
              width: 6.h,
              margin: EdgeInsets.only(
                top: 16.v,
                right: 4.h,
                bottom: 16.v,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
