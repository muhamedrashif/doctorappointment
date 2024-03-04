import 'package:doctorappointment/model/getspecialised.dart';

class GetspecialisedViewModel {
  final Specialised datas;
  GetspecialisedViewModel({required this.datas});

  String get id {
    return this.datas.id;
  }

  String get image {
    return this.datas.image;
  }

  String get specialisedname {
    return this.datas.specialisedname;
  }

}
