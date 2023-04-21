import 'package:dio/dio.dart';
import 'package:hello_google_maps/response_data.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(
    baseUrl: 'https://run.mocky.io/v3/adc500c0-4152-41b0-8e73-39b660d4352e')
abstract class Api {
  factory Api(Dio dio) = _Api;

  @GET('')
  Future<ResponseData> getUsers();
}
