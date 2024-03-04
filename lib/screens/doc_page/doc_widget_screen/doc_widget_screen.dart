import 'package:doctorappointment/screens/book_appointment_screen/book_appointment_screen.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_button_style.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_elevated_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class DocWidget extends StatefulWidget {
  final String docId;
  final String docImage;
  final String docName;
  final String docSpecialised;
  final String docQualification;
  final String docExp;
  final String description;
  const DocWidget(
      {super.key,
      required this.docId,
      required this.docImage,
      required this.docName,
      required this.docSpecialised,
      required this.docQualification,
      required this.docExp,
      required this.description
      });
  @override
  State<DocWidget> createState() => _DocWidgetState();
}

class _DocWidgetState extends State<DocWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.only(right: 2.h),
        padding: EdgeInsets.symmetric(
          horizontal: 6.h,
          vertical: 27.v,
        ),
        decoration: AppDecoration.outlinePrimary1.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(
                  left: 12.h,
                  right: 55.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60.adaptSize,
                      width: 60.adaptSize,
                      margin: EdgeInsets.only(bottom: 19.v),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgUsmanYousafPt,
                            height: 60.adaptSize,
                            width: 60.adaptSize,
                            radius: BorderRadius.circular(
                              30.h,
                            ),
                            alignment: Alignment.center,
                          ),
                          CustomImageView(
                            fit: BoxFit.cover,
                            imagePath: widget.docImage,
                            height: 60.adaptSize,
                            width: 60.adaptSize,
                            radius: BorderRadius.circular(
                              30.h,
                            ),
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 22.h,
                        top: 2.v,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.docName,
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: appTheme.black900,
                            ),
                          ),
                          SizedBox(height: 3.v),
                          Text(
                            widget.docSpecialised,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: appTheme.gray600,
                            ),
                          ),
                          SizedBox(height: 3.v),
                          Text(
                            widget.docQualification,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: appTheme.gray600,
                            ),
                          ),
                          SizedBox(height: 4.v),
                          Text(
                            widget.docExp,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: appTheme.gray600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 15.v),
            Container(
              decoration: AppDecoration.outlineGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Row(
                children: [
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return BookAppointmentScreen(
                              docId: widget.docId,
                              docImage: widget.docImage,
                              docName: widget.docName,
                              docQualification: widget.docQualification,
                              docSpecialised: widget.docSpecialised,
                              docExp: widget.docExp,
                              description: widget.description,
                              );
                        },
                      ));
                    },
                    height: 40.v,
                    width: 175.h,
                    text: "Book Hospital Visit",
                    leftIcon: Container(
                      margin: EdgeInsets.only(right: 3.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgHospitalsvgrepocom1,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                    ),
                    buttonStyle: CustomButtonStyles.outlineBlack,
                    buttonTextStyle: CustomTextStyles.bodySmallOnPrimary_1,
                  ),
                  Container(
                    width: 167.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.h,
                      vertical: 8.v,
                    ),
                    decoration: AppDecoration.outlineBlack.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgFrame,
                          height: 24.v,
                          width: 26.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 6.v,
                            bottom: 3.v,
                          ),
                          child: Text(
                            "Book Digital Consult",
                            style: CustomTextStyles.bodySmallBlack900.copyWith(
                              color: appTheme.black900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
