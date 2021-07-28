import 'package:dio/dio.dart';
import 'package:founderslink/core/data/local/sharedpreference.dart';
import 'package:founderslink/ui/authentication/data/remote/authentication_remote.dart';
import 'package:founderslink/ui/authentication/data/repo/authentication_repository_implementation.dart';
import 'package:founderslink/ui/authentication/data/repo/authentication_respository.dart';
import 'package:founderslink/ui/profile/data/remote/profile_remote.dart';
import 'package:founderslink/ui/profile/data/repo/profile_repository_implementation.dart';
import 'package:founderslink/ui/profile/data/repo/profile_respository.dart';
import 'package:kiwi/kiwi.dart';


part 'profile_module_injector.g.dart';

abstract class ProfileModuleInjector {
  static Container container;

  void setup() {
    container = Container();
    _$ProfileModuleInjector().configure();
  }

  static final resolve = container.resolve;






  void configure() {
    _configureProfileModules();
  }

  @Register.factory(ProfileRemoteDataSource, from: ProfileRemoteDatasourceImpl)
  @Register.factory(ProfileRepository, from: ProfileRepositoryImpl)

  void _configureProfileModules();
}

ProfileModuleInjector profileModuleInjector() => _$ProfileModuleInjector();

