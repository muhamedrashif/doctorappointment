import 'dart:developer';
import 'package:doctorappointment/commonViewModel/commonViewModel.dart';
import 'package:doctorappointment/model/getclinicinfo.dart';
import 'package:doctorappointment/model/response.dart';
import 'package:doctorappointment/screens/confirmation_page_screen/confirmation_page_screen.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_button_style.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_elevated_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:doctorappointment/widgets/custom_outlined_button.dart';
import 'package:doctorappointment/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookAppointmentContainerScreen extends StatefulWidget {
  final String docId;
  final String docImage;
  final String docName;
  final String docSpecialised;
  final String docQualification;
  final String docExp;
  final String appointmentdate;
  final String description;

  const BookAppointmentContainerScreen(
      {super.key,
      required this.docId,
      required this.docImage,
      required this.docName,
      required this.docSpecialised,
      required this.docQualification,
      required this.docExp,
      required this.appointmentdate,
      required this.description});
  @override
  BookAppointmentContainerScreenState createState() =>
      BookAppointmentContainerScreenState();
}

class BookAppointmentContainerScreenState
    extends State<BookAppointmentContainerScreen>
    with AutomaticKeepAliveClientMixin<BookAppointmentContainerScreen> {
  @override
  bool get wantKeepAlive => true;
  late CommonViewModel vm;
  bool _isLoading = false;
  bool selected = false;
  int va = -1;
  final TextEditingController _patientnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _bystanderController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  late String bookingid;
  late Clinic user1;
  bool loading2 = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm = Provider.of<CommonViewModel>(context, listen: false);
    //getclinicinfo
    Future<Map<String, dynamic>> successfulMessagee = vm.getclinicinfo();
    successfulMessagee.then((response) async {
      print("response :" + response.toString());
      if (response['status']) {
        user1 = response['user'];

        //
        setState(() {
          loading2 = false;
        });
      }
    });
  }

  String? id;
  String? appointmenttime;
  String? currentdate;
  String? currenttime;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillGray,
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: Column(children: [
                        _buildFrame(context),
                        SizedBox(height: 18.v),
                        Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 16.h),
                                    child: Text("Description",
                                        style: theme.textTheme.titleLarge))),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(widget.description),
                            )
                          ],
                        ),
                        SizedBox(height: 18.v),
                        CustomElevatedButton(
                            height: 48.v,
                            width: 250.h,
                            text: "Book Appointment",
                            buttonStyle: CustomButtonStyles.fillPrimary,
                            buttonTextStyle:
                                CustomTextStyles.titleLargeOnPrimary,
                            onPressed: () {
                              // log("appointmenttime" + appointmenttime);
                              // log(" widget.appointmentdate" +
                              //     widget.appointmentdate);
                              // ignore: unnecessary_null_comparison
                              widget.appointmentdate == null ||
                                      appointmenttime == null
                                  ? ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                      duration: Duration(seconds: 1),
                                      content:
                                          Text("Please select date and time"),
                                    ))
                                  : _showModalBottomSheet(  
                                      context,
                                      appointmenttime.toString(),
                                      widget.appointmentdate,
                                      id.toString());
                            }),
                        SizedBox(height: 20.v),
                        loading2 == true
                            ? CircularProgressIndicator()
                            : CustomOutlinedButton(
                                height: 48.v,
                                width: 300.h,
                                text: "For More information please call " +
                                    user1.number,
                                leftIcon: Container(
                                    margin: EdgeInsets.only(right: 2.h),
                                    child: CustomImageView(
                                        imagePath: ImageConstant
                                            .imgHospitalsvgrepocom1,
                                        height: 26.adaptSize,
                                        width: 26.adaptSize)),
                                buttonStyle: CustomButtonStyles.outlinePrimary)
                      ]))
                ]))));
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Consumer<CommonViewModel>(builder: (context, value, child) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 18.v),
          decoration: AppDecoration.outlinePrimary
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 4.h),
                    child: Text("Select schedule Time",
                        style: theme.textTheme.titleMedium)),
                SizedBox(height: 11.v),
                Wrap(
                    runSpacing: 10.v,
                    spacing: 10.h,
                    children:
                        List<Widget>.generate(value.gettimee.length, (index) {
                      return value.gettimee.length == 0
                          ? const Text("No time available")
                          : Theme(
                              data: ThemeData(
                                canvasColor: Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RawChip(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 11.h,
                                    vertical: 14.v,
                                  ),
                                  showCheckmark: false,
                                  labelPadding: EdgeInsets.zero,
                                  label: Text(
                                    value.gettimee[index].time,
                                    style: TextStyle(
                                      color: va == index
                                          ? Colors.white
                                          : Colors.teal,
                                      fontSize: 12.fSize,
                                      fontFamily: 'Sansation',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  selected: false,
                                  backgroundColor:
                                      value.gettimee[index].status == "1"
                                          ? Colors.black12
                                          : va == index
                                              ? const Color(0XFF008771)
                                              : Colors.transparent,
                                  selectedColor: theme.colorScheme.primary,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: theme.colorScheme.primary,
                                      width: 1.h,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      5.h,
                                    ),
                                  ),
                                  onSelected: (value1) {
                                    if (value.gettimee[index].status == "1") {
                                      // log("Not avilable alredy slotted");

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                            "Not avilable already slotted"),
                                      ));
                                    } else {
                                      setState(() {
                                        selected = true;
                                        va = index;
                                      });
                                      log("=====================" +
                                          value.gettimee[index].doctorid
                                              .toString() +
                                          "appointmenttime" +
                                          value.gettimee[index].time
                                              .toString());
                                      appointmenttime =
                                          value.gettimee[index].time.toString();
                                      id = value.gettimee[index].id.toString();
                                      log("appointmenttime-------------------" +
                                          appointmenttime.toString());
                                    }
                                  },
                                ),
                              ),
                            );
                    })),
                SizedBox(height: 4.v)
              ]));
    });
  }

  /// Navigates to the confirmationPageScreen when the action is triggered.
  // onTapBookAppointment(BuildContext context) {
  //   Navigator.push(context, MaterialPageRoute(
  //     builder: (context) {
  //       return ConfirmationPageScreen(
  //         docImage: widget.docImage,
  //         docName: widget.docName,
  //         docQualification: widget.docQualification,
  //         docSpecialised: widget.docSpecialised,
  //         docTime: widget.docExp,
  //       );
  //     },
  //   ));
  //   // Navigator.pushNamed(context, AppRoutes.confirmationPageScreen);
  // }

  void _showModalBottomSheet(BuildContext context, String appointmenttime,
      String appointmentdate, String id) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(20),
          topStart: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFieldInput(
                            textEditingController: _patientnameController,
                            hintText: "Patient name",
                            textInputType: TextInputType.name,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter patinet name';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFieldInput(
                            maxLength: 10,
                            textEditingController: _phoneController,
                            hintText: "Phone number",
                            textInputType: TextInputType.number,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter number';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFieldInput(
                            textEditingController: _addressController,
                            hintText: "Address",
                            textInputType: TextInputType.multiline,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter address';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFieldInput(
                            textEditingController: _bystanderController,
                            hintText: "Bystander name (Optional)",
                            textInputType: TextInputType.name,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomElevatedButton(
                              height: 48.v,
                              width: 250.h,
                              text: "Book Appointment",
                              buttonStyle: CustomButtonStyles.fillPrimary,
                              buttonTextStyle:
                                  CustomTextStyles.titleLargeOnPrimary,
                              onPressed: () {
                                // print("appointmentdate==========="+widget.appointmentdate.toString());
                                // widget.appointmentdate == null
                                //     ? ScaffoldMessenger.of(context)
                                //         .showSnackBar(const SnackBar(
                                //         content: Text("Please select date"),
                                //       ))
                                //     :
                                //   log("message");
                                _isLoading = !_isLoading;

                                setState(() {
                                  if (_formkey.currentState!.validate()) {
                                    _formkey.currentState!.save();
                                    // log("appointmenttime---------------+++++----" +
                                    //     appointmenttime);

                                    // log("message=================="+_formkey.currentState.toString());
                                    DateTime _focusedDay = DateTime.now();
                                    currentdate = DateFormat('yyyy-MM-dd')
                                        .format(_focusedDay);
                                    DateTime currentTime = DateTime.now();
                                    String currenttime = DateFormat('HH:mm:ss')
                                        .format(currentTime);
                                    Future<Map<String, dynamic>>
                                        successfulMessage = vm.appointment(
                                            _patientnameController.text,
                                            _phoneController.text,
                                            _addressController.text,
                                            widget.appointmentdate,
                                            appointmenttime,
                                            _bystanderController.text,
                                            widget.docId,
                                            currentdate.toString(),
                                            currenttime,
                                            id);

                                    successfulMessage.then((response) async {
                                      print("response :" + response.toString());
                                      if (response['status']) {
                                        print(response);
                                        ResponseModel user = response['user'];
                                        if ("success" == user.message) {
                                          bookingid = user.bookingid;
                                          log("bookingid=======" + bookingid);
                                          log("Appointment successfully completed !!");

                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ConfirmationPageScreen(
                                                        docImage:
                                                            widget.docImage,
                                                        docName: widget.docName,
                                                        docSpecialised: widget
                                                            .docSpecialised,
                                                        docQualification: widget
                                                            .docQualification,
                                                        docTime:
                                                            appointmenttime,
                                                        date: widget
                                                            .appointmentdate,
                                                        bookingid: bookingid,
                                                      )));
                                          setState(() {
                                            _isLoading = false;
                                          });
                                        }
                                      }
                                    });
                                  }
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
