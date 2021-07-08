
import 'package:flutter/material.dart';
import 'package:founderslink/core/di/authentication_module/authentication_module_injector.dart';
import 'package:founderslink/core/di/network_module/network_module_injector.dart';



void configureDependencies(){
networkModuleInjector().setup();
authenticationModuleInjector().setup();

}