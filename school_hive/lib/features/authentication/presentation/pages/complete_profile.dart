// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:school_hive/features/authentication/presentation/widgets/text_button.dart';

// import '../../../../core/utils/app_colors.dart';
// import '../../../../core/utils/image_urls.dart';
// import '../widgets/circle_avatar.dart';
// import '../widgets/default_button.dart';

// class CompleteProfilePage extends StatefulWidget {
//   const CompleteProfilePage({super.key});

//   @override
//   State<CompleteProfilePage> createState() => _CompleteProfilePageState();
// }

// class _CompleteProfilePageState extends State<CompleteProfilePage> {
//   final _fullNameController = TextEditingController();
//   final _biographyController = TextEditingController();

//   var selectedItem;

//   List<DropdownMenuItem<String>> get dropdownItems {
//     List<DropdownMenuItem<String>> menuItems = [
//       const DropdownMenuItem(
//         value: 'Graduated',
//         child: Text(
//           'Graduated',
//           style: TextStyle(fontFamily: 'Poppins', color: darkGreyPrimary),
//         ),
//       ),
//       const DropdownMenuItem(
//         value: 'UnderGrad',
//         child: Text(
//           'UnderGrad',
//           style: TextStyle(fontFamily: 'Poppins', color: darkGreyPrimary),
//         ),
//       ),
//     ];

//     return menuItems;
//   }

//   @override
//   void dispose() {
//     _fullNameController.dispose();
//     _biographyController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           width: 80.w,
//           child: Column(
//             children: [
//               const Spacer(flex: 2),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     width: 200,
//                     child: Text(
//                       'Complete Profile',
//                       softWrap: true,
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                         fontSize: 24,
//                       ),
//                     ),
//                   ),
//                   CustomTextButton(
//                     onTap: () {},
//                     buttonText: 'skip',
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               Row(
//                 children: [
//                   const CustomCircleAvatar(),
//                   const Spacer(),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text(
//                         'Upload your photo',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w500,
//                           fontSize: 18,
//                           color: darkGreyPrimary,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 200,
//                         child: Text(
//                           'will be displayed to other users',
//                           softWrap: true,
//                           style: TextStyle(
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w400,
//                             fontSize: 16,
//                             color: greySecondary,
//                           ),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//               const Spacer(),
//               Row(
//                 children: [
//                   const Icon(Icons.person_outline, color: greyPrimary),
//                   const SizedBox(width: 8),
//                   SizedBox(
//                     width: 65.w,
//                     child: TextField(
//                       controller: _fullNameController,
//                       decoration: const InputDecoration(
//                         contentPadding: EdgeInsets.zero,
//                         hintText: 'Full Name',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Poppins',
//                           color: greyPrimary,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Row(
//                 children: [
//                   const ImageIcon(
//                     AssetImage(graduation),
//                   ),
//                   const SizedBox(width: 8),
//                   SizedBox(
//                     width: 65.w,
//                     child: DropdownButton(
//                       isExpanded: true,
//                       style: const TextStyle(
//                         fontFamily: 'Poppins',
//                         color: greyPrimary,
//                       ),
//                       hint: const Text(
//                         'Education Status',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           color: greyPrimary,
//                         ),
//                       ),
//                       value: selectedItem,
//                       items: dropdownItems,
//                       onChanged: (Object? value) {
//                         setState(() {
//                           selectedItem = value;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 height: 20.h,
//                 width: 75.w,
//                 child: TextField(
//                   // expands: true,
//                   keyboardType: TextInputType.multiline,
//                   maxLines: null,
//                   controller: _biographyController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: 'Biography',
//                     hintStyle: TextStyle(
//                       fontFamily: 'Poppins',
//                       color: greyPrimary,
//                     ),
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               CustomButton(
//                 onTap: () {},
//                 buttonText: 'Continue',
//                 width: 75.w,
//               ),
//               const Spacer(flex: 2),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
