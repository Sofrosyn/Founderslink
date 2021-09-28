import 'package:founderslink/core/data/local/sharedpreference.dart';
import 'package:dio/dio.dart';
import 'package:founderslink/ui/authentication/data/remote/authentication_remote.dart';
import 'package:founderslink/ui/authentication/data/repo/authentication_repository_implementation.dart';
import 'package:founderslink/ui/authentication/data/repo/authentication_respository.dart';
import 'package:founderslink/ui/profile/data/remote/profile_remote.dart';
import 'package:founderslink/ui/profile/data/repo/profile_repository_implementation.dart';
import 'package:founderslink/ui/profile/data/repo/profile_respository.dart';
import 'package:get_it/get_it.dart';






final sl = GetIt.instance;

Future<void> initDependencies() async {
  //! Features



  //! Core
  sl.registerFactory<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl(sl(), sl()),
  );


  sl.registerFactory<Dio>(() => Dio());



  sl.registerFactory<ProfileRemoteDataSource>(
          () => ProfileRemoteDatasourceImpl(sl()));

  sl.registerFactory<ProfileRepository>(
        () => ProfileRepositoryImpl(sl(), sl()),
  );


  sl.registerFactory<AuthenticationRemoteDataSource>(
          () => AuthenticationRemoteDatasourceImpl(sl()));


  //! External
  final sharedPreferences = SharedPreference();
  sl.registerLazySingleton<SharedPreference>(() => sharedPreferences);
}