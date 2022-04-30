part of 'network_cubit.dart';

abstract class NetworkState {}

class NetworkLoading extends NetworkState {}

class NetworkConnected extends NetworkState {}

class NetworkDisconnected extends NetworkState {}
