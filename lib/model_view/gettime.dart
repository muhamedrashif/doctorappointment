import 'package:doctorappointment/model/gettime.dart';

class GetTimeViewModel {
  final Time datas;
  GetTimeViewModel({required this.datas});

  String get id {
    return this.datas.id;
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
}
