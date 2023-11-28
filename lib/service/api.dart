import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../databean/baseresponse.dart';

class ApiService{
  static const String _domain = "";
  static const bool _debug = kDebugMode;
  static final Dio _dio = Dio();


  /// Http Post
   static Future<BaseResponse> postRequest(String url, Map<String, dynamic>? data) async {
    try {
      final response = await _dio.request('$_domain$url', options: Options(method: 'POST', headers: {'Content-Type': 'application/json'},), data: data,).timeout(const Duration(seconds: 25));
      if(_debug){
        print("$url \npost Data $response");
      }
      if (response.statusCode == 200) {
        return BaseResponse.fromJson(response.data);
      } else {
        return BaseResponse(code: 0, data: null, remark: 'Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('$url \nRequest error: $e');
      return BaseResponse(code: 0, data: null, remark: 'Request failed with error: $e');
    }
  }

  /// Http Get
  static Future<BaseResponse> getRequest(String url) async{
    try {
      final response = await _dio.get('$_domain$url').timeout(const Duration(seconds: 25));
      if(_debug){
        print("$url \nGet Data $response");
      }
      if (response.statusCode == 200) {
        return BaseResponse.fromJson(response.data);
      } else {
        return BaseResponse(code: 0, data: null, remark: 'Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('$url \nRequest error: $e');
      return BaseResponse(code: 0, data: null, remark: 'Request failed with error: $e');
    }
  }
}