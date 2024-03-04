import 'package:doctorappointment/services/webservice.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PrescriptionImageView extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final prescriptionimage;
  const PrescriptionImageView({super.key, required this.prescriptionimage});

  @override
  State<PrescriptionImageView> createState() => _PrescriptionImageViewState();
}

class _PrescriptionImageViewState extends State<PrescriptionImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
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
        // title: AppbarTitle(text: "Prescriptions")
      ),
      body: Center(
          child: SizedBox(
              height: 250.v,
              width: 250.h,
              child: PhotoView(
                  backgroundDecoration: const BoxDecoration(color: Colors.white12),
                  imageProvider: NetworkImage(
                    WebService().imageurl + widget.prescriptionimage,
                  )))),
    );
  }
}
