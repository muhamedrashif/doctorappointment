import 'package:doctorappointment/model/getprescription.dart';

class GetPrescriptionViewModel {
  final Prescription datas;
  GetPrescriptionViewModel({required this.datas});

  String get id {
    return this.datas.id;
  }

  String get doctorname {
    return this.datas.doctorname;
  }

  String get prescription {
    return this.datas.prescription;
  }

  DateTime get precriptiondate {
    return this.datas.precriptiondate;
  }

  String get prescriptionimage {
    return this.datas.prescriptionimage;
  }
}
