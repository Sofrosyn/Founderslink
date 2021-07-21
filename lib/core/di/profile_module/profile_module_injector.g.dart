// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_module_injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$ProfileModuleInjector extends ProfileModuleInjector {
  void _configureProfileModules() {
    final Container container = Container();
    container
        .registerFactory<ProfileRemoteDataSource, ProfileRemoteDatasourceImpl>(
            (c) => ProfileRemoteDatasourceImpl(c<Dio>()));
    container.registerFactory<ProfileRepository, ProfileRepositoryImpl>((c) =>
        ProfileRepositoryImpl(
            c<ProfileRemoteDataSource>(), c<SharedPreference>()));

  }
}
