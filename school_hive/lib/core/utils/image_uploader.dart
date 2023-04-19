// import 'dart:io';

// import 'package:flutter/services.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// class ImageUploader {
//   Future<File?> getImage(ImageSource source,
//       [bool defaultAspectRatio = true]) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return null;
//       final imageTemp = File(image.path);
//       final croppedImage = await _cropImage(
//         imageFile: imageTemp,
//         defaultAspectRatio: defaultAspectRatio,
//       );
//       return croppedImage;
//     } on PlatformException {
//       print('platform dependent error eccured while taking picture');
//       return null;
//     }
//   }

//   // this is for image cropper
//   Future<File?> _cropImage(
//       {required File imageFile, bool? defaultAspectRatio}) async {
//     CroppedFile? croppedImage = await ImageCropper().cropImage(
//       compressFormat: ImageCompressFormat.png,
//       sourcePath: imageFile.path,
//       aspectRatio: defaultAspectRatio!
//           ? const CropAspectRatio(
//               ratioX: 1100,
//               ratioY: 650,
//             )
//           : null,
//     );
//     if (croppedImage == null) return null;
//     return File(croppedImage.path);
//   }
// }