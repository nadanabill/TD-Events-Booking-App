import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_urls.dart';
import '../models/organizer_model.dart';

part 'organizer_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class OrganizerApiService {
  factory OrganizerApiService(Dio dio) = _OrganizerApiService;

  @GET("${ApiUrls.organizers}/{organizerId}")
  Future<OrganizerModel> getOrganizer(
    @Path("organizerId") int organizerId,
  );
}
