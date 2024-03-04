// import 'package:doctorappointment/routes/app_routes.dart';
// import 'package:doctorappointment/screens/home_screen/home_screen.dart';
// import 'package:doctorappointment/screens/my_account_page/my_account_page.dart';
// import 'package:doctorappointment/screens/report_screen/report_screen.dart';
// import 'package:doctorappointment/screens/specialities_screen/specialities_screen.dart';
// import 'package:doctorappointment/utils/image_constant.dart';
// import 'package:doctorappointment/utils/size_utils.dart';
// import 'package:doctorappointment/widgets/custom_bottom_bar.dart';
// import 'package:doctorappointment/widgets/custom_icon_button.dart';
// import 'package:doctorappointment/widgets/custom_image_view.dart';
// import 'package:flutter/material.dart';

// class HomeContainerScreenn extends StatefulWidget {
//   const HomeContainerScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeContainerScreen> createState() => _HomeContainerScreenState();
// }

// class _HomeContainerScreennState extends State<HomeContainerScreen> {
//   GlobalKey<NavigatorState> navigatorKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     return SafeArea(
//         child: Scaffold(
//             body: Navigator(
//                 key: navigatorKey,
//                 initialRoute: AppRoutes.homePage,
//                 onGenerateRoute: (routeSetting) => PageRouteBuilder(
//                     pageBuilder: (ctx, ani, ani1) =>
//                         getCurrentPage(routeSetting.name!),
//                     transitionDuration: const Duration(seconds: 0))),
//             bottomNavigationBar: _buildBottomBar(context)));
//   }

//   /// Section Widget
//   Widget _buildBottomBar(BuildContext context) {
//     return CustomBottomBar(onChanged: (BottomBarEnum type) {
//       Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
//     });
//   }

//   ///Handling route based on bottom click actions
//   String getCurrentRoute(BottomBarEnum type) {
//     switch (type) {
//       case BottomBarEnum.Home:
//         return AppRoutes.homePage;
//       case BottomBarEnum.Specialties:
//         return AppRoutes.specialitiesPage;
//       case BottomBarEnum.Reports:
//         return AppRoutes.report_screen;
//       case BottomBarEnum.Profile:
//         return AppRoutes.myAccountPage;
//       default:
//         return "/";
//     }
//   }

//   ///Handling page based on route
//   Widget getCurrentPage(String currentRoute) {
//     switch (currentRoute) {
//       case AppRoutes.homePage:
//         return const HomePage();
//       case AppRoutes.specialitiesPage:
//         return const SpecialitiesPage();
//       case AppRoutes.report_screen:
//         return const Report_screen();
//       case AppRoutes.myAccountPage:
//         return const MyAccountPage();
//       default:
//         return const DefaultWidget();
//     }
//   }
// }
import 'package:doctorappointment/screens/home_screen/home_screen.dart';
import 'package:doctorappointment/screens/my_account_page/my_account_page.dart';
import 'package:doctorappointment/screens/report_screen/report_screen.dart';
import 'package:doctorappointment/screens/specialities_screen/specialities_screen.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class HomeContainerScreen extends StatefulWidget {
  HomeContainerScreen({super.key});

  @override
  _HomeContainerScreenState createState() => _HomeContainerScreenState();
}

class _HomeContainerScreenState extends State<HomeContainerScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SpecialitiesPage(),
    Report_screen(),
    MyAccountPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: CustomIconButton(
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgNavHome,
                  )),
              activeIcon: CustomIconButton(
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgNavHome,
                  )),
              label: 'Home',
              // backgroundColor: Colors.grey
            ),
            BottomNavigationBarItem(
              icon: CustomIconButton(
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgNavSpecialties,
                  )),
                  activeIcon:  CustomIconButton(
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgNavSpecialties,
                  )),
              label: 'Specialties',
              // backgroundColor: Colors.grey
            ),
            BottomNavigationBarItem(
              icon: CustomIconButton(
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgNavReports,
                  )),
                  activeIcon:  CustomIconButton(
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgNavReports,
                  )),
              label: 'Reports',
              // backgroundColor: Colors.grey
            ),
           BottomNavigationBarItem(
              icon: CustomIconButton(
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgNavProfile,
                  )),
                  activeIcon:  CustomIconButton(
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgNavProfile,
                  )),
              label: 'Profile',
              // backgroundColor: Colors.grey
            ),
        
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.teal,
          iconSize: 20,
          onTap: _onItemTapped,
          elevation: 5,
          ),
    );
  }
}
