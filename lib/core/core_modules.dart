import 'package:capoeirasport_project/core/network/dio_client.dart';
import 'package:capoeirasport_project/core/utils/hive_service.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@module
abstract class CoreModules {
  // @singleton
  // AppRouter get appRouter => AppRouter(authGuard: AuthGuard());

  @singleton
  DioClient get dioClient => DioClient();

  @singleton
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();

  @Singleton(as: HiveService)
  HiveServiceImpl get hiveServiceImpl => const HiveServiceImpl();
}
