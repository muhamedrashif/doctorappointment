import 'package:doctorappointment/screens/doc_page/doc_page.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SpecialitiesItemWidget extends StatefulWidget {
  final String id;
  final String image;
  final String name;
  const SpecialitiesItemWidget(
      {super.key, required this.id, required this.image, required this.name});

  @override
  State<SpecialitiesItemWidget> createState() => _SpecialitiesItemWidgetState();
}

class _SpecialitiesItemWidgetState extends State<SpecialitiesItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DocPage(id: widget.id,type:"1");
          },
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
          vertical: 5.v,
        ),
        decoration: AppDecoration.outlinePrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 4.v),
            CustomImageView(
              imagePath: widget.image,
              height: 58.v,
              width: 86.h,
            ),
            SizedBox(height: 5.v),
            Center(
              child: Text(
                widget.name,
                maxLines: 2,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
