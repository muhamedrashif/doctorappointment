import 'dart:developer';

import 'package:doctorappointment/commonViewModel/commonViewModel.dart';
import 'package:doctorappointment/model/getclinicinfo.dart';
import 'package:doctorappointment/model_view/getdoctor.dart';
import 'package:doctorappointment/screens/doc_page/doc_widget_screen/doc_widget_screen.dart';
import 'package:doctorappointment/services/webservice.dart';
import 'package:doctorappointment/theme/custom_button_style.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/app_bar/appbar_title.dart';
import 'package:doctorappointment/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:doctorappointment/widgets/custom_outlined_button.dart';
import 'package:doctorappointment/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DocPage extends StatefulWidget {
  final String id, type;
  const DocPage({Key? key, required this.id, required this.type})
      : super(
          key: key,
        );

  @override
  State<DocPage> createState() => _DocPageState();
}

class _DocPageState extends State<DocPage> {
  TextEditingController searchController = TextEditingController();
  late CommonViewModel vm;
  List<GetdoctorViewModel> _searchItems = [];
  late Clinic user1;
  bool loading2 = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm = Provider.of<CommonViewModel>(context, listen: false);
    // vm.getdoctor.clear();
    vm
        .getdoctors(widget.id, widget.type)
        .whenComplete(() => _searchItems = vm.getdoctor);
    // _searchItems = vm.getdoctor;
    setState(() {});
    //getclinicinfo
    Future<Map<String, dynamic>> successfulMessagee = vm.getclinicinfo();
    successfulMessagee.then((response) async {
      print("response :" + response.toString());
      if (response['status']) {
        user1 = response['user'];

        //
        setState(() {
          loading2 = false;
        });
      }
    });
  }

  @override
  void dispose() {
    vm.getdoctor.clear();
    // TODO: implement dispose
    super.dispose();
  }

  void _runFilter(String enteredKeyword) {
    List<GetdoctorViewModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = vm.getdoctor;
    } else {
      results = vm.getdoctor
          .where((item) =>
              item.datas.name
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              item.datas.specialisedname
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    log("Sercheddd");

    setState(() {
      _searchItems = results;
    });
  }

  // List docList = [
  //   DocWidget(
  //       docImage: ImageConstant.imgNursePortrait,
  //       docName: "Dr.arun",
  //       docSpecialised: "Pediatric Specialist",
  //       docQualification: "MD in Pediatrics,DCH,MBBS",
  //       docExp: "5 Years Exp."),
  //   DocWidget(
  //       docImage: ImageConstant.imgNursePortrait,
  //       docName: "Dr.arun",
  //       docSpecialised: "Pediatric Specialist",
  //       docQualification: "MD in Pediatrics,DCH,MBBS",
  //       docExp: "5 Years Exp."),
  //   DocWidget(
  //       docImage: ImageConstant.imgNursePortrait,
  //       docName: "Dr.arun",
  //       docSpecialised: "Pediatric Specialist",
  //       docQualification: "MD in Pediatrics,DCH,MBBS",
  //       docExp: "5 Years Exp."),
  //   DocWidget(
  //       docImage: ImageConstant.imgNursePortrait,
  //       docName: "Dr.arun",
  //       docSpecialised: "Pediatric Specialist",
  //       docQualification: "MD in Pediatrics,DCH,MBBS",
  //       docExp: "5 Years Exp."),
  //   DocWidget(
  //       docImage: ImageConstant.imgNursePortrait,
  //       docName: "Dr.arun",
  //       docSpecialised: "Pediatric Specialist",
  //       docQualification: "MD in Pediatrics,DCH,MBBS",
  //       docExp: "5 Years Exp."),
  // ];
  @override
  Widget build(BuildContext context) {
    vm = Provider.of<CommonViewModel>(context);
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
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
                        onTapImgArrowLeft(context);
                      }),
                  CustomIconButton(
                      height: 30.adaptSize,
                      width: 34.adaptSize,
                      alignment: Alignment.centerLeft,
                      onTap: () {
                        onTapBtnArrowLeft(context);
                      },
                      child: CustomImageView(
                          imagePath: ImageConstant.imgArrowLeftPrimary))
                ])),
            centerTitle: true,
            title: AppbarTitle(text: "Doctors")),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: vm.docload
                ? const Padding(
                    padding: EdgeInsets.all(10),
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      // SizedBox(height: 48.v),
                      // Text(
                      //   "Doctors",
                      //   style: theme.textTheme.titleLarge,
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: CustomSearchView(
                              onChanged: (value) {
                                _runFilter(value);
                              },
                              controller: searchController,
                              hintText: "Search Doctors")),
                      SizedBox(height: 20.v),
                      Column(
                        children: [
                          Consumer<CommonViewModel>(
                              builder: (context, value, child) {
                            return _searchItems.isNotEmpty ||
                                    searchController.text.isNotEmpty
                                ? _searchItems.isEmpty
                                    ? const Text("no data")
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: _searchItems.length,
                                        itemBuilder: (context, index) {
                                          return DocWidget(
                                            docId: _searchItems[index].id,
                                            docImage: WebService().imageurl +
                                                _searchItems[index].image,
                                            docName: _searchItems[index].name,
                                            docSpecialised: _searchItems[index]
                                                .specialisedname,
                                            docQualification:
                                                _searchItems[index]
                                                    .qualification,
                                            docExp:
                                                _searchItems[index].experience,
                                            description:
                                                _searchItems[index].description,
                                          );
                                        })
                                : ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: value.getdoctor.length,
                                    itemBuilder: (context, index) {
                                      return DocWidget(
                                        docId: value.getdoctor[index].id,
                                        docImage: WebService().imageurl +
                                            value.getdoctor[index].image,
                                        docName: value.getdoctor[index].name,
                                        docSpecialised: value
                                            .getdoctor[index].specialisedname,
                                        docQualification: value
                                            .getdoctor[index].qualification,
                                        docExp:
                                            value.getdoctor[index].experience,
                                        description:
                                            value.getdoctor[index].description,
                                      );
                                    });
                          }),
                          // _buildFrame2(context),
                          // SizedBox(height: 20.v),
                          // _buildFrame4(context),
                          SizedBox(height: 20.v),
                          _buildFrame5(context),
                          SizedBox(height: 44.v),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  // /// Section Widget
  // Widget _buildFrame2(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.only(right: 2.h),
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 6.h,
  //       vertical: 27.v,
  //     ),
  //     decoration: AppDecoration.outlinePrimary1.copyWith(
  //       borderRadius: BorderRadiusStyle.roundedBorder10,
  //     ),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.only(
  //             left: 12.h,
  //             right: 55.h,
  //           ),
  //           child: _buildUsmanYousafPT(
  //             context,
  //             drRajKrishna: "Dr. Aloha Zoho ",
  //             pediatricSpecialist: "Pediatric Specialist",
  //             mDInPaediatrics: "MD in Paediatrics, DCH, MBBS",
  //             duration: "5 Year Exp.",
  //           ),
  //         ),
  //         SizedBox(height: 15.v),
  //         Container(
  //           decoration: AppDecoration.outlineGray.copyWith(
  //             borderRadius: BorderRadiusStyle.roundedBorder20,
  //           ),
  //           child: Row(
  //             children: [
  //               CustomElevatedButton(
  //                 height: 40.v,
  //                 width: 175.h,
  //                 text: "Book Hospital Visit",
  //                 leftIcon: Container(
  //                   margin: EdgeInsets.only(right: 3.h),
  //                   child: CustomImageView(
  //                     imagePath: ImageConstant.imgHospitalsvgrepocom1,
  //                     height: 24.adaptSize,
  //                     width: 24.adaptSize,
  //                   ),
  //                 ),
  //                 buttonStyle: CustomButtonStyles.outlineBlack,
  //                 buttonTextStyle: CustomTextStyles.bodySmallOnPrimary_1,
  //               ),
  //               _buildFrame(
  //                 context,
  //                 bookDigitalConsult: "Book Digital Consult",
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // /// Section Widget
  // Widget _buildFrame4(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.only(right: 2.h),
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 6.h,
  //       vertical: 27.v,
  //     ),
  //     decoration: AppDecoration.outlinePrimary1.copyWith(
  //       borderRadius: BorderRadiusStyle.roundedBorder10,
  //     ),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.only(
  //             left: 12.h,
  //             right: 55.h,
  //           ),
  //           child: _buildUsmanYousafPT(
  //             context,
  //             drRajKrishna: "Dr. Raj Krishna",
  //             pediatricSpecialist: "Pediatric Specialist",
  //             mDInPaediatrics: "MD in Paediatrics, DCH, MBBS",
  //             duration: "5 Year Exp.",
  //           ),
  //         ),
  //         SizedBox(height: 15.v),
  //         Container(
  //           decoration: AppDecoration.outlineGray.copyWith(
  //             borderRadius: BorderRadiusStyle.roundedBorder20,
  //           ),
  //           child: Row(
  //             children: [
  //               CustomElevatedButton(
  //                 height: 40.v,
  //                 width: 175.h,
  //                 text: "Book Hospital Visit",
  //                 leftIcon: Container(
  //                   margin: EdgeInsets.only(right: 3.h),
  //                   child: CustomImageView(
  //                     imagePath: ImageConstant.imgHospitalsvgrepocom1,
  //                     height: 24.adaptSize,
  //                     width: 24.adaptSize,
  //                   ),
  //                 ),
  //                 buttonStyle: CustomButtonStyles.outlineBlack,
  //                 buttonTextStyle: CustomTextStyles.bodySmallOnPrimary_1,
  //               ),
  //               _buildFrame(
  //                 context,
  //                 bookDigitalConsult: "Book Digital Consult",
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  /// Section Widget
  Widget _buildFrame5(BuildContext context) {
    return loading2 == true
        ? CircularProgressIndicator()
        : CustomOutlinedButton(
            height: 48.v,
            width: 300.h,
            text: "For More information please call " + user1.number,
            leftIcon: Container(
                margin: EdgeInsets.only(right: 2.h),
                child: CustomImageView(
                    imagePath: ImageConstant.imgHospitalsvgrepocom1,
                    height: 26.adaptSize,
                    width: 26.adaptSize)),
            buttonStyle: CustomButtonStyles.outlinePrimary);
  }

  // /// Common widget
  // Widget _buildUsmanYousafPT(
  //   BuildContext context, {
  //   required String drRajKrishna,
  //   required String pediatricSpecialist,
  //   required String mDInPaediatrics,
  //   required String duration,
  // }) {
  //   return Row(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Container(
  //         height: 60.adaptSize,
  //         width: 60.adaptSize,
  //         margin: EdgeInsets.only(bottom: 19.v),
  //         child: Stack(
  //           alignment: Alignment.center,
  //           children: [
  //             CustomImageView(
  //               imagePath: ImageConstant.imgUsmanYousafPt,
  //               height: 60.adaptSize,
  //               width: 60.adaptSize,
  //               radius: BorderRadius.circular(
  //                 30.h,
  //               ),
  //               alignment: Alignment.center,
  //             ),
  //             CustomImageView(
  //               imagePath: ImageConstant.imgNursePortrait,
  //               height: 60.adaptSize,
  //               width: 60.adaptSize,
  //               radius: BorderRadius.circular(
  //                 30.h,
  //               ),
  //               alignment: Alignment.center,
  //             ),
  //           ],
  //         ),
  //       ),
  //       Padding(
  //         padding: EdgeInsets.only(
  //           left: 22.h,
  //           top: 2.v,
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               drRajKrishna,
  //               style: theme.textTheme.titleMedium!.copyWith(
  //                 color: appTheme.black900,
  //               ),
  //             ),
  //             SizedBox(height: 3.v),
  //             Text(
  //               pediatricSpecialist,
  //               style: theme.textTheme.bodyMedium!.copyWith(
  //                 color: appTheme.gray600,
  //               ),
  //             ),
  //             SizedBox(height: 3.v),
  //             Text(
  //               mDInPaediatrics,
  //               style: theme.textTheme.bodyMedium!.copyWith(
  //                 color: appTheme.gray600,
  //               ),
  //             ),
  //             SizedBox(height: 4.v),
  //             Text(
  //               duration,
  //               style: theme.textTheme.bodyMedium!.copyWith(
  //                 color: appTheme.gray600,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // /// Common widget
  // Widget _buildFrame(
  //   BuildContext context, {
  //   required String bookDigitalConsult,
  // }) {
  //   return Container(
  //     width: 167.h,
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 12.h,
  //       vertical: 8.v,
  //     ),
  //     decoration: AppDecoration.outlineBlack.copyWith(
  //       borderRadius: BorderRadiusStyle.roundedBorder20,
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         CustomImageView(
  //           imagePath: ImageConstant.imgFrame,
  //           height: 24.v,
  //           width: 26.h,
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(
  //             top: 6.v,
  //             bottom: 3.v,
  //           ),
  //           child: Text(
  //             bookDigitalConsult,
  //             style: CustomTextStyles.bodySmallBlack900.copyWith(
  //               color: appTheme.black900,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates back to the previous screen.
  onTapBtnArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
