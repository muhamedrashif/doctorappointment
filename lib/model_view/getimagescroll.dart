import 'package:doctorappointment/model/getimagescroll.dart';

class GetimagescrollViewModel {
  final Imagescroll datas;
  GetimagescrollViewModel({required this.datas});

  String get id {
    return this.datas.id;
  }

  String get image {
    return this.datas.image;
  }
}
