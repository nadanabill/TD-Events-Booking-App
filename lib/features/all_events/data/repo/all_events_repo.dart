import 'package:td_events_booking/features/all_events/data/api/all_events_api_service.dart';
import 'package:td_events_booking/features/all_events/data/models/all_events_model.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';

class AllEventsRepo {
  final AllEventsApiService _allEventsApiService;

  AllEventsRepo(this._allEventsApiService);

  Future<ApiResult<AllEventsModel>> getAllEvents(
      {required int page, required int limit}) async {
    try {
      final response = await _allEventsApiService.getAllEvents(page, limit);
      return ApiResult.success(response);
    } catch (error) {
      print(error.toString());
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
