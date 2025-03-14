import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/resources/constants_manager.dart';

@singleton
class ApiManager{
  Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConestants.baseUrl,
    ),
  );

  Future<Response> get({
    required String url,
    Map<String,dynamic>? query,
    Map<String,dynamic>? headers,
    })async{
      var response = await dio.get(url, queryParameters: query, options: Options(headers: headers));
      return response;
  }

  

}


/*
Future<Response> post({
    required String url,
    Map<String,dynamic>? body,
    Map<String,dynamic>? headers,
    dynamic data,
    }) async {
    try {
      return await dio.post(url, data: body , options: Options(headers: headers)); 
    } catch (e) {
      throw e;
    }
  }

  Future<Response> postFormData({
    required String url,
    Map<String,dynamic>? body,
    Map<String,dynamic>? headers,
    dynamic data,
    }) async {
    try {
      return await dio.post(url, data: FormData.fromMap(body!) , options: Options(headers: headers)); 
    } catch (e) {
      throw e;
    }
  }
 */