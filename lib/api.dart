import 'package:dio/dio.dart';
import 'package:hello_google_maps/response_data.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(
    baseUrl: 'https://run.mocky.io/v3/bbe64381-640b-427f-a8f4-309a4c756782')
abstract class Api {
  factory Api(Dio dio) = _Api;

  @GET('')
  Future<ResponseData> getUsers();
}
