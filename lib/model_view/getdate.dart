import 'package:doctorappointment/model/getdate.dart';

class GetDateViewModel {
  final Date datas;
  GetDateViewModel({required this.datas});

  String get id {
    return this.datas.id;
  }

  String get doctorid {
    return this.datas.doctorid;
  }

  // String get status {
  //   return this.datas.status;
  // }

  // String get time {
  //   return this.datas.time;
  // }

  DateTime get date {
    return this.datas.date;
  }
}
