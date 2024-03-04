import 'package:doctorappointment/screens/doc_page/doc_page.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class PsychiatryItemWidget extends StatefulWidget {
  final String id;
  final String image;
  final String name;
  const PsychiatryItemWidget(
      {super.key,required this.id, required this.image, required this.name});

  @override
  State<PsychiatryItemWidget> createState() => _PsychiatryItemWidgetState();
}

class _PsychiatryItemWidgetState extends State<PsychiatryItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DocPage(id: widget.id,type:"2");
          },
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 45.h,
          vertical: 13.v,
        ),
        decoration: AppDecoration.outlinePrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        width: 171.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: widget.image,
              height: 63.v,
              width: 50.h,
            ),
            SizedBox(height: 5.v),
            Text(
              widget.name,
              style: theme.textTheme.bodyMedium,
              maxLines: 2,
            ),
            // SizedBox(height: 5.v),
          ],
        ),
      ),
    );
  }
}
