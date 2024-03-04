import 'package:doctorappointment/model/gettoken.dart';

class GetTokenViewModel {
  final Token datas;
  GetTokenViewModel({required this.datas});

  String get id {
    return this.datas.id;
  }

  String get doctorid {
    return this.datas.doctorid;
  }

  String get doctorname {
    return this.datas.doctorname;
  }

  String get status {
    return this.datas.status;
  }

  String get appointmentdate {
    return this.datas.appointmentdate;
  }

  String get appointmenttime {
    return this.datas.appointmenttime;
  }

  String get specialisedname {
    return this.datas.specialisedname;
  }

  String get bookingid{
    return this.datas.bookingid;
  }
}
