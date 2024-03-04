import 'package:doctorappointment/commonViewModel/commonViewModel.dart';
import 'package:doctorappointment/screens/home_container_screen/home_container_screen.dart';
import 'package:doctorappointment/screens/specialities_screen/browse_symptom.dart';
import 'package:doctorappointment/screens/specialities_screen/top_specialised.dart';
import 'package:doctorappointment/services/webservice.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'personal_wellness.dart';
import 'widgets/cough_item_widget.dart';
import 'widgets/psychiatry_item_widget.dart';
import 'widgets/specialities_item_widget.dart';

class SpecialitiesPage extends StatefulWidget {
  const SpecialitiesPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<SpecialitiesPage> createState() => _SpecialitiesPageState();
}

class _SpecialitiesPageState extends State<SpecialitiesPage> {
  TextEditingController searchController = TextEditingController();
  late CommonViewModel vm;

  List _searchItems = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm = Provider.of<CommonViewModel>(context, listen: false);
    vm
        .getspecialiseddoctors()
        .whenComplete(() => _searchItems.addAll(vm.getspecialised));
    vm
        .getpersonalwellnes()
        .whenComplete(() => _searchItems.addAll(vm.getpersonalwellness));
    vm.getsymptoms().whenComplete(() => _searchItems.addAll(vm.getsymptom));
  }
  // void _runFilter(String enteredKeyword) {
  //   List results = [];
  //   if (enteredKeyword.isEmpty) {
  //     results = vm.getspecialised && vm.getpersonalwellness && vm.getsymptom;
  //     results = vm.getspecialised
  //         .where((item) => item.datas.specialisedname
  //             .toLowerCase()
  //             .contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //   }

  //   setState(() {
  //     _searchItems = results;
  //   });
  // }
  // List specialities = [
  //   SpecialitiesItemWidget(
  //       image: ImageConstant.imgLiveProject1, name: "General\nPhysician"),
  //   const SpecialitiesItemWidget(
  //       image:
  //           "https://media.istockphoto.com/id/1390339324/photo/medical-staff-treating-a-skin-condition.jpg?s=612x612&w=0&k=20&c=bf70UK4yZBWVIPQLiM_pQUcW8LhogpgXjzB5KaUVrJU=",
  //       name: "Dermatologist"),
  //   const SpecialitiesItemWidget(
  //       image:
  //           "https://media.istockphoto.com/id/1224505797/photo/dentist-hand-pointing-x-ray-picture-in-laptop-computer-and-talking-to-the-patient-about.jpg?s=612x612&w=0&k=20&c=b5xTJDe1oRftGiwAsRbU-v0MJAtuhpoXj-sB8IpuAes=",
  //       name: "Dentist"),
  //   const SpecialitiesItemWidget(
  //       image:
  //           "https://media.istockphoto.com/id/1490492461/photo/brain-surgeon-or-neurologist-doctor-explaining.jpg?s=612x612&w=0&k=20&c=rLkskF3GzpOldo5YNiDtmIq9fSkqrs70jgrlvcjYkQQ=",
  //       name: "Neurologist"),
  // ];
  // List symptom = [
  //   CoughItemWidget(image: ImageConstant.imgGroup11, name: "Cough"),
  //   CoughItemWidget(image: ImageConstant.imgGroup, name: "Thoat Pain"),
  //   CoughItemWidget(image: ImageConstant.imgGroup11Primary, name: "Runny Nose"),
  //   CoughItemWidget(image: ImageConstant.imgVectorPrimary, name: "Migrain"),
  //   CoughItemWidget(image: ImageConstant.imgGroup11, name: "Cough"),
  //   CoughItemWidget(image: ImageConstant.imgGroup, name: "Thoat Pain"),
  //   CoughItemWidget(image: ImageConstant.imgGroup11Primary, name: "Runny Nose"),
  //   CoughItemWidget(image: ImageConstant.imgVectorPrimary, name: "Migrain"),
  //   CoughItemWidget(image: ImageConstant.imgGroup11, name: "Cough"),
  //   CoughItemWidget(image: ImageConstant.imgGroup, name: "Thoat Pain"),
  //   CoughItemWidget(image: ImageConstant.imgGroup11Primary, name: "Runny Nose"),
  //   CoughItemWidget(image: ImageConstant.imgVectorPrimary, name: "Migrain"),
  // ];
