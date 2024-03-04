// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// pickImage(ImageSource source) async {
//   final ImagePicker _imagePicker = ImagePicker();

//   XFile? _file = await _imagePicker.pickImage(source: source);
//   if (_file != null) {
//     return await _file.readAsBytes();
//   }
//   print('No image Selected');
// }


//   //  PickedFile? _imageFile;
//   // final ImagePicker _picker = ImagePicker();
//   // void takePhoto(ImageSource source) async {
//   //   final pickedFile = await _picker.pickImage(
//   //     source: source,
//   //   );
//   //   setState(() {
//   //     _imageFile = pickedFile as PickedFile;
//   //     log("<<<<<<<<<<<<<<<<<<< IMAGE >>>>>>>>>>>>>>>>>>>>>>>${_imageFile.path}");
//   //   });
//   // }
// showSnackBar(String content, BuildContext context) {
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     content: Text(content),
//   ));
// }
