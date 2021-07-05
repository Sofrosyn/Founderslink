// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_module_injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$AuthenticationModuleInjector extends AuthenticationModuleInjector {
  void _configureAuthenticationModules() {
    final Container container = Container();
    container
        .registerFactory<AuthenticationRemoteDataSource, AuthenticationRemoteDatasourceImpl>(
            (c) => AuthenticationRemoteDatasourceImpl(c<Dio>()));
    container.registerFactory<AuthenticationRepository, AuthenticationRepositoryImpl>((c) =>
        AuthenticationRepositoryImpl(
            c<AuthenticationRemoteDataSource>(), c<SharedPreference>()));
    container.registerSingleton((c) => SharedPreference());
  }
}
