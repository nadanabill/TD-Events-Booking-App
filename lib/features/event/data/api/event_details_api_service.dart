import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_urls.dart';
import '../models/event_details_model.dart';

part 'event_details_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class EventDetailsApiService {
  factory EventDetailsApiService(Dio dio) = _EventDetailsApiService;

  @GET("${ApiUrls.allEvents}/{eventId}")
  Future<EventDetailsModel> getEventDetails(@Path("eventId") int eventId);
}
