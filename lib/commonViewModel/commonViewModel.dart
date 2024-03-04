import 'dart:developer';
import 'dart:io';
import 'package:doctorappointment/model_view/getdate.dart';
import 'package:doctorappointment/model_view/getdoctor.dart';
import 'package:doctorappointment/model_view/getimagescroll.dart';
import 'package:doctorappointment/model_view/getpersonalwellness.dart';
import 'package:doctorappointment/model_view/getprecripption.dart';
import 'package:doctorappointment/model_view/getspecialised.dart';
import 'package:doctorappointment/model_view/getsymptoms.dart';
import 'package:doctorappointment/model_view/gettime.dart';
import 'package:doctorappointment/model_view/gettodaydoctors.dart';
import 'package:doctorappointment/model_view/gettoken.dart';
import 'package:doctorappointment/services/webservice.dart';
import 'package:flutter/material.dart';

class CommonViewModel extends ChangeNotifier {
  bool _docload = false;
  bool get docload => _docload;

  //registration

  Future<Map<String, dynamic>> registration(
      String name, String phone, String type) async {
    final result = await WebService().registration(name, phone, type);
    print("result-----$result");
    return result;
  }

  //login

  Future<Map<String, dynamic>> login(String phone) async {
    final result = await WebService().login(phone);
    print("result-----$result");
    return result;
  }

  //getdoctor

  List<GetdoctorViewModel> getdoctor = [];
  Future<List<GetdoctorViewModel>> getdoctors(String id, String type) async {
    var getdoc;
    final results = await WebService().getdoctor(id, type);
    getdoc = results.map((item) => GetdoctorViewModel(datas: item)).toList();
    getdoctor = getdoc;
    log("Size offff-------" + getdoctor.length.toString());
    notifyListeners();
    return getdoctor;
  }

  //getspecialised

  List<GetspecialisedViewModel> getspecialised = [];
  Future<List<GetspecialisedViewModel>> getspecialiseddoctors() async {
    final results = await WebService().getspecialised();
    getspecialised =
        results.map((item) => GetspecialisedViewModel(datas: item)).toList();
    notifyListeners();
    return getspecialised;
  }

  //getsymptoms

  List<GetsymptomsViewModel> getsymptom = [];
  Future<List<GetsymptomsViewModel>> getsymptoms() async {
    final results = await WebService().getsymptoms();
    getsymptom =
        results.map((item) => GetsymptomsViewModel(datas: item)).toList();
    notifyListeners();
    return getsymptom;
  }

  //appointment

  Future<Map<String, dynamic>> appointment(
      String patientname,
      String phone,
      String address,
      String appointmentdate,
      String appointmenttime,
      String bystandername,
      String doctorid,
      String currentdate,
      String currenttime,
      String id) async {
    final result = await WebService().appointment(
      patientname,
      phone,
      address,
      appointmentdate,
      appointmenttime,
      bystandername,
      doctorid,
      currentdate,
      currenttime,
      id,
    );
    print("result-----$result");
    return result;
  }

  //editprofile

  // late File _imageFile;

  // File get imageFile => _imageFile;

  // void setImageFile(File file) {
  //   _imageFile = file;
  //   notifyListeners();
  // }

  Future<Map<String, dynamic>> editprofile(String name, String phone,
      String email, String address, File image) async {
    final result =
        await WebService().editProfile(name, phone, email, address, image);
    print("result-----$result");
    return result;
  }

  //getprofile

  Future<Map<String, dynamic>> getprofile() async {
    final result = await WebService().getprofile();
    print("result-----$result");
    return result;
  }

  //getpersonalwellness

  List<GetpersonalwellnessViewModel> getpersonalwellness = [];
  Future<List<GetpersonalwellnessViewModel>> getpersonalwellnes() async {
    final results = await WebService().getpersonalwellness();
    getpersonalwellness = results
        .map((item) => GetpersonalwellnessViewModel(datas: item))
        .toList();
    notifyListeners();
    return getpersonalwellness;
  }

  //getimagescroll

  List<GetimagescrollViewModel> getImagescroll = [];
  Future<List<GetimagescrollViewModel>> getImagescrol() async {
    final results = await WebService().getImagescroll();
    getImagescroll =
        results.map((item) => GetimagescrollViewModel(datas: item)).toList();
    notifyListeners();
    return getImagescroll;
  }

  //getdate

  List<GetDateViewModel> getdatee = [];
  Future<List<GetDateViewModel>> getdate(String doctorid) async {
    final results = await WebService().getdate(doctorid);
    getdatee = results.map((item) => GetDateViewModel(datas: item)).toList();
    notifyListeners();
    return getdatee;
  }

  //gettodaydoctor

  List<GetTodaydoctorViewModel> gettodaydoctor = [];
  Future<List<GetTodaydoctorViewModel>> gettodaydoctors() async {
    final results = await WebService().gettodaydoctors();
    gettodaydoctor =
        results.map((item) => GetTodaydoctorViewModel(datas: item)).toList();
    notifyListeners();
    return gettodaydoctor;
  }

  //gettime

  List<GetTimeViewModel> gettimee = [];
  Future<List<GetTimeViewModel>> gettime(String id, DateTime date) async {
    final results = await WebService().gettime(id, date);
    gettimee = results.map((item) => GetTimeViewModel(datas: item)).toList();
    notifyListeners();
    return gettimee;
  }

  //gettoken

  List<GetTokenViewModel> gettokenm = [];
  Future<List<GetTokenViewModel>> gettoken(String ststus) async {
    final results = await WebService().gettoken(ststus);
    gettokenm = results.map((item) => GetTokenViewModel(datas: item)).toList();
    notifyListeners();
    return gettokenm;
  }

  //getprescription

  List<GetPrescriptionViewModel> getPrescription = [];
  Future<List<GetPrescriptionViewModel>> getprescription() async {
    _docload = true;
    final results = await WebService().getprescription();
    getPrescription =
        results.map((item) => GetPrescriptionViewModel(datas: item)).toList();
    _docload = false;
    notifyListeners();
    return getPrescription;
  }
  //getlatestprescription

  Future<Map<String, dynamic>> getlatestprescription() async {
    final result = await WebService().latestprescription();
    // print("result-----$result");
    return result;
  }

  //getlatestdoctor

  Future<Map<String, dynamic>> getlatestdoctor() async {
    final result = await WebService().latestdoctor();
    // print("result-----$result");
    return result;
  }


  //getclinicinfo

  Future<Map<String, dynamic>> getclinicinfo() async {
   
    final result = await WebService().clinicinfoo();
 log("clinicinfo====================="+result.toString());  
   return result;
  }


  // //getnotification

  // List<GetNotificationViewModel> getnotificationn = [];
  // Future<List<GetNotificationViewModel>> getnotification() async {
  //   final results = await WebService().getnotification();
  //   getnotificationn =
  //       results.map((item) => GetNotificationViewModel(datas: item)).toList();
  //   notifyListeners();
  //   return getnotificationn;
  // }
}
