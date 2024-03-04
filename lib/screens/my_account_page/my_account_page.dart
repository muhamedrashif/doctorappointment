import 'package:doctorappointment/commonViewModel/commonViewModel.dart';
import 'package:doctorappointment/model/getprofile.dart';
import 'package:doctorappointment/screens/account_profile_screen/profile_screen.dart';
import 'package:doctorappointment/screens/home_container_screen/home_container_screen.dart';
import 'package:doctorappointment/screens/splash_screen/start_screen.dart';
import 'package:doctorappointment/services/webservice.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../my_account_page/widgets/help_item_widget.dart';
import 'package:flutter/material.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  List more = [
    HelpItemWidget(
      image: ImageConstant.imgVectorBlack900,
      title: "Help",
      subtitle: "FAQ, get help or raise a query",
    ),
    HelpItemWidget(
        image: ImageConstant.imgVectorBlack900,
        title: "Privacy Policy",
        subtitle: "FAQ, get help or raise a query"),
    HelpItemWidget(
        image: ImageConstant.imgVectorBlack900,
        title: "Abut Us",
        subtitle: "FAQ, get help or raise a query"),
  ];
  late CommonViewModel vm;
  late Getprofile user;
  bool loading = true;
  @override
  void initState() {
    super.initState();
    vm = Provider.of<CommonViewModel>(context, listen: false);
    Future<Map<String, dynamic>> successfulMessage = vm.getprofile();
    successfulMessage.then((response) async {
      print("response =============:" + response.toString());
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
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: const Icon(Icons.logout_outlined),
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => AlertDialog(
                          title: const Text('Logout'),
                          content: const Text('Do you want to Logout'),
                          backgroundColor: Colors.teal[50],
                          actions: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () => Navigator.pop(context),
                                //return false when click on "NO"
                                child: Container(
                                    height: 30,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.teal,
                                    ),
                                    child: const Center(
                                        child: Text(
                                      'No',
                                      style: TextStyle(color: Colors.white),
                                    ))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () async {
                                  final _prefs =
                                      await SharedPreferences.getInstance();
                                  _prefs.setBool('isLoggedIn', false);
                                  _prefs.setString('name', "");
                                  _prefs.setString('phone', "");
                                  await FirebaseAuth.instance.signOut();
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return const StartScreen();
                                    },
                                  ));
                                },
                                //return false when click on "NO"
                                child: Container(
                                    height: 30,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.teal,
                                    ),
                                    child: const Center(
                                        child: Text(
                                      'Logout',
                                      style: TextStyle(color: Colors.white),
                                    ))),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )),
            Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillGray,
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v),
                    child: Column(children: [
                      Text("My Account", style: theme.textTheme.titleLarge),
                      SizedBox(height: 15.v),
                      _buildFrameSeventeen(context),
                      SizedBox(height: 19.v),
                      _buildLabTestsAndDoctor(context),
                      SizedBox(height: 16.v),
                      _buildAllHeathRecord(context),
                      SizedBox(height: 40.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child:
                              Text("More", style: theme.textTheme.titleMedium)),
                      SizedBox(height: 15.v),
                      _buildHelp(context),
                      SizedBox(
                        height: 15.v,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.all(4.0),
                      //       child: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      //     ),
                      //   ],
                      // )
                    ]))),
          ],
        ),
      )),
    ));
  }

  /// Section Widget
  Widget _buildFrameSeventeen(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(11.h),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 4.v),
              Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                              loading == false
                                  ? TextSpan(
                                      text: user.name,
                                      style: CustomTextStyles
                                          .bodyMediumOnPrimary_1)
                                  : TextSpan(
                                      text: "",
                                      style: CustomTextStyles
                                          .bodyMediumOnPrimary_1),
                              const TextSpan(text: " "),
                              loading == false
                                  ? TextSpan(
                                      text: user.phone,
                                      style:
                                          CustomTextStyles.bodySmallOnPrimary)
                                  : TextSpan(
                                      text: "",
                                      style: CustomTextStyles
                                          .bodyMediumOnPrimary_1),
                            ]),
                            textAlign: TextAlign.left),
                        // CustomImageView(
                        //     imagePath: ImageConstant.imgVectorOnprimary,
                        //     height: 6.v,
                        //     width: 11.h,
                        //     margin: EdgeInsets.only(bottom: 7.v))
                      ])),
              SizedBox(height: 5.v),
              SizedBox(
                  height: 60.v,
                  child: ListView.separated(
                      padding: EdgeInsets.only(left: 3.h, right: 80.h),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 20.h);
                      },
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            loading == true
                                ? CustomImageView(
                                    imagePath:
                                        ImageConstant.imgIcSharpAccountCircle,
                                    height: 47.adaptSize,
                                    width: 47.adaptSize,
                                  )
                                : user.image == "0"
                                    ? CustomImageView(
                                        imagePath: ImageConstant
                                            .imgIcSharpAccountCircle,
                                        height: 47.adaptSize,
                                        width: 47.adaptSize,
                                      )
                                    : CustomImageView(
                                        radius: BorderRadius.circular(10),
                                        fit: BoxFit.cover,
                                        imagePath: WebService().profileImage +
                                            user.image,
                                        height: 47.adaptSize,
                                        width: 47.adaptSize,
                                      ),
                            loading == false
                                ? Text(
                                    user.name,
                                    style:
                                        CustomTextStyles.bodySmallOnPrimary10,
                                  )
                                : Text(
                                    "",
                                    style:
                                        CustomTextStyles.bodySmallOnPrimary10,
                                  )
                          ],
                        );
                      })),
              SizedBox(height: 10.v),
              Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () {
                        onTapTxtManageProfiles(context);
                      },
                      child: Text("Manage Profiles",
                          style: CustomTextStyles.bodySmallOnPrimary_1)))
            ]));
  }

  /// Section Widget
  Widget _buildLabTestsAndDoctor(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 10.v),
        decoration: AppDecoration.outlinePrimary1
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 44.adaptSize,
              width: 44.adaptSize,
              padding: EdgeInsets.all(10.h),
              decoration: IconButtonStyleHelper.fillGrayC,
              child: CustomImageView(
                  imagePath: ImageConstant.imgFrame22Onprimary)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 12.h, top: 5.v, bottom: 4.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Lab Tests and Doctor Consultant",
                            style: theme.textTheme.bodyLarge),
                        SizedBox(height: 2.v),
                        Text("Order  History and Transaction",
                            style: theme.textTheme.bodySmall)
                      ]))),
          CustomImageView(
              imagePath: ImageConstant.imgVectorBlack900,
              height: 11.v,
              width: 6.h,
              margin: EdgeInsets.only(left: 24.h, top: 16.v, bottom: 16.v))
        ]));
  }

  /// Section Widget
  Widget _buildAllHeathRecord(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 10.v),
        decoration: AppDecoration.outlinePrimary1
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 44.adaptSize,
              width: 44.adaptSize,
              padding: EdgeInsets.all(10.h),
              decoration: IconButtonStyleHelper.fillGrayC,
              child: CustomImageView(
                  imagePath: ImageConstant.imgFrame22Onprimary)),
          Padding(
              padding: EdgeInsets.only(left: 12.h, top: 5.v, bottom: 4.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("All Heath Record", style: theme.textTheme.bodyLarge),
                    SizedBox(height: 2.v),
                    Text("Reports, Prescription, Bill & More",
                        style: theme.textTheme.bodySmall)
                  ])),
          const Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgVectorBlack900,
              height: 11.v,
              width: 6.h,
              margin: EdgeInsets.only(top: 16.v, right: 4.h, bottom: 16.v))
        ]));
  }

  /// Section Widget
  Widget _buildHelp(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 16.v);
        },
        itemCount: more.length,
        itemBuilder: (context, index) {
          return more[index];
        });
  }

  /// Navigates to the accountProfileScreen when the action is triggered.
  onTapTxtManageProfiles(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const AccountProfileScreen();
      },
    ));
    // Navigator.pushNamed(context, AppRoutes.accountProfileScreen);
  }
}
