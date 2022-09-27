import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageInitial> {
  ImageCubit() : super(ImageInitial(image: null));

  void pickImage(ImageSource source) async {
    final result = await ImagePicker().pickImage(source: source);
    if (result == null) {
    } else {
      emit(ImageInitial(image: File(result.path)));
    }
  }

  void clearImage() async {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        emit(ImageInitial(image: null));
      },
    );
  }
}
