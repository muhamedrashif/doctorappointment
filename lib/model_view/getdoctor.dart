
import 'package:doctorappointment/model/getdoctor.dart';

class GetdoctorViewModel {
  final Datum datas;
  GetdoctorViewModel({required this.datas});

  String get id {
    return this.datas.id;
  }

  String get name {
    return this.datas.name;
  }

  String get qualification {
    return this.datas.qualification;
  }

  String get fees {
    return this.datas.fees;
  }

  String get experience {
    return this.datas.experience;
  }

  String get description {
    return this.datas.description;
  }

  String get image {
    return this.datas.image;
  }

  String get Specialisedid {
    return this.datas.specialisedid;
  }

   String get specialisedname {
    return this.datas.specialisedname;
  }



}
