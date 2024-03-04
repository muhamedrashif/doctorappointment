import 'package:doctorappointment/model/getpersonalwelness.dart';

class GetpersonalwellnessViewModel {
  final PersonalWellness datas;
  GetpersonalwellnessViewModel({required this.datas});

  String get id {
    return this.datas.id;
  }

  String get image {
    return this.datas.image;
  }

  String get personalWellnessName {
    return this.datas.personalWellnessName;
  }

}
