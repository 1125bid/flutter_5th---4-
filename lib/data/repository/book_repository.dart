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
      final jsonList = jsonDecode(response.body);
      final jsonMap = List.from(jsonList['items']);
      final iterableList = jsonMap.map((e) {
        return Book.fromJson(e);
      });
      final list = iterableList.toList();
      return list;
    }
  }
}

// {
//   "lastBuildDate": "Sat, 07 Dec 2024 07:35:50 +0900",
//   "total": 4263,
//   "start": 1,
//   "display": 10,
//   "items": [
//     {
//       "title": "Harry! (Gedichte)",
//       "link": "https://search.shopping.naver.com/book/catalog/32524001879",
//       "image": "https://shopping-phinf.pstatic.net/main_3252400/32524001879.20220522144716.jpg",
//       "author": "",
//       "discount": "21590",
//       "publisher": "Books on Demand",
//       "pubdate": "20210519",
//       "isbn": "9783753499949",
//       "description": "Liebe zieht sich wie ein roter Faden \ndurch unser Leben: \nLebens- und Liebesgedichte"
//     },