// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:msg/modules/image/domain/repository/image_repository.dart';

class UploadImageToStorage {
  final ImageRepository repo;
  UploadImageToStorage({
    required this.repo,
  });

  Future<void> call(String label, File file) async {
    await repo.uploadImageToStorage(label, file);
  }
}
