import 'dart:developer';
import 'dart:io';
import 'package:doctorappointment/commonViewModel/commonViewModel.dart';
import 'package:doctorappointment/model/getprofile.dart';
import 'package:doctorappointment/model/response.dart';
import 'package:doctorappointment/screens/home_container_screen/home_container_screen.dart';
import 'package:doctorappointment/services/webservice.dart';
import 'package:doctorappointment/theme/app_decoration.dart';
import 'package:doctorappointment/theme/custom_button_style.dart';
import 'package:doctorappointment/theme/custom_text_style.dart';
import 'package:doctorappointment/theme/theme_helper.dart';
import 'package:doctorappointment/utils/image_constant.dart';
import 'package:doctorappointment/utils/size_utils.dart';
import 'package:doctorappointment/widgets/app_bar/custom_app_bar.dart';
import 'package:doctorappointment/widgets/custom_elevated_button.dart';
import 'package:doctorappointment/widgets/custom_icon_button.dart';
import 'package:doctorappointment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  final Getprofile user;
  const EditProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  CommonViewModel? vm;
  // ignore: unused_field
  bool _isLoading = false;
  // final ImagePicker _picker = ImagePicker();
  File? imageURI;

  // selectImage() async {
  //   Uint8List im = await pickImage(ImageSource.gallery);
  //   // set state because we need to display the image we selected on the circle avatar
  //   setState(() {
  //     _image = im;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm = Provider.of<CommonViewModel>(context, listen: false);
    vm!.getprofile();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 35.v),
                  child: Column(children: [
                    Stack(
                      children: [
                        imageURI == null
                            ? widget.user.image == "0"
                                ? Container(
                                    height: 140.adaptSize,
                                    width: 140.adaptSize,
                                    decoration: AppDecoration.fillPrimary
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder131),
                                    child: CustomImageView(
                                        imagePath:
                                            ImageConstant.imgGroupOnprimary,
                                        height: 140.adaptSize,
                                        width: 140.adaptSize,
                                        alignment: Alignment.center))
                                : CustomImageView(
                                    fit: BoxFit.cover,
                                    imagePath: WebService().profileImage +
                                        widget.user.image,
                                    height: 140.adaptSize,
                                    width: 140.adaptSize,
                                    radius: BorderRadius.circular(131.h),
                                    alignment: Alignment.center)
                            : CircleAvatar(
                                radius: 64,
                                backgroundImage: FileImage(imageURI!),
                                backgroundColor: Colors.teal,
                              ),
                        Positioned(
                          bottom: 0,
                          right: 80,
                          child: IconButton(
                            color: Colors.teal,
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) => bottomSheet()));
                            },
                            icon: const Icon(Icons.add_a_photo),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 39.v),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Name',
                        hintText: widget.user.name,
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 25.v),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Email Id',
                        hintText: widget.user.email,
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 25.v),
                    TextFormField(
                      readOnly: true,
                      controller: _phoneController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Phone',
                        hintText: widget.user.phone,
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 25.v),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Location',
                        hintText: widget.user.address,
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 49.v),
                    CustomElevatedButton(
                      height: 48.v,
                      text: "Save",
                      margin: EdgeInsets.symmetric(horizontal: 50.h),
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle: CustomTextStyles.titleLargeOnPrimary,
                      onPressed: () {
                        if (_nameController.text.isEmpty) {
                          _nameController.text = widget.user.name;
                        }
                        if (_emailController.text.isEmpty) {
                          _emailController.text = widget.user.email;
                        }
                        if (_addressController.text.isEmpty) {
                          _addressController.text = widget.user.address;
                        }
                        Future<Map<String, dynamic>> successfulMessage = vm!
                            .editprofile(
                                _nameController.text,
                                _phoneController.text,
                                _emailController.text,
                                _addressController.text,
                                imageURI!);
                        log(_nameController.text);
                        log(_phoneController.text);
                        successfulMessage.then((response) async {
                          log("response :$response");
                          if (response['status']) {
                            log(response.toString());
                            ResponseModel user = response['user'];
                            if ("success" == user.message) {
                              log("successfully completed !!");
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           HomeContainerScreen()));
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          }
                        });
                      },
                    ),
                  ])),
            )));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
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
                  Navigator.pop(context);
                }),
            CustomIconButton(
                height: 30.adaptSize,
                width: 34.adaptSize,
                alignment: Alignment.centerLeft,
                onTap: () {
                  Navigator.pop(context);
                },
                child: CustomImageView(
                    imagePath: ImageConstant.imgArrowLeftPrimary))
          ])),
      centerTitle: true,
      title: SizedBox(
          height: 23.v,
          width: 108.h,
          child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.center,
                child: Text("Edit Profile", style: theme.textTheme.titleLarge))
          ])),
    );
  }

  bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile photo",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.camera),
                  color: Colors.teal,
                  iconSize: 35,
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                ),
                const Text("Camera"),
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.image),
                  color: Colors.teal,
                  iconSize: 35,
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                ),
                const Text("Gallery"),
              ],
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);
    //  (source: ImageSource.camera);
    final imageTemporary = File(image!.path);
    setState(() {
      imageURI = imageTemporary;
    });
    Navigator.pop(context);
    // final pickedFile = await _picker.pickImage(
    //   source: source,
    // );

    // log("message;");
    // setState(() {
    //   _imageFile = pickedFile as PickedFile;
    //   log("<<<<<<<<<<<<<<<<<<< IMAGE >>>>>>>>>>>>>>>>>>>>>>>${_imageFile!.path}");
    // });
  }
}
