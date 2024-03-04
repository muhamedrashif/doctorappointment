import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:doctorappointment/model/getclinicinfo.dart';
import 'package:doctorappointment/model/getdate.dart';
import 'package:doctorappointment/model/getdoctor.dart';
import 'package:doctorappointment/model/getimagescroll.dart';
import 'package:doctorappointment/model/getlatestdoctor.dart';
import 'package:doctorappointment/model/getlatestprescription.dart';
import 'package:doctorappointment/model/getpersonalwelness.dart';
import 'package:doctorappointment/model/getprescription.dart';
import 'package:doctorappointment/model/getprofile.dart';
import 'package:doctorappointment/model/getspecialised.dart';
import 'package:doctorappointment/model/getsymptoms.dart';
import 'package:doctorappointment/model/gettime.dart';
import 'package:doctorappointment/model/gettodaydocotor.dart';
import 'package:doctorappointment/model/gettoken.dart';
import 'package:doctorappointment/model/response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
// import 'package:http/http.dart' as http;

class WebService {
  // Common url
  String url = "http://192.168.29.19:8080/Clinic/";
  String imageurl = "http://192.168.29.19:8080/Clinic/images/";
  String profileImage = "http://192.168.29.19:8080/Clinic/profileimage/";

  Dio dio = new Dio();
  String mainurl = "https://doctor.appoinment.sevanapp.com/";
// get doctor
  Future<List<Datum>> getdoctor(String id, String type) async {
    log("inside");
    final response =
        await Dio().post(url + "getdoctor.jsp", data: {"id": id, "type": type});
    if (response.statusCode == 200) {
      log(response.data.toString());
      final parsed = response.data.cast<Map<String, dynamic>>();
      print(parsed);
      return parsed.map<Datum>((json) => Datum.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load area............');
    }
  }

  // get symptoms

  Future<List<Symptom>> getsymptoms() async {
    log("inside");
    final response = await Dio().get(mainurl + "getsymptoms.php");
    if (response.statusCode == 200) {
      log(response.statusCode.toString());
      final parsed = response.data.cast<Map<String, dynamic>>();
      print(parsed);
      return parsed.map<Symptom>((json) => Symptom.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load area............');
    }
  }

  // get specialised

  Future<List<Specialised>> getspecialised() async {
    log("inside");
    final response = await Dio().get(mainurl + "getspecialised.php");
    if (response.statusCode == 200) {
      log(response.statusCode.toString());
      final parsed = response.data.cast<Map<String, dynamic>>();
      print(parsed);
      return parsed
          .map<Specialised>((json) => Specialised.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load area............');
    }
  }

// login

  // Future<Map<String, dynamic>> login(String phone) async {
  //   SharedPreferences _prefs;

  //   print('webservice');
  //   print(phone);
  //   var result;
  //   _prefs = await SharedPreferences.getInstance();

  //   final Map<String, dynamic> loginData = {
  //     'phone': phone,
  //   };

  //   final response = await http.post(
  //     Uri.parse(mainurl + "login.php"),
  //     body: loginData,
  //   );
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> response1 = jsonDecode(response.body);

  //     print(response.body);

  //     var userData = response1;
  //     print(userData);
  //     ResponseModel ws = ResponseModel.fromJson(userData);
  //     result = {'status': true, 'message': 'Successful', 'user': ws};
  //     log("web res--------$result");
  //     log("login successfully completed !!");
  //     _prefs.setBool('isLoggedIn', true);
  //     _prefs.setString('phone', phone.toString());

  //     log("phone=====$phone");
  //   } else {
  //     result = {
  //       'status': false,
  //       'message': json.decode(response.body)['error']
  //     };
  //   }
  //   return result;
  // }

  Future<Map<String, dynamic>> login(String phone) async {
    SharedPreferences _prefs;

    print('webservice');
    print(phone);
    var result;
    _prefs = await SharedPreferences.getInstance();
    try {
      final Map<String, dynamic> loginData = {
        'phone': phone,
      };
      // dio.options.contentType = 'application/json';
      // dio.options.headers['Content-Type'] = 'application/json';
      final response = await dio.post(mainurl + "login.php", data: loginData);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        print(response.data);

        var userData = responseData;
        print(userData);
        ResponseModel ws = ResponseModel.fromJson(userData);
        result = {'status': true, 'message': 'Successful', 'user': ws};
        log("web res--------$result");
        log("login successfully completed !!");
        _prefs.setBool('isLoggedIn', true);
        _prefs.setString('phone', phone.toString());

        log("phone=====$phone");
      } else {
        result = {
          'status': false,
          'message': json.decode(response.data)['error']
        };
      }
    } catch (error) {
      print("Error: $error");
      result = {'status': false, 'message': 'An error occurred......'};
    }
    return result;
  }

// registration

  // Future<Map<String, dynamic>> registraion(
  //     String name, String phone, String type) async {
  //   SharedPreferences _prefs;

  //   print('webservice');
  //   print(name);
  //   print(phone);
  //   var result;
  //   _prefs = await SharedPreferences.getInstance();

  //   final Map<String, dynamic> registrationData = {
  //     'name': name,
  //     'phone': phone,
  //     'type': type,
  //   };
  //   final response = await http.post(
  //     Uri.parse(mainurl + "registration.php"),
  //     body: registrationData,
  //   );
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //           Map<String, dynamic> response1 = jsonDecode(response.body);

  //     print(response.body);

  //     var userData = response1;
  //     print(userData);
  //     ResponseModel ws = ResponseModel.fromJson(userData);
  //     result = {'status': true, 'message': 'Successful', 'user': ws};
  //     log("web res--------$result");
  //     log("login successfully completed !!");
  //     _prefs.setBool('isLoggedIn', true);
  //     _prefs.setString('name', name.toString());
  //     _prefs.setString('phone', phone.toString());

  //     log("name=====$name");
  //     log("phone=====$phone");
  //   } else {
  //     result = {
  //       'status': false,
  //       'message': json.decode(response.body)['error']
  //     };
  //   }
  //   return result;
  // }

  Future<Map<String, dynamic>> registration(
      String name, String phone, String type) async {
    SharedPreferences _prefs;

    print('webservice');
    print(name);
    print(phone);
    var result;
    _prefs = await SharedPreferences.getInstance();

    try {
      final Map<String, dynamic> registrationData = {
        'name': name,
        'phone': phone,
        'type': type,
      };

      // dio.options.headers = {
      //   'Accept': 'application/json',
      //   'Content-Type': 'application/json',
      // };
      final response = await Dio()
          .post(mainurl + "registration.php", data: registrationData);

      print(response.statusCode);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        print(response.data);

        var userData = responseData;
        print(userData);
        ResponseModel ws = ResponseModel.fromJson(userData);
        result = {'status': true, 'message': 'Successful', 'user': ws};
        print("web res--------$result");
        print("Registration successfully completed !!");
        _prefs.setBool('isLoggedIn', true);
        _prefs.setString('name', name.toString());
        _prefs.setString('phone', phone.toString());

        print("name=====$name");
        print("phone=====$phone");
      } else {
        result = {
          'status': false,
          'message': json.decode(response.data)['error']
        };
      }
    } catch (error) {
      print("Error: $error");
      result = {'status': false, 'message': 'An error occurred.'};
    }

    return result;
  }

  // appointment

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
    var result;
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? username = _prefs.getString('phone');
    final Map<String, dynamic> appointmentData = {
      'patientname': patientname,
      'phone': phone,
      'address': address,
      'appointmentdate': appointmentdate,
      'appointmenttime': appointmenttime,
      'bystandername': bystandername,
      'doctorid': doctorid,
      'currentdate': currentdate,
      'currenttime': currenttime,
      'id': id,
      'username': username
    };

    log("appointmnet----------$appointmentData");
    final response =
        await Dio().post(url + "appointment.jsp", data: appointmentData);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = response.data;
      print(response.data);

      var userData = responseData;
      print(userData);
      ResponseModel ws = ResponseModel.fromJson(userData);
      result = {'status': true, 'message': 'Successful', 'user': ws};
      log("web res--------$result");
    } else {
      result = {
        'status': false,
        'message': json.decode(response.data)['error']
      };
    }
    return result;
  }

  //  editprofile

  Future<Map<String, dynamic>> editProfile(
    String name,
    String phone,
    String email,
    String address,
    File image,
  ) async {
    var result;
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String username = _prefs.getString('phone')!;

    log("nnnnn===" + address);

    // final Map<String, dynamic> editProfileData = {
    //   'name': name,
    //   'phone': phone,
    //   'email': email,
    //   'address': address,
    //   // 'image': image, // Remove this line, as we'll handle the image separately

    // };

    var uuid = Uuid();

    log("iiiiii===" + uuid.v1());

    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          image.path,
          filename: 'profile_image' + uuid.v1() + '.jpg',
        ),
        'name': name,
        'phone': username,
        'email': email,
        'address': address,
      });

      log("editProfileData----------+" + formData.toString());

      final response = await Dio().post(url + "editprofile", data: formData);

      print("-------------------" + response.statusCode.toString());

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        print(response.data);

        var userData = responseData;
        print(userData);
        // Assuming ResponseModel is a model class you've defined
        ResponseModel ws = ResponseModel.fromJson(userData);
        result = {'status': true, 'message': 'Successful', 'user': ws};
        log("web res--------$result");
      } else {
        result = {
          'status': false,
          'message': json.decode(response.data)['error'],
        };
      }
    } catch (error) {
      result = {
        'status': false,
        'message': 'An error occurred: $error',
      };
    }

    return result;
  }

  // get profile

  Future<Map<String, dynamic>> getprofile() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String username = _prefs.getString('phone')!;

    print('webservice');

    var result;
    _prefs = await SharedPreferences.getInstance();

    final response =
        await Dio().post(mainurl + "getprofile.php", data: {'username': username});
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = response.data;
      print(response.data);

      var userData = responseData;
      // print("qqqqqqqqqqqqqqqqqqq---------------"+response.data);
      Getprofile ws = Getprofile.fromJson(userData);
      result = {'status': true, 'message': 'Successful', 'user': ws};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.data)['error']
      };
    }
    return result;
  }

  // get personal_wellness

  Future<List<PersonalWellness>> getpersonalwellness() async {
    log("inside");
    final response = await Dio().get(url + "getpersonalwellness.jsp");
    if (response.statusCode == 200) {
      log(response.statusCode.toString());
      final parsed = response.data.cast<Map<String, dynamic>>();
      print(parsed);
      return parsed
          .map<PersonalWellness>((json) => PersonalWellness.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load area............');
    }
  }

  // get Imagescroll

  Future<List<Imagescroll>> getImagescroll() async {
    log("inside");
    final response = await Dio().get(url + "getimagescroll.jsp");
    if (response.statusCode == 200) {
      log(response.statusCode.toString());
      final parsed = response.data.cast<Map<String, dynamic>>();
      print(parsed);
      return parsed
          .map<Imagescroll>((json) => Imagescroll.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load area............');
    }
  }

  // get date

  Future<List<Date>> getdate(docotorid) async {
    log("inside");
    final response =
        await Dio().post(url + "getdate.jsp", data: {"doctorid": docotorid});
    if (response.statusCode == 200) {
      log(response.statusCode.toString());
      final parsed = response.data.cast<Map<String, dynamic>>();
      print(parsed);
      return parsed.map<Date>((json) => Date.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load area............');
    }
  }

  // get todaydoctor

  Future<List<Todaydoctor>> gettodaydoctors() async {
    log("inside");
    final response = await Dio().get(url + "gettodaydoctor.jsp");
    if (response.statusCode == 200) {
      log(response.statusCode.toString());
      final parsed = response.data.cast<Map<String, dynamic>>();
      print(parsed);
      return parsed
          .map<Todaydoctor>((json) => Todaydoctor.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load area............');
    }
  }

  // get time

  Future<List<Time>> gettime(id, date) async {
    log("inside");
    final response = await Dio().post(mainurl + "gettime.php",
        data: {"doctorid": id, "date": date.toString()});
    print("parsed-------------" + response.data.toString());
    if (response.statusCode == 200) {
      log(response.statusCode.toString());
      final parsed = response.data.cast<Map<String, dynamic>>();

      return parsed.map<Time>((json) => Time.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load area............');
    }
  }

  // get token

  Future<List<Token>> gettoken(String st) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String username = _prefs.getString('phone')!;

    log("inside");
    final response = await Dio()
        .post(mainurl + "gettoken.php", data: {"status": st, "username": username});
    log("parsed-------------" + response.data.toString());
    if (response.statusCode == 200) {
      log(response.statusCode.toString());
      final parsed = response.data.cast<Map<String, dynamic>>();

      return parsed.map<Token>((json) => Token.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load area............');
    }
  }

  // get prescription

  Future<List<Prescription>> getprescription() async {
    log("inside");
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String username = _prefs.getString('phone')!;
    final response = await Dio()
        .post(url + "getprescription.jsp", data: {'username': username});
    log("parsed-------------" + response.data.toString());
    if (response.statusCode == 200) {
      log("response.statusCode========" + response.statusCode.toString());
      final parsed = response.data.cast<Map<String, dynamic>>();
      return parsed
          .map<Prescription>((json) => Prescription.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load area............');
    }
  }

// getlatestprescription
  Future<Map<String, dynamic>> latestprescription() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String username = _prefs.getString('phone')!;

    print('webservice');

    var result;
    _prefs = await SharedPreferences.getInstance();

    log("working 1");
    final response = await Dio()
        .post(url + "getlatestprescription.jsp", data: {'username': username});
    log("working 2" + response.data.toString());

    print("q" + response.data.toString());
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = response.data;
      log("working 3" + response.data.toString());
      // log("eeeee"+response.data);

      log("working 4" + response.data.toString());

      // var userData = responseData;
      // print(userData);
      Latestprescription ws = Latestprescription.fromJson(responseData);
      result = {'status': true, 'message': 'Successful', 'user': ws};
      log("working 5" + response.data.toString());
    } else {
      result = {
        'status': false,
        'message': json.decode(response.data)['error']
      };
    }
    return result;
  }

// getlatestdoctor
  Future<Map<String, dynamic>> latestdoctor() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String username = _prefs.getString('phone')!;

    print('webservice');

    var result;
    _prefs = await SharedPreferences.getInstance();

    final response = await Dio()
        .post(url + "getlatestvisiteddoctor.jsp", data: {'username': username});
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = response.data;
      print(response.data);

      var userData = responseData;
      print(userData);
      Latestdocotorvisited ws = Latestdocotorvisited.fromJson(userData);
      result = {'status': true, 'message': 'Successful', 'user': ws};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.data)['error']
      };
    }
    return result;
  }

// getclinicinfo
  Future<Map<String, dynamic>> clinicinfoo() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String username = _prefs.getString('phone')!;

    print('webservice');

    var result;
    _prefs = await SharedPreferences.getInstance();

    final response =
        await Dio().post(url + "clinicinfo.jsp", data: {'username': username});
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = response.data;
      print(response.data);

      var userData = responseData;
      print(userData);
      Clinic ws = Clinic.fromJson(userData);
      result = {'status': true, 'message': 'Successful', 'user': ws};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.data)['error']
      };
    }
    return result;
  }

  // // get notification

  // Future<List<Notification>> getnotification() async {
  //   log("inside");
  //   final response = await Dio().post(url + "getnotification.jsp", data: {});
  //   print("parsed-------------" + response.data.toString());
  //   if (response.statusCode == 200) {
  //     log(response.statusCode.toString());
  //     final parsed = response.data.cast<Map<String, dynamic>>();

  //     return parsed
  //         .map<Notification>((json) => Notification.fromJson(json))
  //         .toList();
  //   } else {
  //     throw Exception('Failed to load area............');
  //   }
  // }
}
