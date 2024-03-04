import 'dart:developer';

import 'package:doctorappointment/commonViewModel/commonViewModel.dart';
import 'package:doctorappointment/model_view/getpersonalwellness.dart';
import 'package:doctorappointment/screens/specialities_screen/widgets/view_all_widget.dart';
import 'package:doctorappointment/services/webservice.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/app_bar/appbar_title.dart';
import 'package:doctorappointment/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:doctorappointment/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalwellnessScreen extends StatefulWidget {
  const PersonalwellnessScreen({super.key});

  @override
  State<PersonalwellnessScreen> createState() => _PersonalwellnessScreenState();
}

class _PersonalwellnessScreenState extends State<PersonalwellnessScreen> {
  TextEditingController searchController = TextEditingController();
  late CommonViewModel vm;

  List<GetpersonalwellnessViewModel> _searchItems = [];
  @override
  void initState() {
    super.initState();
    vm = Provider.of<CommonViewModel>(context, listen: false);
    vm
        .getpersonalwellnes()
        .whenComplete(() => _searchItems = vm.getpersonalwellness);
    setState(() {});
  }

  @override
  void dispose() {
    vm.getpersonalwellness.clear();
    // TODO: implement dispose
    super.dispose();
  }

  void _runFilter(String enteredKeyword) {
    List<GetpersonalwellnessViewModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = vm.getpersonalwellness;
    } else {
      results = vm.getpersonalwellness
          .where((item) => item.datas.personalWellnessName
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    log("Sercheddd");

    setState(() {
      _searchItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            title: AppbarTitle(text: "Personal Wellness")),
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: Column(
            children: [
              SizedBox(height: 56.v),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Column(
                      children: [
                        CustomSearchView(
                          onChanged: (value) {
                            _runFilter(value);
                          },
                          controller: searchController,
                          hintText: "Search Personal Wellness",
                        ),
                        SizedBox(height: 22.v),
                        _buildSpecialities(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSpecialities(BuildContext context) {
    return Consumer<CommonViewModel>(builder: (context, value, child) {
      return _searchItems.length != 0 || searchController.text.isNotEmpty
          ? _searchItems.length == 0
              ? Text("no data")
              : ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _searchItems.length,
                  itemBuilder: (context, index) {
                    return ViewallWidget(
                      type: "2",
                      id: _searchItems[index].id,
                      image: WebService().imageurl + _searchItems[index].image,
                      name: _searchItems[index].personalWellnessName,
                    );
                  })
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: value.getpersonalwellness.length,
              itemBuilder: (context, index) {
                return ViewallWidget(
                  type: "2",
                  id: value.getpersonalwellness[index].id,
                  image: WebService().imageurl +
                      value.getpersonalwellness[index].image,
                  name: value.getpersonalwellness[index].personalWellnessName,
                );
              });
    });
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
