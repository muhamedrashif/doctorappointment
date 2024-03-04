import 'dart:developer';
import 'package:country_list_pick/support/code_country.dart';
import 'package:doctorappointment/commonViewModel/commonViewModel.dart';
import 'package:doctorappointment/model/response.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_button_style.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_elevated_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_container_screen/home_container_screen.dart';
import 'registration.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class OtpLoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<OtpLoginScreen> {
  CommonViewModel? Vm;
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  var formkey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  var verificationId;

  bool showLoading = false;
  var phonenumber;
  var otp;
  CountryCode? countryCode;
  var size, height, width;
  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        Vm = Provider.of<CommonViewModel>(context, listen: false);

        Future<Map<String, dynamic>> successfulMessage = Vm!.login(phonenumber);
        successfulMessage.then((response) async {
          print("response :" + response.toString());
          if (response['status']) {
            print(response);
            ResponseModel user = response['user'];

            setState(() {
              showLoading = false;
            });
            if ("success" == user.message) {
              log("login successfully completed !!");
              final _prefs = await SharedPreferences.getInstance();
              _prefs.setBool('isLoggedIn', true);
              _prefs.setString('name', user.name.toString());
              _prefs.setString('phone', phonenumber.toString());

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeContainerScreen()));

              // setState(() {
              //   _isLoading = false;
              // });
            } else {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignupScreen(
                            phonenumber: phonenumber,
                          )));
            }
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  getMobileFormWidget(context) {
    return Form(
      key: formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Enter your mobile number ,we will \nsend you otp to verify !!',
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: IntlPhoneField(
                          controller: phoneController,
                          flagsButtonPadding:
                              const EdgeInsets.only(bottom: 9, left: 12),
                          dropdownIconPosition: IconPosition.trailing,
                          disableLengthCheck: false,
                          dropdownIcon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.transparent,
                          ),
                          decoration: const InputDecoration(
                              hintText: 'Phone number',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                            setState(() {
                              phonenumber = phone.completeNumber;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: showLoading
                      ? const CircularProgressIndicator(
                          color: Colors.teal,
                        )
                      : CustomElevatedButton(
                          height: 48.v,
                          width: 250.h,
                          text: "Request Otp",
                          buttonStyle: CustomButtonStyles.fillPrimary,
                          buttonTextStyle: CustomTextStyles.titleLargeOnPrimary,
                          onPressed: () async {
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => SignupScreen(
                            //               phonenumber: phonenumber,
                            //             )));

                            log(phonenumber.toString());
                            setState(() {
                              showLoading = true;
                            });

                            await _auth.verifyPhoneNumber(
                              phoneNumber: phonenumber.toString(),
                              verificationCompleted:
                                  (phoneAuthCredential) async {
                                setState(() {
                                  showLoading = false;
                                });
                              },
                              verificationFailed: (verificationFailed) async {
                                setState(() {
                                  showLoading = false;
                                });
                                print("verificationFailed message" +
                                    verificationFailed.message.toString());
                              },
                              codeSent: (verificationId, resendingToken) async {
                                setState(() {
                                  showLoading = false;
                                  currentState = MobileVerificationState
                                      .SHOW_OTP_FORM_STATE;
                                  this.verificationId = verificationId;
                                });
                              },
                              codeAutoRetrievalTimeout:
                                  (verificationId) async {},
                            );
                          },
                        ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }

  getOtpFormWidget(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'OTP has been sent to you on your mobile\n number please enter it below',
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'ENTER OTP',
            style: GoogleFonts.nunito(fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Pinput(
                  defaultPinTheme: PinTheme(
                      height: 50.0,
                      width: 50.0,
                      textStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.teal.withOpacity(0.5),
                              width: 1.0))),
                  length: 6,
                  onChanged: (val) {
                    if (val.length == 6) {
                      otp = val;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: showLoading
                    ? const CircularProgressIndicator(
                        color: Colors.teal,
                      )
                    : CustomElevatedButton(
                        height: 48.v,
                        width: 250.h,
                        text: "Verify",
                        buttonStyle: CustomButtonStyles.fillPrimary,
                        buttonTextStyle: CustomTextStyles.titleLargeOnPrimary,
                        onPressed: () async {
                          setState(() {
                            showLoading = true;
                          });
                          PhoneAuthCredential phoneAuthCredential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationId,
                                  smsCode: otp.toString());

                          signInWithPhoneAuthCredential(phoneAuthCredential);
                        },
                      ),
              )
            ]),
          ),
        )
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    height = size.height;
    width = size.width;
    return Scaffold(
        key: _scaffoldKey,
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //       colors: [Colors.teal, Colors.white10],
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight),
            // ),
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: CircleAvatar(
                    //     backgroundImage: NetworkImage(
                    //         "https://media.istockphoto.com/id/1522597990/photo/tranquil-healthcare-background-with-copy-space.jpg?s=612x612&w=0&k=20&c=4d8SIgUZfh35NfkdrynwxxJ-Wu0O-Ke3vuCpalsRs6Y="),
                    //     radius: 60,
                    //   ),
                    // ),
                    Container(
                        height: 200.adaptSize,
                        width: 200.adaptSize,
                        decoration: AppDecoration.fillPrimary.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder131),
                        child: CustomImageView(
                            imagePath: ImageConstant.asianFemale,
                            height: 200.adaptSize,
                            width: 200.adaptSize,
                            radius: BorderRadius.circular(131.h),
                            alignment: Alignment.center)),

                    // SizedBox(
                    //   height: 100,
                    // ),
                    // SizedBox(
                    //   height: height / 4,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(20.0),
                    //     child: Image.asset('assets/images/AuthImg.png'),
                    //   ),
                    // ),
                    SizedBox(
                        height: MediaQuery.of(context).size.width,
                        child: currentState ==
                                MobileVerificationState.SHOW_MOBILE_FORM_STATE
                            ? getMobileFormWidget(context)
                            : getOtpFormWidget(context))
                  ],
                ),
              ),
            )));
  }
}
