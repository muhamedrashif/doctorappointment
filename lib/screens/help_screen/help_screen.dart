import 'package:doctorappointment/commonViewModel/commonViewModel.dart';
import 'package:doctorappointment/model/getclinicinfo.dart';
import 'package:doctorappointment/screens/help_screen/widgets/twentyeight_item_widget.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/app_bar/appbar_title.dart';
import 'package:doctorappointment/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:doctorappointment/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  late CommonViewModel vm;
  late Clinic user1;
  bool loading2 = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm = Provider.of<CommonViewModel>(context, listen: false);

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
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 34.v),
                  child: Column(children: [
                    Text("Frequently Asked Questions",
                        style: CustomTextStyles.titleLargeRegular),
                    SizedBox(height: 14.v),
                    _buildTwentyEight(context),
                    SizedBox(height: 62.v),
                    loading2 == true
                        ? CircularProgressIndicator()
                        : CustomOutlinedButton(
                            width: 300.h,
                            text: "For More information please call " +
                                user1.number,
                            leftIcon: Container(
                                margin: EdgeInsets.only(right: 2.h),
                                child: CustomImageView(
                                    imagePath:
                                        ImageConstant.imgHospitalsvgrepocom1,
                                    height: 26.adaptSize,
                                    width: 26.adaptSize)),
                            buttonTextStyle: CustomTextStyles.bodySmallPrimary),
                    SizedBox(height: 5.v)
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
        title: AppbarTitle(text: "Help"));
  }

  /// Section Widget
  Widget _buildTwentyEight(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const TwentyeightItemWidget();
        });
  }

}
