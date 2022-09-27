// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:msg/modules/image/data/datasource/remote_data_source.dart';
import 'package:msg/modules/image/domain/repository/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageRemoteDataSource imageRemote;
  ImageRepositoryImpl({
    required this.imageRemote,
  });
  @override
  Future<String> getDownloadUrl(String label, String path) async {
    try {
      return await imageRemote.getDownloadUrl(label, path);
    } catch (e) {
      return 'ERROR OCCURED:: $e';
    }
  }

  @override
  Future<void> uploadImageToStorage(String label, File file) async {
    try {
      await imageRemote.uploadImageToStorage(label, file);
    } catch (e) {
      print('ERROR OCCURED:: $e');
    }
  }
}
