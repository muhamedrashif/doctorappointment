// import 'package:doctorappointment/theme/app_decoration.dart';
// import 'package:doctorappointment/theme/custom_text_style.dart';
// import 'package:doctorappointment/theme/theme_helper.dart';
// import 'package:doctorappointment/utils/image_constant.dart';
// import 'package:doctorappointment/utils/size_utils.dart';
// import 'package:doctorappointment/widgets/custom_image_view.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class CustomBottomBar extends StatefulWidget {
//   CustomBottomBar({super.key, this.onChanged});

//   Function(BottomBarEnum)? onChanged;

//   @override
//   CustomBottomBarState createState() => CustomBottomBarState();
// }

// class CustomBottomBarState extends State<CustomBottomBar> {
//   int selectedIndex = 0;

//   List<BottomMenuModel> bottomMenuList = [
//     BottomMenuModel(
//       icon: ImageConstant.imgNavHome,
//       activeIcon: ImageConstant.imgNavHome,
//       title: "Home",
//       type: BottomBarEnum.Home,
//     ),
//     BottomMenuModel(
//       icon: ImageConstant.imgNavSpecialties,
//       activeIcon: ImageConstant.imgNavSpecialties,
//       title: "Specialties",
//       type: BottomBarEnum.Specialties,
//     ),
//     BottomMenuModel(
//       icon: ImageConstant.imgNavReports,
//       activeIcon: ImageConstant.imgNavReports,
//       title: "Reports",
//       type: BottomBarEnum.Reports,
//     ),
//     BottomMenuModel(
//       icon: ImageConstant.imgNavProfile,
//       activeIcon: ImageConstant.imgNavProfile,
//       title: "Profile",
//       type: BottomBarEnum.Profile,
//     )
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 72.v,
//       decoration: BoxDecoration(
//         color: theme.colorScheme.onPrimary.withOpacity(1),
//         boxShadow: [
//           BoxShadow(
//             color: appTheme.black900.withOpacity(0.17),
//             spreadRadius: 2.h,
//             blurRadius: 2.h,
//             offset: const Offset(
//               0,
//               1,
//             ),
//           ),
//         ],
//       ),
//       child: BottomNavigationBar(
//         backgroundColor: Colors.transparent,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         selectedFontSize: 0,
//         elevation: 0,
//         currentIndex: selectedIndex,
//         type: BottomNavigationBarType.fixed,
//         items: List.generate(bottomMenuList.length, (index) {
//           return BottomNavigationBarItem(
//             icon: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadiusStyle.roundedBorder10,
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CustomImageView(
//                     imagePath: bottomMenuList[index].icon,
//                     height: 24.v,
//                     width: 21.h,
//                     color: theme.colorScheme.primary,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 4.v),
//                     child: Text(
//                       bottomMenuList[index].title ?? "",
//                       style: CustomTextStyles.bodyMediumPrimary13.copyWith(
//                         color: theme.colorScheme.primary,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             activeIcon: SizedBox(
//               height: 46.v,
//               width: 58.h,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Container(
//                       height: 32.adaptSize,
//                       width: 32.adaptSize,
//                       margin: EdgeInsets.only(
//                         left: 2.h,
//                         right: 2.h,
//                         bottom: 13.v,
//                       ),
//                       decoration: BoxDecoration(
//                         color: appTheme.cyan50,
//                         borderRadius: BorderRadius.circular(
//                           10.h,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Container(
//                       margin: EdgeInsets.only(top: 4.v),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadiusStyle.roundedBorder10,
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           CustomImageView(
//                             imagePath: bottomMenuList[index].activeIcon,
//                             height: 24.v,
//                             width: 21.h,
//                             color: theme.colorScheme.primary,
//                             margin: EdgeInsets.only(
//                               left: 7.h,
//                               right: 8.h,
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(top: 2.v),
//                             child: Text(
//                               bottomMenuList[index].title ?? "",
//                               style:
//                                   CustomTextStyles.bodyMediumPrimary13.copyWith(
//                                 color: theme.colorScheme.primary,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             label: '',
//           );
//         }),
//         onTap: (index) {
//           selectedIndex = index;
//           widget.onChanged?.call(bottomMenuList[index].type);
//           setState(() {});
//         },
//       ),
//     );
//   }
// }

// enum BottomBarEnum {
//   Home,
//   Specialties,
//   Reports,
//   Profile,
// }

// class BottomMenuModel {
//   BottomMenuModel({
//     required this.icon,
//     required this.activeIcon,
//     this.title,
//     required this.type,
//   });

//   String icon;

//   String activeIcon;

//   String? title;

//   BottomBarEnum type;
// }

// class DefaultWidget extends StatelessWidget {
//   const DefaultWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.all(10),
//       child: const Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               'Please replace the respective Widget here',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
