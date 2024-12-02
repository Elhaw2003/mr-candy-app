import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_candy_app/features/create_account/presentation/controller/image/select_image_states.dart';

class ImageCubit extends Cubit<ImageStates>{
  ImageCubit() : super(InitialImageState());


  ImagePicker picker = ImagePicker();

  XFile? image;
  String?base64Image;
  getPhoto(ImageSource imageSource,context) async {
    image = await picker.pickImage(source: imageSource);
    if (image != null) {
      File imageFile =  File(image!.path);
      List<int> imageBytes = imageFile.readAsBytesSync();
       base64Image = base64Encode(imageBytes);
      // Close the bottom sheet
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
      emit(SelectImageState());
    }
  }


}