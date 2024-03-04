import 'package:doctorappointment/model_view/getprecripption.dart';
import 'package:doctorappointment/screens/prescription_screen/prescription_imageview.dart';
import 'package:doctorappointment/services/webservice.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_elevated_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrescriptionItemWidget extends StatefulWidget {
  final GetPrescriptionViewModel getPrescription;
  const PrescriptionItemWidget({Key? key, required this.getPrescription})
      : super(
          key: key,
        );

  @override
  State<PrescriptionItemWidget> createState() => _PrescriptionItemWidgetState();
}

class _PrescriptionItemWidgetState extends State<PrescriptionItemWidget> {
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    DateTime tempDate = new DateFormat("yyyy-MM-dd")
        .parse(widget.getPrescription.precriptiondate.toString());
    final String formatted = formatter.format(tempDate);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.outlinePrimary1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                  width: 98.h,
                  text: "PRESCRIPTION",
                  margin: EdgeInsets.only(bottom: 3.v),
                ),
                SizedBox(
                  height: 26.v,
                  width: 131.h,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.getPrescription.doctorname,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Uploaded : " + formatted,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.v),
          Container(
            margin: EdgeInsets.only(right: 3.h),
            padding: EdgeInsets.symmetric(
              horizontal: 62.h,
              vertical: 10.v,
            ),
            decoration: AppDecoration.fillBlueGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.getPrescription.prescriptionimage == "0"
                    ? const SizedBox()
                    : Container(
                        decoration: AppDecoration.fillBlueGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder5),
                        child: CustomImageView(
                          imagePath: WebService().imageurl +
                              widget.getPrescription.prescriptionimage,
                          height: 159.v,
                          width: 214.h,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PrescriptionImageView(
                                        prescriptionimage: widget
                                            .getPrescription
                                            .prescriptionimage)));
                            // Navigator.push(context, MaterialPageRoute(
                            //   builder: (context) {
                            //     return const PrescriptionImageView();
                            //   },
                            // ));
                          },
                        )),
                //  Container(
                //     height: 159.v,
                //     width: 214.h,
                //     child: PhotoView(
                //         imageProvider: NetworkImage(

                //       WebService().imageurl +
                //           widget.getPrescription.prescriptionimage,
                //     )),
                //   ),
                SizedBox(height: 7.v),
                Text(
                  widget.getPrescription.prescription,
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          SizedBox(height: 2.v),
        ],
      ),
    );
  }
}
