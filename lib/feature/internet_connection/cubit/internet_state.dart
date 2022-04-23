part of 'internet_cubit.dart';

abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {}

class InternetDisconnected extends InternetState {}
