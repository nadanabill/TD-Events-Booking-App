import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:td_events_booking/features/all_events/data/models/all_events_model.dart';

import '../../../../../core/networking/api_urls.dart';

part 'all_events_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class AllEventsApiService {
  factory AllEventsApiService(Dio dio) = _AllEventsApiService;

  @GET(ApiUrls.allEvents)
  Future<AllEventsModel> getAllEvents(
    @Query("page") int page,
    @Query("limit") int limit,
  );
}
