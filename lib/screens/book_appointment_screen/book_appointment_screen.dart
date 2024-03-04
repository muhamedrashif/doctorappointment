import 'dart:developer';
import 'package:doctorappointment/commonViewModel/commonViewModel.dart';
import 'package:doctorappointment/screens/book_appointment_container_screen/book_appointment_container.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/app_bar/appbar_title.dart';
import 'package:doctorappointment/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookAppointmentScreen extends StatefulWidget {
  final String docId;
  final String docImage;
  final String docName;
  final String docSpecialised;
  final String docQualification;
  final String docExp;
  final String description;
  const BookAppointmentScreen(
      {super.key,
      required this.docId,
      required this.docImage,
      required this.docName,
      required this.docSpecialised,
      required this.docQualification,
      required this.docExp,
      required this.description});
  @override
  BookAppointmentScreenState createState() => BookAppointmentScreenState();
}

// ignore_for_file: must_be_immutable
class BookAppointmentScreenState extends State<BookAppointmentScreen>
    with TickerProviderStateMixin {
  late CommonViewModel vm;
  bool selected = false;
  int va = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm = Provider.of<CommonViewModel>(context, listen: false);
    vm.gettimee.clear();
    vm.getdate(widget.docId);
  }

  String? appointmentdate;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 14.v),
                  child: Column(children: [
                    _buildFrame(context),
                    _buildFrame300(context),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 484.v,
                        child: BookAppointmentContainerScreen(
                          docId: widget.docId,
                          docImage: widget.docImage,
                          docName: widget.docName,
                          docQualification: widget.docQualification,
                          docSpecialised: widget.docSpecialised,
                          docExp: widget.docExp,
                          appointmentdate: appointmentdate.toString(),
                          description: widget.description,
                        ))
                  ])),
            )));
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
        title: AppbarTitle(text: "Appointment Booking"));
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
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
          ],
        ),
      ),
    );
  }

  int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  /// Section Widget
  Widget _buildFrame300(BuildContext context) {
    return SizedBox(
      height: 82.v,
      width: 374.h,

      child: Align(
          alignment: Alignment.centerLeft,
          child: Consumer<CommonViewModel>(builder: (context, value, child) {
            // log("aaaaa===" + value.getdatee.length.toString());
            return value.getdatee.length == 0
                ? const Text("No dates available")
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: value.getdatee.length,
                    // list item builder
                    itemBuilder: (BuildContext ctx, index) {
                      final DateFormat formatter = DateFormat('dd-MM-yyyy');
                      final String formatted =
                          formatter.format(value.getdatee[index].date);

                      log("qqqqqqqqqqqqq====" + formatted);

                      int cc = calculateDifference(value.getdatee[index].date);

                      log("ccc==" + cc.toString());
                      // dateConverter(formatted);
                      return Theme(
                        data: ThemeData(
                          canvasColor: Colors.transparent,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: cc <= -1
                                ? const SizedBox()
                                : RawChip(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 11.h,
                                      vertical: 14.v,
                                    ),
                                    showCheckmark: false,
                                    labelPadding: const EdgeInsets.all(2),
                                    label: Text(
                                      cc == -1
                                          ? "Yeasterday"
                                          : cc == 0
                                              ? "Today"
                                              : cc == 1
                                                  ? "Tomorrow"
                                                  : formatted.toString(),
                                      style: TextStyle(
                                        color: va == index
                                            ? Colors.white
                                            : Colors.teal,
                                        fontSize: 15.fSize,
                                        fontFamily: 'Sansation',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    selected: false,
                                    backgroundColor: va == index
                                        ? const Color(0XFF008771)
                                        : Colors.transparent,
                                    selectedColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: theme.colorScheme.primary,
                                        width: 1.h,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        5.h,
                                      ),
                                    ),
                                    onSelected: (value1) {
                                      setState(() {
                                        selected = true;
                                        va = index;
                                      });
                                      log("=====================" +
                                          value.getdatee[index].doctorid
                                              .toString() +
                                          "appointmentdate" +
                                          value.getdatee[index].date
                                              .toString());
                                      vm.gettime(value.getdatee[index].doctorid,
                                          value.getdatee[index].date);

                                      final DateFormat formatter =
                                          DateFormat('dd-MM-yyyy');
                                      final String formatted = formatter
                                          .format(value.getdatee[index].date);
                                      appointmentdate = formatted;
                                    },
                                  )),
                      );
                      //      Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Container(
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Align(
                      //               alignment: Alignment.center,
                      //               child: Text(
                      //                 time[index],
                      //                 style: const TextStyle(
                      //                   fontWeight: FontWeight.w600,
                      //                 ),
                      //               )),
                      //         ),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(20),
                      //           color: _selectIndex == index
                      //               ? theme.colorScheme.primary
                      // : theme.colorScheme.onPrimary.withOpacity(1),
                      //         ),
                      //         // height: 100,
                      //          width: 110,
                      //       ),
                      //     );
                    },
                  );
          })),
      // child: TabBar(
      //     controller: tabviewController,
      //     isScrollable: true,
      //     labelColor: theme.colorScheme.primary,
      //     unselectedLabelColor: theme.colorScheme.onPrimary.withOpacity(1),
      //     tabs: [
      //       Tab(child: Text("Today")),
      //       Tab(child: Text("Tomorrow")),
      //       Tab(child: Text("01 Dec")),
      //       Tab(child: Text("02 Dec")),
      //       Tab(child: Text("03 Dec"))
      //     ])
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  // List time = [
  //   "Today",
  //   "Tomorrow",
  //   "01 Dec",
  //   "02 Dec",
  //   "03 Dec",
  //   "Today",
  //   "Tomorrow",
  //   "01 Dec",
  //   "02 Dec",
  //   "03 Dec",
  // ];

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates back to the previous screen.
  onTapBtnArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
