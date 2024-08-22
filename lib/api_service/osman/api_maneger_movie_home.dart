import 'dart:convert';

import 'package:movie_app/api_service/osman/api_constant.dart';
import 'package:http/http.dart'as http;
import 'package:movie_app/model/Popular.dart';
class ApiManegerMovieHome{

  static Future<Popular?> getPopularData()async{
    Uri url =Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.apiLink,
    );
    Map<String,String>?headers={
      "Authorization":ApiConstant.authorization  ,
      "accept":ApiConstant.accept  ,
    };

    var response=await http.get(url,headers: headers);
    var stringResponse=response.body;
    var stringToJson=jsonDecode(stringResponse);
    return Popular.fromJson(stringToJson);

  }

}