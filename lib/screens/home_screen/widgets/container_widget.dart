import 'package:doctorappointment/screens/bill_history_screen/bill_history_screen.dart';
import 'package:doctorappointment/screens/doc_page/doc_page.dart';
import 'package:doctorappointment/screens/token_tab_container_screen/token_tab_container_screen.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainerItemWidget extends StatefulWidget {
  final String image;
  final String name;
  const ContainerItemWidget(
      {super.key, required this.image, required this.name});

  @override
  State<ContainerItemWidget> createState() => _ContainerItemWidgetState();
}

class _ContainerItemWidgetState extends State<ContainerItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (widget.name) {
          case "Book\nAppointment":
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const DocPage(
                  id: "0",
                  type: "4",
                );
              },
            ));
          case "Show Token":
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const TokenTabContainerScreen();
              },
            ));

          case "Bill History":
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const BillHistoryScreen();
              },
            ));
            break;
          default:
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 13.h,
          vertical: 5.v,
        ),
        decoration: AppDecoration.outlinePrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        width: 98.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButton(
                height: 44.adaptSize,
                width: 44.adaptSize,
                padding: EdgeInsets.all(10.h),
                decoration: IconButtonStyleHelper.fillOnPrimary,
                child: CustomImageView(imagePath: widget.image)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(widget.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMediumOnPrimary),
            ),
          ],
        ),
      ),
    );
  }
}

//     InkWell(
//       onTap: () {
//         log("message");
//       },
//       child: Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: 16.h,
//         vertical: 5.v,
//       ),
//       decoration: AppDecoration.outlinePrimary.copyWith(
//         borderRadius: BorderRadiusStyle.roundedBorder10,
//       ),
//       width: 78.h,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 4),
//           child: Column(
//             children: [
//               CustomIconButton(
//                   height: 44.adaptSize,
//                   width: 44.adaptSize,
//                   padding: EdgeInsets.all(10.h),
//                   decoration: IconButtonStyleHelper.fillOnPrimary,
//                   child: CustomImageView(imagePath: widget.image)),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(widget.name,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.center,
//                     style: CustomTextStyles.bodyMediumOnPrimary),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
