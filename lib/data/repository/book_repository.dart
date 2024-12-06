import 'dart:convert';

import 'package:flutter_book_searching_app/data/model/book.dart';
import 'package:http/http.dart';

class BookRepository {
  Future<List<Book>?> getBooks(String text) async {
    final client = Client();
    final response = await client.get(
      Uri.parse('https://openapi.naver.com/v1/search/book.json?query=$text'),
      headers: {
        'X-Naver-Client-Id': 'ZfPUv5ok3t5mFHGH0FBS',
        'X-Naver-Client-Secret': 'Fo1vWkIW4q'
      },
    );
    if (response.statusCode == 200) {
      final jsonCode = jsonDecode(response.body);

      final jsonList = List.from(jsonCode['items']);
      final iterableList = jsonList.map((e) {
        return Book.fromJson(e);
      });
      final list = iterableList.toList();
      return list;
    }
  }
}
