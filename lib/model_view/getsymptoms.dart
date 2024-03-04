import 'package:doctorappointment/model/getsymptoms.dart';

class GetsymptomsViewModel {
  final Symptom datas;
  GetsymptomsViewModel({required this.datas});

  String get id {
    return this.datas.id;
  }

  String get image {
    return this.datas.image;
  }

  String get symptomsname {
    return this.datas.symptomsname;
  }
 String get doctorid {
    return this.datas.doctorid;
  }
}
