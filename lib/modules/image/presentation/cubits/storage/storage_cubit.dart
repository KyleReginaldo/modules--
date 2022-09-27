// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:msg/modules/image/domain/usecase/get_download_url.dart';
import 'package:msg/modules/image/domain/usecase/upload_image_to_storage.dart';

part 'storage_state.dart';

class StorageCubit extends Cubit<StorageState> {
  StorageCubit(
    this.getUrl,
    this.upload,
  ) : super(StorageInitial());

  final GetDownloadUrl getUrl;
  final UploadImageToStorage upload;

  void uploadImageToStorage(String label, File file) async {
    emit(StorageLoading());
    await upload(label, file).then((value) {
      emit(StorageSuccessful());
    });
  }
}
