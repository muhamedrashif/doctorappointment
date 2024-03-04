import 'package:doctorappointment/model/gettodaydocotor.dart';

class GetTodaydoctorViewModel {
  final Todaydoctor datas;
  GetTodaydoctorViewModel({required this.datas});

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

  String get categoryid {
    return this.datas.specialisedid;
  }

  String get doctorid {
    return this.datas.doctorid;
  }

  String get status {
    return this.datas.status;
  }

  String get time {
    return this.datas.time;
  }

  DateTime get date {
    return this.datas.date;
  }

  String get specialisedname {
    return this.datas.specialisedname;
  }
}
