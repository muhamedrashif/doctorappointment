import 'dart:io';
import 'package:doctorappointment/commonViewModel/commonViewModel.dart';
import 'package:doctorappointment/model/getprofile.dart';
import 'package:doctorappointment/screens/account_profile_screen/edit_profile_screen.dart';
import 'package:doctorappointment/services/webservice.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountProfileScreen extends StatefulWidget {
  const AccountProfileScreen({Key? key}) : super(key: key);

  @override
  State<AccountProfileScreen> createState() => _AccountProfileScreenState();
}

class _AccountProfileScreenState extends State<AccountProfileScreen> {
  File? imageURI;

  late CommonViewModel vm;
  late Getprofile user;
  bool loading = true;

  @override
  void initState() {
    vm = Provider.of<CommonViewModel>(context, listen: false);

    // TODO: implement initState
    super.initState();

    Future<Map<String, dynamic>> successfulMessage = vm.getprofile();
    successfulMessage.then((response) async {
      print("response :" + response.toString());
      if (response['status']) {
        print(response);
        setState(() {
          loading = false;
        });
        user = response['user'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: loading == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 35.v),
                        child: Column(children: [
                          Container(
                              height: 140.adaptSize,
                              width: 140.adaptSize,
                              decoration: AppDecoration.fillPrimary.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder131),
                              child: user.image == "0"
                                  ? CustomImageView(
                                      fit: BoxFit.cover,
                                      imagePath:
                                          ImageConstant.imgGroupOnprimary,
                                      height: 140.adaptSize,
                                      width: 140.adaptSize,
                                      radius: BorderRadius.circular(131.h),
                                      alignment: Alignment.center)
                                  : CustomImageView(
                                      fit: BoxFit.cover,
                                      imagePath: WebService().profileImage +
                                          user.image,
                                      height: 140.adaptSize,
                                      width: 140.adaptSize,
                                      radius: BorderRadius.circular(131.h),
                                      alignment: Alignment.center)),
                          SizedBox(height: 39.v),
                          TextFormField(
                            readOnly: true,
                            enabled: false,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Name',
                              hintText: user.name,
                              hintStyle: const TextStyle(color: Colors.black),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 25.v),
                          TextFormField(
                            readOnly: true,
                            enabled: false,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Email Id',
                              hintText: user.email,
                              hintStyle: const TextStyle(color: Colors.black),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 25.v),
                          TextFormField(
                            readOnly: true,
                            enabled: false,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Phone',
                              hintText: user.phone,
                              hintStyle: const TextStyle(color: Colors.black),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 25.v),
                          TextFormField(
                            readOnly: true,
                            enabled: false,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Location',
                              hintText: user.address,
                              hintStyle: const TextStyle(color: Colors.black),
                              border: const OutlineInputBorder(),
                            ),
                          ),
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
        title: SizedBox(
            height: 23.v,
            width: 58.h,
            child: Stack(alignment: Alignment.center, children: [
              Align(
                  alignment: Alignment.center,
                  child: Text("Profile", style: theme.textTheme.titleLarge))
            ])),
        actions: [
          CustomImageView(
            imagePath: ImageConstant.imgNotificationPrimary,
            margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 7.v),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditProfileScreen(user: user)));
            },
          )
        ]);
  }
}
