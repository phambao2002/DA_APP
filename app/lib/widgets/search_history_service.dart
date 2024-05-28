// import 'dart:io';
// import 'package:path_provider/path_provider.dart';

// class SearchHistoryService {
//   Future<String> _getLocalPath() async {
//     final directory = await getApplicationDocumentsDirectory();
//     return directory.path;
//   }

//   Future<File> _getFile() async {
//     final path = await _getLocalPath();
//     return File('$path/search_history.txt');
//   }

//   Future<void> writeSearchHistory(List<String> history) async {
//     final file = await _getFile();
//     String content = history.join('\n');
//     await file.writeAsString(content);
//   }

//   Future<List<String>> readSearchHistory() async {
//     try {
//       final file = await _getFile();
//       String content = await file.readAsString();
//       return content.split('\n').where((item) => item.isNotEmpty).toList();
//     } catch (e) {
//       // Nếu file không tồn tại hoặc có lỗi khi đọc file, trả về danh sách rỗng
//       return [];
//     }
//   }
// }