// Widget _buildSearchResults() {
//       print("iniseee 444==" + _searchItems.length.toString());
//       return ListView.builder(
//         itemCount: _searchItems.length,
//         itemBuilder: (context, i) {
//           return Center(
//             child: ChoiceCard(
//               choice: _searchItems[i],
//               item: _searchItems[i],
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => DonarsScreen()),
//                 );
//               },
//             ),
//           );
//         },
//       );
//     }

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
          resizeToAvoidBottomInset: false,
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
                          Text(
                            "Specialties",
                            style: theme.textTheme.titleLarge,
                          ),
                          SizedBox(height: 11.v),
                          // CustomSearchView(
                          //   controller: searchController,
                          //   hintText: "Search Specialists",
                          // ),
                          SizedBox(height: 17.v),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Top Specialties",
                                style: theme.textTheme.titleLarge!.copyWith(
                                  color: appTheme.black900,
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const TopSpecialisedScreen();
                                    },
                                  ));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3.v),
                                  child: Text(
                                    "View all",
                                    style: CustomTextStyles.bodyMediumGray40002
                                        .copyWith(
                                      color: appTheme.gray40002,
                                    ),
                                  ),
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgVector,
                                height: 11.v,
                                width: 6.h,
                                margin: EdgeInsets.only(
                                  left: 7.h,
                                  top: 5.v,
                                  bottom: 6.v,
                                ),
                              ),
                            ],
                          ),
                          // _buildPersonalWellness(context,
                          //     personalWellness: "Top Specialties",
                          //     viewAll: "View all",
                          //     // onTap: Navigator.push(context, MaterialPageRoute(
                          //     //   builder: (context) {
                          //     //     return const TopSpecialisedScreen();
                          //     //   },
                          //     // ))
                          //     ),
                          SizedBox(height: 22.v),
                          _buildSpecialities(context),
                          SizedBox(height: 19.v),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Personal Wellness",
                                style: theme.textTheme.titleLarge!.copyWith(
                                  color: appTheme.black900,
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const PersonalwellnessScreen();
                                    },
                                  ));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3.v),
                                  child: Text(
                                    "View all",
                                    style: CustomTextStyles.bodyMediumGray40002
                                        .copyWith(
                                      color: appTheme.gray40002,
                                    ),
                                  ),
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgVector,
                                height: 11.v,
                                width: 6.h,
                                margin: EdgeInsets.only(
                                  left: 7.h,
                                  top: 5.v,
                                  bottom: 6.v,
                                ),
                              ),
                            ],
                          ),
                          // _buildPersonalWellness(
                          //   context,
                          //   personalWellness: "Personal Wellness",
                          //   viewAll: "View all",
                          //   // onTap: Navigator.push(context, MaterialPageRoute(
                          //   //   builder: (context) {
                          //   //     return const TopSpecialisedScreen();
                          //   //   },
                          //   // ))
                          // ),
                          SizedBox(height: 24.v),
                          _buildPsychiatry(context),
                          SizedBox(height: 26.v),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Browse by symptom",
                                style: theme.textTheme.titleLarge!.copyWith(
                                  color: appTheme.black900,
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const BrowseSymptomScreen();
                                    },
                                  ));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3.v),
                                  child: Text(
                                    "View all",
                                    style: CustomTextStyles.bodyMediumGray40002
                                        .copyWith(
                                      color: appTheme.gray40002,
                                    ),
                                  ),
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgVector,
                                height: 11.v,
                                width: 6.h,
                                margin: EdgeInsets.only(
                                  left: 7.h,
                                  top: 5.v,
                                  bottom: 6.v,
                                ),
                              ),
                            ],
                          ),
                          // _buildPersonalWellness(
                          //   context,
                          //   personalWellness: "Personal Wellness",
                          //   viewAll: "View all",
                          //   // onTap: Navigator.push(context, MaterialPageRoute(
                          //   //   builder: (context) {
                          //   //     return const TopSpecialisedScreen();
                          //   //   },
                          //   // ))
                          // ),
                          SizedBox(height: 22.v),
                          _buildCough(context),
                          SizedBox(height: 10.v),
                          // _buildVector(context),
                          // SizedBox(height: 43.v),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSpecialities(BuildContext context) {
    return Consumer<CommonViewModel>(builder: (context, value, child) {
      return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 117.v,
          crossAxisCount: 3,
          mainAxisSpacing: 23.h,
          crossAxisSpacing: 23.h,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount:
            value.getspecialised.length >= 6 ? 6 : value.getspecialised.length,
        itemBuilder: (context, index) {
          return SpecialitiesItemWidget(
            id: value.getspecialised[index].id,
            image: WebService().imageurl + value.getspecialised[index].image,
            name: value.getspecialised[index].specialisedname,
          );
        },
      );
    });
  }

  /// Section Widget
  Widget _buildPsychiatry(BuildContext context) {
    return Consumer<CommonViewModel>(builder: (context, value, child) {
      return SizedBox(
        height: 116.v,
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 16.h,
            );
          },
          itemCount: value.getpersonalwellness.length,
          itemBuilder: (context, index) {
            return PsychiatryItemWidget(
              id: value.getpersonalwellness[index].id,
              image: WebService().imageurl +
                  value.getpersonalwellness[index].image,
              name: value.getpersonalwellness[index].personalWellnessName,
            );
          },
        ),
      );
    });
  }

  // /// Section Widget
  // Widget _buildBrowseBySymptom(BuildContext context) {
  //   return Align(
  //     alignment: Alignment.centerLeft,
  //     child: Padding(
  //       padding: EdgeInsets.only(right: 14.h),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             "Browse by Symptom ",
  //             style: theme.textTheme.titleLarge,
  //           ),
  //           const Spacer(),
  //           Padding(
  //             padding: EdgeInsets.only(bottom: 5.v),
  //             child: Text(
  //               "View all",
  //               style: CustomTextStyles.bodyMediumGray40002,
  //             ),
  //           ),
  //           CustomImageView(
  //             imagePath: ImageConstant.imgVector,
  //             height: 11.v,
  //             width: 6.h,
  //             margin: EdgeInsets.only(
  //               left: 7.h,
  //               top: 2.v,
  //               bottom: 8.v,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  /// Section Widget
  Widget _buildCough(BuildContext context) {
    return Consumer<CommonViewModel>(builder: (context, value, child) {
      return SizedBox(
        height: 84.v,
        width: double.infinity,
        // child: Wrap(
        //   alignment: WrapAlignment.spaceBetween,
        //   runAlignment: WrapAlignment.spaceBetween,
        //   children: List.generate(
        //       value.getsymptom.length,
        //       (index) => CoughItemWidget(
        //           image:
        //               WebService().imageurl + value.getsymptom[index].image,
        //           name: value.getsymptom[index].symptomsname)),
        // )
        // child:  ListView.separated(
        //     scrollDirection: Axis.horizontal,
        //     physics: const NeverScrollableScrollPhysics(),
        //     separatorBuilder: (
        //       context,
        //       index,
        //     ) {
        //       return SizedBox(
        //         width: 15.h,
        //       );
        //     },
        //     itemCount: 4,
        //     itemBuilder: (context, index) {
        //       return CoughItemWidget(
        //             image:
        //                 WebService().imageurl + value.getsymptom[index].image,
        //             name: value.getsymptom[index].symptomsname);
        //     },
        //   ),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: value.getsymptom.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(1.0),
                child: CoughItemWidget(
                    id: value.getsymptom[index].id,
                    image:
                        WebService().imageurl + value.getsymptom[index].image,
                    name: value.getsymptom[index].symptomsname),
              );
            }),
      );
    });
  }

  // /// Section Widget
  // Widget _buildVector(BuildContext context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Container(
  //         height: 78.adaptSize,
  //         width: 78.adaptSize,
  //         padding: EdgeInsets.symmetric(
  //           horizontal: 16.h,
  //           vertical: 13.v,
  //         ),
  //         decoration: AppDecoration.outlinePrimary.copyWith(
  //           borderRadius: BorderRadiusStyle.roundedBorder10,
  //         ),
  //         child: CustomImageView(
  //           imagePath: ImageConstant.imgGroup11,
  //           height: 50.v,
  //           width: 42.h,
  //           alignment: Alignment.center,
  //         ),
  //       ),
  //       Container(
  //         height: 78.v,
  //         width: 77.h,
  //         padding: EdgeInsets.symmetric(
  //           horizontal: 18.h,
  //           vertical: 13.v,
  //         ),
  //         decoration: AppDecoration.outlinePrimary.copyWith(
  //           borderRadius: BorderRadiusStyle.roundedBorder10,
  //         ),
  //         child: CustomImageView(
  //           imagePath: ImageConstant.imgGroup,
  //           height: 50.v,
  //           width: 38.h,
  //           alignment: Alignment.center,
  //         ),
  //       ),
  //       Container(
  //         height: 78.adaptSize,
  //         width: 78.adaptSize,
  //         padding: EdgeInsets.symmetric(
  //           horizontal: 14.h,
  //           vertical: 13.v,
  //         ),
  //         decoration: AppDecoration.outlinePrimary.copyWith(
  //           borderRadius: BorderRadiusStyle.roundedBorder10,
  //         ),
  //         child: CustomImageView(
  //           imagePath: ImageConstant.imgGroup11Primary,
  //           height: 50.v,
  //           width: 47.h,
  //           alignment: Alignment.center,
  //         ),
  //       ),
  //       Container(
  //         height: 78.v,
  //         width: 77.h,
  //         padding: EdgeInsets.all(13.h),
  //         decoration: AppDecoration.outlinePrimary.copyWith(
  //           borderRadius: BorderRadiusStyle.roundedBorder10,
  //         ),
  //         child: CustomImageView(
  //           imagePath: ImageConstant.imgVectorPrimary,
  //           height: 50.v,
  //           width: 48.h,
  //           alignment: Alignment.center,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  /// Common widget
  Widget _buildPersonalWellness(
    BuildContext context, {
    required String personalWellness,
    required String viewAll,
    // required onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          personalWellness,
          style: theme.textTheme.titleLarge!.copyWith(
            color: appTheme.black900,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            // onTap;
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 3.v),
            child: Text(
              viewAll,
              style: CustomTextStyles.bodyMediumGray40002.copyWith(
                color: appTheme.gray40002,
              ),
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgVector,
          height: 11.v,
          width: 6.h,
          margin: EdgeInsets.only(
            left: 7.h,
            top: 5.v,
            bottom: 6.v,
          ),
        ),
      ],
    );
  }
}
