// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:school_hive/core/utils/app_colors.dart';

// import '../../../../core/utils/image_uploader.dart';
// import 'custom_text_buttons.dart';

// class CustomCircleAvatar extends StatefulWidget {
//   const CustomCircleAvatar({super.key});

//   @override
//   State<CustomCircleAvatar> createState() => _CustomCircleAvatarState();
// }

// class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
//   File? _image;
//   final ImageUploader imageUploader = ImageUploader();

//   void upload(ImageSource source) async {
//     File? uploadedImage = await imageUploader.getImage(source);
//     setState(() {
//       _image = uploadedImage;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(85),
//           child: Container(
//             height: 85,
//             width: 85,
//             color: lightBluePrimary,
//           ),
//         ),
//         Positioned(
//           bottom: 0,
//           right: 0,
//           child: InkWell(
//             onTap: () {
//               // chooseOption();
//             },
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Container(
//                 padding: const EdgeInsets.all(4),
//                 color: purplePrimary,
//                 child: const Icon(
//                   Icons.add,
//                   color: whitePrimary,
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   // Future chooseOption() => showDialog(
//   //       context: context,
//   //       builder: (context) {
//   //         return Dialog(
//   //           insetPadding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
//   //           elevation: 1,
//   //           alignment: Alignment.bottomCenter,
//   //           backgroundColor: Colors.white,
//   //           child: SizedBox(
//   //             height: 13.h,
//   //             child: Column(
//   //               children: [
//   //                 CustomTextButtons(
//   //                   source: ImageSource.camera,
//   //                   icon: Icons.photo_camera,
//   //                   text: 'Camera',
//   //                   context: context,
//   //                   upload: upload,
//   //                 ),
//   //                 const Divider(color: Colors.grey, height: 2),
//   //                 CustomTextButtons(
//   //                   source: ImageSource.gallery,
//   //                   icon: Icons.image,
//   //                   text: 'Gallery',
//   //                   context: context,
//   //                   upload: upload,
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //         );
//   //       },
//   //     );
// }
