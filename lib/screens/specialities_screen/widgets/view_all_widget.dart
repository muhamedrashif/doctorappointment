import 'package:doctorappointment/screens/doc_page/doc_page.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewallWidget extends StatefulWidget {
  final String type;
  final String id;
  final String image;
  final String name;
  const ViewallWidget(
      {super.key, required this.type, required this.id, required this.image, required this.name});

  @override
  State<ViewallWidget> createState() => ViewallWidgetState();
}

class ViewallWidgetState extends State<ViewallWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DocPage(id: widget.id,type: widget.type,);
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 5.v,
          ),
          decoration: AppDecoration.outlinePrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 4.v),
              CustomImageView(
                fit: BoxFit.cover,
                imagePath: widget.image,
                height: 60.adaptSize,
                width: 60.adaptSize,
                radius: BorderRadius.circular(
                  40.h,
                ),
                alignment: Alignment.center,
              ),
              SizedBox(height: 5.v),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: Text(
                  widget.name,
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: appTheme.black900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
