import 'package:td_events_booking/features/auth/register/data/api/register_api_service.dart';
import 'package:td_events_booking/features/auth/register/data/models/register_response_model.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../models/register_request_model.dart';

class RegisterRepo {
  final RegisterApiService _registerApiService;

  RegisterRepo(this._registerApiService);

  Future<ApiResult<RegisterResponseModel>> register(
      RegisterRequestModel registerRequestModel) async {
    try {
      final response = await _registerApiService.register(registerRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
