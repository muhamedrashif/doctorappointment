import 'package:doctorappointment/screens/bill_history_screen/widgets/bill_item_widget.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:doctorappointment/widgets/app_bar/appbar_title.dart';
import 'package:doctorappointment/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BillHistoryScreen extends StatefulWidget {
  const BillHistoryScreen({Key? key}) : super(key: key);

  @override
  State<BillHistoryScreen> createState() => _BillHistoryScreenState();
}

class _BillHistoryScreenState extends State<BillHistoryScreen> {
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
                        child: Column(children: [
                          _buildInvoice(context),
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
        leading: AppbarLeadingIconbuttonOne(
            imagePath: ImageConstant.imgArrowLeftPrimary,
            margin: EdgeInsets.only(left: 16.h, top: 7.v, bottom: 7.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Bill History"));
  }

  /// Section Widget
  Widget _buildInvoice(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 21.v);
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return const BillHistoryItemWidget();
        });
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
