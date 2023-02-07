import 'package:dio/dio.dart';
import 'base_service.dart';

class UrlService {
  BaseService service = BaseService();
  Future<Response> getdata(String text) async {
    try {
      Response response = await service
          .request("https://api.agify.io/?name=$text", method: "Get");
      print(" random name : ${response}");
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}
