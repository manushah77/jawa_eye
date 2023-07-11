import 'package:get_it/get_it.dart';
import 'package:jawa_eye/providers/api_client.dart';
import 'package:jawa_eye/providers/auth_provider.dart';

final GetIt locator = GetIt.instance;

void initServices() {
  // providers
  locator.registerLazySingleton(() => FirebaseClient());
  locator.registerLazySingleton(() => AuthProvider());

}
