import 'dart:developer';
import 'package:doctorappointment/commonViewModel/commonViewModel.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/app_bar/appbar_title.dart';
import 'package:doctorappointment/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:provider/provider.dart';

import '../prescription_screen/widgets/prescription_item_widget.dart';
import 'package:flutter/material.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  late CommonViewModel vm;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm = Provider.of<CommonViewModel>(context, listen: false);
    vm.getprescription();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 27.v),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.h),
                        child: Column(
                          children: [
                          _buildPrescription(context),
                          SizedBox(height: 13.v),
                          // Container(
                          //     height: 31.v,
                          //     width: 339.h,
                          //     decoration: BoxDecoration(
                          //         color: theme.colorScheme.onPrimary
                          //             .withOpacity(1)))
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
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
        title: AppbarTitle(text: "Prescriptions"));
  }

  /// Section Widget
  Widget _buildPrescription(BuildContext context) {
    return Consumer<CommonViewModel>(builder: (context, value, child) {
      // return ListView.builder(
      //     physics: const BouncingScrollPhysics(),
      //     scrollDirection: Axis.vertical,
      //     shrinkWrap: true,
      //     itemCount: value.getPrescription.length,
      //     itemBuilder: (BuildContext ctx, index) {
      log("value.getPrescription---------------------" +
          value.getPrescription.length.toString());
      return value.getPrescription.isEmpty
          ? Align(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/emptystates.png",
                    height: 150,
                  ),
                  const Text("No data!!")
                ],
              ),
          )
          : ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 21.v);
              },
              itemCount: value.getPrescription.length,
              itemBuilder: (context, index) {
                return PrescriptionItemWidget(
                    getPrescription: value.getPrescription[index]);
              });
    });
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
