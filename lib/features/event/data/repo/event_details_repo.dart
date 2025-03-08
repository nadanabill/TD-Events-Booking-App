import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../api/event_details_api_service.dart';
import '../models/event_details_model.dart';

class EventDetailsRepo {
  final EventDetailsApiService _eventDetailsApiService;

  EventDetailsRepo(this._eventDetailsApiService);

  Future<ApiResult<EventDetailsModel>> getEventDetails(
      {required int eventId}) async {
    try {
      final response = await _eventDetailsApiService.getEventDetails(eventId);
      return ApiResult.success(response);
    } catch (error) {
      print(error.toString());
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
