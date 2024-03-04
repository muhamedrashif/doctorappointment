import 'dart:developer';
import 'package:doctorappointment/commonViewModel/commonViewModel.dart';
import 'package:doctorappointment/model/response.dart';
import 'package:doctorappointment/screens/home_container_screen/home_container_screen.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_button_style.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/custom_elevated_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:doctorappointment/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  final phonenumber;
  const SignupScreen({required this.phonenumber});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  bool _isLoading = false;
  final TextEditingController _nameController = TextEditingController();
  String name = '';

  // late SharedPreferences _prefs;

  CommonViewModel? Vm;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Vm = Provider.of<CommonViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Replace this with your app's logo or branding
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
                const Padding(
                    padding: EdgeInsets.only(
                      top: 18.0,
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Registration",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ))),
                const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Enter your Name",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ))),

                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFieldInput(
                              textEditingController: _nameController,
                              hintText: "Name",
                              textInputType: TextInputType.name,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter number';
                                }
                                return null;
                              },
                            ),
                          ),
                          // button login
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.teal,
                                  )
                                : CustomElevatedButton(
                                    height: 48.v,
                                    width: 250.h,
                                    text: "SignUp",
                                    buttonStyle: CustomButtonStyles.fillPrimary,
                                    buttonTextStyle:
                                        CustomTextStyles.titleLargeOnPrimary,
                                    onPressed: () async {
                                      setState(() {
                                        _isLoading = !_isLoading;

                                        // final form = _formkey.currentState;

                                        if (_formkey.currentState!.validate()) {
                                          _formkey.currentState!.save();
                                          Future<Map<String, dynamic>>
                                              successfulMessage = Vm!
                                                  .registration(
                                                      _nameController.text,
                                                      widget.phonenumber,
                                                      "0");
                                          print(_nameController.text);
                                          print(widget.phonenumber);
                                          successfulMessage
                                              .then((response) async {
                                            print("response :" +
                                                response.toString());
                                            if (response['status']) {
                                              print(response);
                                              ResponseModel user =
                                                  response['user'];
                                              if ("success" == user.message) {
                                                log("login successfully completed !!");
                                                final _prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                _prefs.setBool(
                                                    'isLoggedIn', true);
                                                _prefs.setString(
                                                    'name', name.toString());
                                                _prefs.setString(
                                                    'phone',
                                                    widget.phonenumber
                                                        .toString());

                                                log("name=====" + name);
                                                log("phone=====" +
                                                    widget.phonenumber);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomeContainerScreen()));
                                                setState(() {
                                                  _isLoading = false;
                                                });
                                              }
                                            }
                                          });
                                        }
                                      });
                                    },
                                  ),
                          )
                        ])))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
