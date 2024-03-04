import 'dart:io';
import 'package:doctorappointment/commonViewModel/commonViewModel.dart';
import 'package:doctorappointment/model/getprofile.dart';
import 'package:doctorappointment/screens/home_screen/widgets/container_widget.dart';
import 'package:doctorappointment/screens/home_screen/widgets/home_item_widget.dart';
import 'package:doctorappointment/screens/notification_screen/notification_screen.dart';
import 'package:doctorappointment/services/webservice.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:doctorappointment/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  // final CarouselController carouselController = CarouselController();
  late CommonViewModel vm;
  late Getprofile user;
  bool loading = true;
  //  String name="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm = Provider.of<CommonViewModel>(context, listen: false);
    vm.getdoctors("0", "4");
    vm.gettodaydoctors();
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
    // fetch();
  }

//  fetch() async {
//       final _prefs = await SharedPreferences.getInstance();
//               _prefs.setBool('isLoggedIn', true);
//               _prefs.setString('name', user.name.toString());
//               _prefs.setString('phone', phonenumber.toString());
//  }

  int sliderIndex = 0;
  List carousel = [
    CustomImageView(
      imagePath: ImageConstant.img183001235973620,
      height: 148.v,
      width: 312.h,
      radius: BorderRadius.circular(
        10.h,
      ),
      margin: EdgeInsets.only(left: 16.h),
    ),
    CustomImageView(
      imagePath: ImageConstant.img183001235973620,
      height: 148.v,
      width: 312.h,
      radius: BorderRadius.circular(
        10.h,
      ),
      margin: EdgeInsets.only(left: 16.h),
    ),
  ];

  List containerItemWidget = [
    ContainerItemWidget(
      image: ImageConstant.imgFrame18,
      name: "Book\nAppointment",
    ),
    ContainerItemWidget(
      image: ImageConstant.imgFrame19,
      name: "Digital Consult",
    ),
    ContainerItemWidget(
      image: ImageConstant.imgFrame20,
      name: "Show Token",
    ),
    ContainerItemWidget(
      image: ImageConstant.medi,
      name: "Medi Mart",
    ),
    ContainerItemWidget(
      image: ImageConstant.imgFrame22,
      name: "Book \nLab Test",
    ),
    ContainerItemWidget(
      image: ImageConstant.imgFrame23,
      name: "Bill History",
    ),
  ];

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context, barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you want to exit'),
            backgroundColor: Colors.teal[50],
            actions: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  //return false when click on "NO"
                  child: Container(
                      height: 30,
                      width: 40,
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
                  onTap: () => exit(0),
                  //return true when click on "Yes"
                  child: Container(
                      height: 30,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.teal,
                      ),
                      child: const Center(
                          child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white),
                      ))),
                ),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: WillPopScope(
      onWillPop: showExitPopup,
      // onWillPop: () {
      //   log("clickeddd");
      //   // Navigator.push(context, MaterialPageRoute(
      //   //   builder: (context) {
      //   //     return HomeContainerScreen();
      //   //   },
      //   // ));
      //   return Future.value(false);
      // },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: _buildAppBar(context),
          body: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 6.v),
                  child: Column(children: [
                    // Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 16.h),
                    //     child: CustomSearchView(
                    //         controller: searchController,
                    //         hintText:
                    //             "Search Doctors, Specialists & Symptoms")),
                    SizedBox(height: 16.v),
                    _buildFrameSeventeen(context),
                    SizedBox(height: 16.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 16.h),
                            child: Text("Today Doctors",
                                style: theme.textTheme.titleLarge))),
                    SizedBox(height: 15.v),
                    _buildScrollBaar(context),
                    // SizedBox(height: 15.v),
                    // SizedBox(
                    //     height: 7.v,
                    //     child: AnimatedSmoothIndicator(
                    //         activeIndex: sliderIndex,
                    //         count: 2,
                    //         axisDirection: Axis.horizontal,
                    //         effect: ScrollingDotsEffect(
                    //             spacing: 2.96,
                    //             activeDotColor: appTheme.gray60001,
                    //             dotColor: appTheme.blueGray100,
                    //             dotHeight: 7.v,
                    //             dotWidth: 7.h))),
                    SizedBox(height: 15.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 16.h),
                            child: Text("Other Services",
                                style: theme.textTheme.titleLarge))),
                    SizedBox(height: 15.v),
                    _buildHome(context),
                    SizedBox(height: 16.v),
                    Container(
                        height: 75.v,
                        width: 358.h,
                        decoration: BoxDecoration(
                            color: appTheme.gray100,
                            borderRadius: BorderRadius.circular(10.h)))
                  ])))),
    ));
  }

  /// Section Widget
  ///
  ///
  ///
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 72.h,
        leading: loading == true
            ? CustomImageView(
                margin: EdgeInsets.only(left: 30.h, top: 5.v, bottom: 8.v),
                color: Colors.teal,
                imagePath: ImageConstant.imgIcSharpAccountCircle,
                height: 47.adaptSize,
                width: 47.adaptSize,
              )
            : user.image == "0"
                ? CustomImageView(
                    margin: EdgeInsets.only(left: 30.h, top: 5.v, bottom: 8.v),
                    color: Colors.teal,
                    imagePath: ImageConstant.imgIcSharpAccountCircle,
                    height: 47.adaptSize,
                    width: 47.adaptSize,
                  )
                : CustomImageView(
                    radius: BorderRadius.circular(10),
                    margin: EdgeInsets.only(left: 30.h, top: 5.v, bottom: 8.v),
                    fit: BoxFit.cover,
                    imagePath: WebService().profileImage + user.image,
                    height: 47.adaptSize,
                    width: 47.adaptSize,
                  ),
        title: Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: RichText(
                text: TextSpan(children: [
                  loading == false
                      ? TextSpan(
                          text: "Hello, " + user.name,
                          style: CustomTextStyles.titleMedium18)
                      : TextSpan(
                          text: "Hello, ",
                          style: CustomTextStyles.titleMedium18),
                  TextSpan(
                      text: " What do you feel?",
                      style: CustomTextStyles.bodyLarge18)
                ]),
                textAlign: TextAlign.left)),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgNotification,
              margin: EdgeInsets.fromLTRB(25.h, 4.v, 25.h, 6.v),
              onTap: () {
                onTapNotification(context);
              })
        ]);
  }

  /// Section Widget
  Widget _buildFrameSeventeen(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 30.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: SizedBox(
            height: 180.v,
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              children: List.generate(6, (index) => containerItemWidget[index]),
            )));
  }

  /// Section Widget
  Widget _buildScrollBaar(BuildContext context) {
    return Stack(
      children: [
        Consumer<CommonViewModel>(
          builder: (context, value, child) {
            return value.gettodaydoctor.isEmpty
                ? const Text("No doctors available")
                : ImageSlider(banner: value.gettodaydoctor);
            // CarouselSlider(
            //     items: value.gettodaydoctor
            //         .map((item) => ScrollbaarItemWidget(
            //             docId: item.doctorid,
            //             docImage: WebService().imageurl + item.image,
            //             docName: item.name,
            //             docSpecialised: item.specialisedname,
            //             docQualification: item.qualification,
            //             docExp: item.experience))
            //         .toList(),
            //     carouselController: carouselController,
            //     options: CarouselOptions(
            //       scrollPhysics: const BouncingScrollPhysics(),
            //       autoPlay: true,
            //       aspectRatio: 17 / 9.5,
            //       viewportFraction: 1,
            //       initialPage: 0,
            //       enableInfiniteScroll: true,
            //       scrollDirection: Axis.horizontal,
            //     ));
          },
        ),
        // Positioned(
        //   bottom: 0,
        //   left: 0,
        //   right: 0,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: vm.getdoctor.asMap().entries.map((entry) {
        //       log("ssssssssssss--------"+entry.toString());
        //       log(entry.key.toString());
        //       return GestureDetector(
        //         onTap: () => carouselController.animateToPage(entry.key),
        //         child: Container(
        //           width: sliderIndex == entry.key ? 17 : 7,
        //           height: 7,
        //           margin: const EdgeInsets.symmetric(horizontal: 3),
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: sliderIndex == entry.key
        //                   ? Colors.white
        //                   : Colors.teal),
        //         ),
        //       );
        //     }).toList(),
        //   ),
        // )
      ],
    );
    // return CarouselSlider.builder(
    //     options: CarouselOptions(
    //       height: 180.v,
    //       initialPage: 0,
    //       autoPlay: true,
    //       viewportFraction: 1.0,
    //       enableInfiniteScroll: false,
    //       scrollDirection: Axis.horizontal,
    //       // onPageChanged: (index, reason) {
    //       //   sliderIndex = index;
    //       // }
    //     ),
    //     itemCount: value.getImagescroll.length,
    //     itemBuilder: (context, index, realIndex) {
    //       return SizedBox(
    //         width: double.maxFinite,
    //         child: CarouselSlider(
    //             items: value.getdoctor
    //                 .map((item) => CustomImageView(
    //                       imagePath: WebService().imageurl +
    //                           value.getImagescroll[index].image,
    //                       height: 148.v,
    //                       width: 312.h,
    //                       radius: BorderRadius.circular(
    //                         10.h,
    //                       ),
    //                       margin: EdgeInsets.only(left: 16.h),
    //                     ))
    //                 .toList(),
    //             carouselController: carouselController,
    //             options: CarouselOptions(
    //               scrollPhysics: const BouncingScrollPhysics(),
    //               autoPlay: true,
    //               aspectRatio: 16 / 9.5,
    //               viewportFraction: 1,
    //             )),
    //       );
    //     });
  }

  /// Section Widget
  Widget _buildHome(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 16.v);
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return const HomeItemWidget();
            }));
  }

  // /// Common widget
  // Widget _buildWidget(
  //   BuildContext context, {
  //   Function? onTapIconButton,
  // }) {
  //   return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //     CustomIconButton(
  //         height: 44.adaptSize,
  //         width: 44.adaptSize,
  //         padding: EdgeInsets.all(10.h),
  //         decoration: IconButtonStyleHelper.fillOnPrimary,
  //         child: CustomImageView(imagePath: ImageConstant.imgFrame21)),
  //     CustomIconButton(
  //         height: 44.adaptSize,
  //         width: 44.adaptSize,
  //         padding: EdgeInsets.all(10.h),
  //         decoration: IconButtonStyleHelper.fillOnPrimary,
  //         child: CustomImageView(imagePath: ImageConstant.imgFrame22)),
  //     CustomIconButton(
  //         height: 44.adaptSize,
  //         width: 44.adaptSize,
  //         padding: EdgeInsets.all(10.h),
  //         decoration: IconButtonStyleHelper.fillOnPrimary,
  //         onTap: () {
  //           onTapIconButton!.call();
  //         },
  //         child: CustomImageView(imagePath: ImageConstant.imgFrame23))
  //   ]);
  // }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapNotification(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const NotificationScreen();
      },
    ));
    // Navigator.pushNamed(context, '/notification_screen');
  }

  // /// Navigates to the tokenTabContainerScreen when the action is triggered.
  // onTapToken(BuildContext context) {
  //    Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return TokenTabContainerScreen();
  //   },));
  //   //  Navigator.pushNamed(context, AppRoutes.token_tab_container_screen);
  // }

  // /// Navigates to the invoiceScreen when the action is triggered.
  // onTap(BuildContext context) {
  //    Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return BillHistoryScreen();
  //   },));
  //   //  Navigator.pushNamed(context, AppRoutes.bill_history_screen);
  // }
}
