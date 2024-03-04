import 'package:doctorappointment/commonViewModel/commonViewModel.dart';
import 'package:doctorappointment/model/getlatestdoctor.dart';
import 'package:doctorappointment/model/getlatestprescription.dart';
import 'package:doctorappointment/screens/home_container_screen/home_container_screen.dart';
import 'package:doctorappointment/screens/prescription_screen/prescription_screen.dart';
import 'package:doctorappointment/services/webservice.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_button_style.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_elevated_button.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Report_screen extends StatefulWidget {
  const Report_screen({Key? key}) : super(key: key);

  @override
  State<Report_screen> createState() => _Report_screenState();
}

class _Report_screenState extends State<Report_screen> {
  late CommonViewModel vm;
  late Latestprescription user;
  late Latestdocotorvisited user1;
  bool loading = true;
  bool loading2 = true;

  @override
  void initState() {
    vm = Provider.of<CommonViewModel>(context, listen: false);

    // TODO: implement initState
    super.initState();
    //getletestprescription
    Future<Map<String, dynamic>> successfulMessage = vm.getlatestprescription();
    successfulMessage.then((response) async {
      // print("response :" + response.toString());
      if (response['status']) {
        // print(response);

        user = response['user'];
        print("sssss----" + user.doctorname);
        setState(() {
          loading = false;
        });
      }
    });
    //getletestdoctor
    Future<Map<String, dynamic>> successfulMessagee = vm.getlatestdoctor();
    successfulMessagee.then((response) async {
      print("response :" + response.toString());
      if (response['status']) {
        user1 = response['user'];

        //
        setState(() {
          loading2 = false;
        });
        print("qqqqq----" + user1.categoryname);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: WillPopScope(
      onWillPop: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return HomeContainerScreen();
          },
        ));
        return Future.value(true);
      },
      child: Scaffold(
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillGray,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  SizedBox(height: 51.v),
                  Text("Health Records", style: theme.textTheme.titleLarge),
                  SizedBox(height: 17.v),
                  _buildFrameSeventeen(context),
                  SizedBox(height: 13.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Latest Records",
                          style: theme.textTheme.titleMedium)),
                  SizedBox(height: 9.v),
                  loading == true
                      // ? const user.prescriptionimage == "0"
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/emptystates.png",
                              height: 100,
                            ),
                            const Text("No data!!")
                          ],
                        )
                      : _buildPrecription(context, user),
                  SizedBox(height: 20.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Last Visited Doctor",
                          style: theme.textTheme.titleMedium)),
                  SizedBox(height: 9.v),
                  loading2 == true
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/emptystates.png",
                              height: 100,
                            ),
                            const Text("No data!!")
                          ],
                        )
                      : _buildDrRaj(context)
                ]))),
      )),
    ));
  }

  /// Section Widget
  Widget _buildFrameSeventeen(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 36.h, vertical: 31.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                            height: 44.adaptSize,
                            width: 44.adaptSize,
                            padding: EdgeInsets.all(8.h),
                            decoration: IconButtonStyleHelper.fillOnPrimary,
                            onTap: () {
                              onTapBtnIconButton(context);
                            },
                            child: CustomImageView(
                                imagePath: ImageConstant.imgFrame18Onprimary)),
                        CustomIconButton(
                            height: 44.adaptSize,
                            width: 44.adaptSize,
                            padding: EdgeInsets.all(10.h),
                            decoration: IconButtonStyleHelper.fillOnPrimary,
                            onTap: () {
                              // onTapBtnIconButton1(context);
                            },
                            child: CustomImageView(
                                imagePath: ImageConstant.imgFrame19Onprimary)),
                        CustomIconButton(
                            height: 44.adaptSize,
                            width: 44.adaptSize,
                            padding: EdgeInsets.all(10.h),
                            decoration: IconButtonStyleHelper.fillOnPrimary,
                            onTap: () {
                              // onTapBtnIconButton2(context);
                            },
                            child: CustomImageView(
                                imagePath: ImageConstant.imgFrame23))
                      ])),
              SizedBox(height: 15.v),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Prescription",
                    style: CustomTextStyles.bodyMediumOnPrimary),
                Text("Lab Report", style: CustomTextStyles.bodyMediumOnPrimary),
                Text("Bill History",
                    style: CustomTextStyles.bodyMediumOnPrimary)
              ])
            ]));
  }

  /// Section Widget
  Widget _buildPrecription(BuildContext context, Latestprescription user) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    DateTime tempDate =
        new DateFormat("yyyy-MM-dd").parse(user.precriptiondate.toString());
    final String formatted = formatter.format(tempDate);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 12.v),
        decoration: AppDecoration.outlinePrimary1
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 3.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomElevatedButton(
                            width: 98.h,
                            text: "PRESCRIPTION",
                            buttonTextStyle: CustomTextStyles.bodySmallPrimary),
                        Padding(
                            padding: EdgeInsets.only(top: 5.v, bottom: 3.v),
                            child: Text(formatted,
                                style: theme.textTheme.bodySmall))
                      ])),
              SizedBox(height: 8.v),
              Container(
                  margin: EdgeInsets.only(right: 3.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 45.h, vertical: 9.v),
                  decoration: AppDecoration.fillBlueGray
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                  child: CustomImageView(
                      imagePath: WebService().imageurl + user.prescriptionimage,
                      height: 185.v,
                      width: 248.h))
            ]));
  }

  /// Section Widget
  Widget _buildDrRaj(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 27.v),
        decoration: AppDecoration.outlinePrimary1
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 12.h, right: 55.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: WebService().imageurl + user1.image,
                            height: 60.adaptSize,
                            width: 60.adaptSize,
                            radius: BorderRadius.circular(30.h),
                            margin: EdgeInsets.only(bottom: 19.v)),
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(left: 22.h, top: 2.v),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(user1.doctorname,
                                          style: theme.textTheme.titleMedium),
                                      SizedBox(height: 3.v),
                                      Text(user1.categoryname,
                                          style: theme.textTheme.bodyMedium),
                                      SizedBox(height: 3.v),
                                      Text(user1.qualification,
                                          style: theme.textTheme.bodyMedium),
                                      SizedBox(height: 4.v),
                                      Text(user1.experience,
                                          style: theme.textTheme.bodyMedium)
                                    ])))
                      ])),
              SizedBox(height: 14.v),
              Container(
                  decoration: AppDecoration.outlineGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder20),
                  child: Row(children: [
                    CustomElevatedButton(
                        height: 40.v,
                        width: 175.h,
                        text: "Book Hospital Visit",
                        leftIcon: Container(
                            margin: EdgeInsets.only(right: 3.h),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgHospitalsvgrepocom1,
                                height: 24.adaptSize,
                                width: 24.adaptSize)),
                        buttonStyle: CustomButtonStyles.outlineBlack,
                        buttonTextStyle: CustomTextStyles.bodySmallOnPrimary_1),
                    Container(
                        width: 167.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 8.v),
                        decoration: AppDecoration.outlineBlack.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgFrame,
                                  height: 24.v,
                                  width: 26.h),
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 6.v, bottom: 3.v),
                                  child: Text("Book Digital Consult",
                                      style:
                                          CustomTextStyles.bodySmallBlack900))
                            ]))
                  ]))
            ]));
  }

  /// Navigates to the prescriptionScreen when the action is triggered.
  onTapBtnIconButton(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const PrescriptionScreen();
      },
    ));
    // Navigator.pushNamed(context, AppRoutes.prescription_screen);
  }

  /// Navigates to the labTestScreen when the action is triggered.
  // onTapBtnIconButton1(BuildContext context) {
  //   Navigator.push(context, MaterialPageRoute(
  //     builder: (context) {
  //       return const LabTestScreen();
  //     },
  //   ));
  //   // Navigator.pushNamed(context, AppRoutes.labTestScreen);
  // }

  /// Navigates to the invoiceScreen when the action is triggered.
  // onTapBtnIconButton2(BuildContext context) {
  //   Navigator.push(context, MaterialPageRoute(
  //     builder: (context) {
  //       return const BillHistoryScreen();
  //     },
  //   ));
  //   // Navigator.pushNamed(context, AppRoutes.bill_history_screen);
  // }
}
