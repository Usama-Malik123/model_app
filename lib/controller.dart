import 'package:get/get.dart';
import 'package:model_application/model.dart';
import 'package:model_application/url_service.dart';

class Controller extends GetxController {
  final urlService = Get.put(UrlService());

  Future<Model> getData(String text) async {
    var res;
    try {
      res = await urlService.getdata(text);
      if (res.statusCode != 200 || res.statusCode != 201) {
      
        return res;
      } else {}
    } catch (e) {}
    return Model.fromJson(res.data);
  }}
