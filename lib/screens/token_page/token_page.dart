import 'dart:developer';
import 'package:doctorappointment/commonViewModel/commonViewModel.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TokenPage extends StatefulWidget {
  final String status;
  const TokenPage({Key? key, required this.status})
      : super(
          key: key,
        );

  @override
  TokenPageState createState() => TokenPageState();
}

class TokenPageState extends State<TokenPage>
    with AutomaticKeepAliveClientMixin<TokenPage> {
  @override
  bool get wantKeepAlive => true;
  late CommonViewModel vm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm = Provider.of<CommonViewModel>(context, listen: false);
    vm.gettoken(widget.status);
  }

  void get() {
    log("sssss");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    mediaQueryData = MediaQuery.of(context);
    get();

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: Column(
            children: [
              SizedBox(height: 21.v),
              _buildDec(context),
            ],
          ),
        ),
      ),
    );
  }

  String returnMonth(DateTime date) {
    return new DateFormat.MMMM().format(date);
  }

  /// Section Widget
  Widget _buildDec(BuildContext context) {
    return
        // Consumer<CommonViewModel>(builder: (context, value, child) {
        FutureBuilder(
            future: vm.gettoken(widget.status),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                log("  snapshot.data!.length-----------" +
                    snapshot.data!.length.toString());

                return snapshot.data!.length == 0
                    ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/emptystates.png",
                              height: 100,
                            ),
                            const Text("No data!!")
                          ],
                        )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext ctx, index) {
                          log("appoinmet date---+" +
                              snapshot.data![index].appointmentdate);

                          final DateFormat formatter = DateFormat('dd');

                          DateTime tempDate = new DateFormat("dd-MM-yyyy")
                              .parse(snapshot.data![index].appointmentdate);
                          final String formatted = formatter.format(tempDate);

                          String month = returnMonth(tempDate);

                          log("month---" + month);
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 16.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: 26.h,
                                vertical: 14.v,
                              ),
                              decoration:
                                  AppDecoration.outlinePrimary3.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder30,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 1.v,
                                      bottom: 2.v,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 19.h,
                                      vertical: 24.v,
                                    ),
                                    decoration:
                                        AppDecoration.fillPrimary.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder26,
                                    ),
                                    child: SizedBox(
                                      width: 29.h,
                                      child: Text(
                                        formatted + "-" + month.substring(0, 3),
                                        // value.gettokenm[index].appointmentdate.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style:
                                            CustomTextStyles.bodyLargeOnPrimary,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 38.h,
                                      top: 1.v,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 1.v,
                                                bottom: 3.v,
                                              ),
                                              child: Text(
                                                snapshot
                                                    .data![index].doctorname,
                                                // value.gettokenm[index].doctorname,
                                                style: CustomTextStyles
                                                    .bodyMediumBlack900_1,
                                              ),
                                            ),
                                            // CustomImageView(
                                            //   imagePath: ImageConstant.imgGroup12,
                                            //   height: 21.v,
                                            //   width: 5.h,
                                            // ),
                                          ],
                                        ),
                                        SizedBox(height: 3.v),
                                        Text(
                                          snapshot.data![index].specialisedname,
                                          // value.gettokenm[index].specialisedname,
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                        SizedBox(height: 6.v),
                                        Text(
                                          "Booking ID: BKD" +
                                              snapshot.data![index].bookingid,
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                        SizedBox(height: 5.v),
                                        Row(
                                          children: [
                                            CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgVectorBlack90020x18,
                                              height: 20.v,
                                              width: 18.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 7.h,
                                                bottom: 2.v,
                                              ),
                                              child: Text(
                                                snapshot.data![index]
                                                    .appointmenttime,
                                                // value.gettokenm[index].appointmenttime,
                                                style:
                                                    theme.textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
              }
              return const CircularProgressIndicator();
            });
  }
}
