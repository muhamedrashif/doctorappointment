import 'package:doctorappointment/screens/doc_page/doc_page.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CoughItemWidget extends StatefulWidget {
  final String id;
  final String image;
  final String name;
  const CoughItemWidget(
      {super.key, required this.id, required this.image, required this.name});

  @override
  State<CoughItemWidget> createState() => _CoughItemWidgetState();
}

class _CoughItemWidgetState extends State<CoughItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DocPage(id: widget.id,type: "3",);
          },
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 5.v,
        ),
        decoration: AppDecoration.outlinePrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        width: 87.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 2.v),
            CustomImageView(
              imagePath: widget.image,
              height: 50.v,
              width: 42.h,
            ),
            Text(
              widget.name,
              maxLines: 2,
              style: CustomTextStyles.bodySmallGray600,
            ),
          ],
        ),
      ),
    );
  }
}
