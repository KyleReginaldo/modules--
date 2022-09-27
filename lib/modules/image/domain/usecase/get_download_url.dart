// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:msg/modules/image/domain/repository/image_repository.dart';

class GetDownloadUrl {
  final ImageRepository repo;
  GetDownloadUrl({
    required this.repo,
  });

  Future<String> call(String label, String path) async {
    return await repo.getDownloadUrl(label, path);
  }
}
