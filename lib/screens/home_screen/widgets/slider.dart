import 'package:doctorappointment/model_view/gettodaydoctors.dart';
import 'package:doctorappointment/services/webservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import 'scrollbaar_item_widget.dart';

// ignore: must_be_immutable
class ImageSlider extends StatelessWidget {
  late List<GetTodaydoctorViewModel> banner;

  ImageSlider({required this.banner});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          // color: Colors.amber,
          height: 195,
          child: CarouselSlider.builder(
            unlimitedMode: false,
            viewportFraction: 1,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            scrollPhysics: const BouncingScrollPhysics(),
            // enableAutoSlider: false,
            // autoSliderTransitionCurve: Curves.decelerate,
            // autoSliderDelay: const Duration(seconds: 5),
            // autoSliderTransitionTime: const Duration(milliseconds: 1000),
            itemCount: banner.length,
            slideBuilder: (index) {
              // final image = banner[index];
              return ScrollbaarItemWidget(
                  docId: banner[index].doctorid,
                  docImage: WebService().imageurl + banner[index].image,
                  docName: banner[index].name,
                  docSpecialised: banner[index].specialisedname,
                  docQualification: banner[index].qualification,
                  docExp: banner[index].experience,
                  description: banner[index].description,
                  );
            },
            slideIndicator: CircularSlideIndicator(
              itemSpacing: 8,
              indicatorRadius: 3,
              indicatorBorderWidth: 1,
              currentIndicatorColor: Colors.teal,
              indicatorBackgroundColor: Colors.white,
              padding: const EdgeInsets.only(bottom:0),
            ),
          )),
    );
  }
}
