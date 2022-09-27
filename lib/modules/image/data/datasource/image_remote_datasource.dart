import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:msg/modules/image/data/datasource/remote_data_source.dart';

class ImageRemoteDataSourceImpl implements ImageRemoteDataSource {
  final storage = FirebaseStorage.instance;
  @override
  Future<String> getDownloadUrl(String label, String path) async {
    String downloadUrl = await storage.ref('$label/$path').getDownloadURL();
    print('downloadUrl: $downloadUrl');
    return downloadUrl;
  }

  @override
  Future<void> uploadImageToStorage(String label, File file) async {
    await storage.ref('$label/${file.path}').putFile(file);
  }
}
