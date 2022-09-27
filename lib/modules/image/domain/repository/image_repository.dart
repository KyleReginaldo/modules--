import 'dart:io';

abstract class ImageRepository {
  Future<void> uploadImageToStorage(String label, File file);
  Future<String> getDownloadUrl(String label, String path);
}
