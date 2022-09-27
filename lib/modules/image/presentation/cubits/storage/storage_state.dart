part of 'storage_cubit.dart';

abstract class StorageState {}

class StorageInitial extends StorageState {}

class StorageLoading extends StorageState {}

class StorageSuccessful extends StorageState {}
