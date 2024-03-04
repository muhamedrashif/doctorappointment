import 'dart:developer';

import 'package:doctorappointment/screens/token_page/token_page.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/app_bar/appbar_title.dart';
import 'package:doctorappointment/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class TokenTabContainerScreen extends StatefulWidget {
  const TokenTabContainerScreen({Key? key}) : super(key: key);

  @override
  TokenTabContainerScreenState createState() => TokenTabContainerScreenState();
}

// ignore_for_file: must_be_immutable
class TokenTabContainerScreenState extends State<TokenTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabviewController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then

    log("clickeddd");
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    log("zzzzzzzzzzzzzzzzzz");
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      // child: WillPopScope(
      // onWillPop:() {
      //   log("clickeddd");
      //   return Future.value(false);

      // },
      child: Scaffold(
          appBar: _buildAppBar(context),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 27.v),
                  _buildTabview(context),
                  SizedBox(
                      height: 684.v,
                      child: TabBarView(
                          physics: const BouncingScrollPhysics(),
                          controller: tabviewController,
                          children: const [
                            TokenPage(status: '0'),
                            TokenPage(status: '1'),
                            // TokenPage(status: '2')
                          ]))
                ])),
          )),
      // )
    );
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
        title: AppbarTitle(text: "Tokens"));
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    setState(() {});
    return Container(
        height: 42.v,
        width: 358.h,
        decoration: BoxDecoration(
            color: appTheme.gray400, borderRadius: BorderRadius.circular(20.h)),
        child: TabBar(
            controller: tabviewController,
            labelPadding: EdgeInsets.zero,
            labelColor: theme.colorScheme.onPrimary.withOpacity(1),
            labelStyle: TextStyle(
                fontSize: 12.fSize,
                fontFamily: 'Sansation',
                fontWeight: FontWeight.w400),
            unselectedLabelColor: theme.colorScheme.onPrimary.withOpacity(1),
            unselectedLabelStyle: TextStyle(
                fontSize: 12.fSize,
                fontFamily: 'Sansation',
                fontWeight: FontWeight.w400),
            indicator: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(20.h)),
            tabs: const [
              Tab(child: Text("Upcoming")),
              Tab(child: Text("Completed")),
              // Tab(child: Text("Cancelled"))
            ]));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates back to the previous screen.
  onTapBtnArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
