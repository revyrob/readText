// import 'package:file_picker/file_picker.dart';

// Future<String> pickDocument() async {
//   try {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['.pdf'],
//       allowCompression: true,
//     );

//     if (result != null) {
//       final String? file = result.files.single.path;
//       if (file != null) {
//         return file;
//       } else {
//         return Future.error('File path is null');
//       }
//     } else {
//       return '';
//     }
//   } catch (e) {
//     return Future.error(e);
//   }
// }
