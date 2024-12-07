import 'dart:convert';

import 'package:flutter_book_searching_app/data/model/book.dart';
import 'package:http/http.dart';

class BookRepository {
  final client = Client();
  Future<List<Book>?> getBooks(String text) async {
    final response = await client.get(
        Uri.parse('https://openapi.naver.com/v1/search/book.json?query=$text'),
        headers: {
          'X-Naver-Client-Id': 'ZfPUv5ok3t5mFHGH0FBS',
          'X-Naver-Client-Secret': 'Fo1vWkIW4q',
        });
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      final jsonList = List.from(decodedJson["items"]);
      final jsonMap = jsonList.map((e) {
        return Book.fromJson(e);
      });
      final list = jsonMap.toList();
      return list;
    }
  }
}
