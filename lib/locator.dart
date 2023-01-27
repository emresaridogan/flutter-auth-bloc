import 'package:get_it/get_it.dart';

import 'features/data/datasources/authentication_service.dart';
import 'features/data/repository/authentication_repository_impl.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationServiceImpl());
  locator.registerLazySingleton(() => AuthenticationRepositoryImpl());
}
