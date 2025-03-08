import 'package:td_events_booking/core/networking/api_result.dart';
import 'package:td_events_booking/features/organizer_profile/data/api/organizer_api_service.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../models/organizer_model.dart';

class OrganizersRepo {
  final OrganizerApiService _organizerApiService;

  OrganizersRepo(this._organizerApiService);

  Future<ApiResult<OrganizerModel>> getOrganizer(
      {required int organizerId}) async {
    try {
      final response =
          await _organizerApiService.getOrganizer( organizerId);
      return ApiResult.success(response);
    } catch (error) {
      print(error.toString());
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
