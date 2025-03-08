import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:td_events_booking/features/auth/login/logic/login_cubit.dart';
import 'package:td_events_booking/features/auth/register/data/api/register_api_service.dart';
import 'package:td_events_booking/features/auth/register/logic/register_cubit.dart';

import '../../features/all_events/data/api/all_events_api_service.dart';
import '../../features/all_events/data/repo/all_events_repo.dart';
import '../../features/all_events/logic/all_events_cubit.dart';
import '../../features/auth/register/data/repo/register_repo.dart';
import '../../features/event/data/api/event_details_api_service.dart';
import '../../features/event/data/repo/event_details_repo.dart';
import '../../features/event/logic/event_details_cubit.dart';
import '../../features/organizer_profile/data/api/organizer_api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  // Register Feature
  getIt
      .registerLazySingleton<RegisterApiService>(() => RegisterApiService(dio));
  getIt.registerLazySingleton<RegisterRepo>(
      () => RegisterRepo(getIt<RegisterApiService>()));
  getIt.registerLazySingleton<RegisterCubit>(
      () => RegisterCubit(getIt<RegisterRepo>()));

  // login Feature
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit());

  // all events Feature
  getIt.registerLazySingleton<AllEventsApiService>(
      () => AllEventsApiService(dio));
  getIt.registerLazySingleton<AllEventsRepo>(
      () => AllEventsRepo(getIt<AllEventsApiService>()));
  getIt.registerLazySingleton<AllEventsCubit>(
      () => AllEventsCubit(getIt<AllEventsRepo>()));

  // event details Feature
  getIt.registerLazySingleton<EventDetailsApiService>(
      () => EventDetailsApiService(dio));
  getIt.registerLazySingleton<EventDetailsRepo>(
      () => EventDetailsRepo(getIt<EventDetailsApiService>()));
  getIt.registerLazySingleton<EventDetailsCubit>(
      () => EventDetailsCubit(getIt<EventDetailsRepo>()));

  // organizer profile Feature
  getIt.registerLazySingleton<OrganizerApiService>(
      () => OrganizerApiService(dio));
}
