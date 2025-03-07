import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:td_events_booking/features/auth/register/data/api/register_api_service.dart';
import 'package:td_events_booking/features/auth/register/logic/register_cubit.dart';

import '../../features/auth/register/data/repo/register_repo.dart';
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
}
