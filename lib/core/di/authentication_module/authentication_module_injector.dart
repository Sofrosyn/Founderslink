import 'package:dio/dio.dart';
import 'package:founderslink/core/data/local/sharedpreference.dart';
import 'package:founderslink/ui/authentication/data/remote/authentication_remote.dart';
import 'package:founderslink/ui/authentication/data/repo/authentication_repository_implementation.dart';
import 'package:founderslink/ui/authentication/data/repo/authentication_respository.dart';
import 'package:kiwi/kiwi.dart';


part 'authentication_module_injector.g.dart';

abstract class AuthenticationModuleInjector {
  static Container container;

  void setup() {
    container = Container();
    _$AuthenticationModuleInjector().configure();
  }

  static final resolve = container.resolve;






  void configure() {
    _configureAuthenticationModules();
  }

  @Register.factory(AuthenticationRemoteDataSource, from: AuthenticationRemoteDatasourceImpl)
  @Register.factory(AuthenticationRepository, from: AuthenticationRepositoryImpl)
  @Register.singleton(SharedPreference)
  void _configureAuthenticationModules();
}

AuthenticationModuleInjector authenticationModuleInjector() => _$AuthenticationModuleInjector();

