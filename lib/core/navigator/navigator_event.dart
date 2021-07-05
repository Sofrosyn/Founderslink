import 'package:meta/meta.dart';

@immutable
abstract class NavigatorEvent {}

class Pop extends NavigatorEvent{}
