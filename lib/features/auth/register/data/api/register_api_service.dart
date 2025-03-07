import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:td_events_booking/features/auth/register/data/models/register_request_model.dart';
import 'package:td_events_booking/features/auth/register/data/models/register_response_model.dart';

import '../../../../../core/networking/api_urls.dart';

part 'register_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class RegisterApiService {
  factory RegisterApiService(Dio dio) = _RegisterApiService;

  @POST(ApiUrls.register)
  Future<RegisterResponseModel> register(
    @Body() RegisterRequestModel requestModel,
  );
}
