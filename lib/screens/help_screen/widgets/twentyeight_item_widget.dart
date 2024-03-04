import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TwentyeightItemWidget extends StatelessWidget {
  const TwentyeightItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlueGrayC,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Who can use this FAQ template?",
                style: CustomTextStyles.bodyMediumBlack900_1,
              ),
            ],
          ),
          trailing: CustomImageView(
            imagePath: ImageConstant.imgVector6x11,
            height: 6.v,
            width: 11.h,
            margin: EdgeInsets.only(
              top: 3.v,
              bottom: 6.v,
            ),
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.v),
              child: Column(
                children: [
                  SizedBox(
                    width: 339.h,
                    child: Text(
                      "This FAQ template is for marketers, business owners and freelancers who want to reduce customer service efforts. ",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMediumBlack900_1,
                    ),
                  ),
                ],
              ),
            ),
          ],
          onExpansionChanged: (value) {},
        ),
      ),
    );
  }
}
