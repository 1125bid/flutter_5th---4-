//1. 상태 클래스 만들기=> List<Book>

//2. 뷰모델 만들기
import 'package:flutter_book_searching_app/data/model/book.dart';
import 'package:flutter_book_searching_app/data/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends Notifier<List<Book>> {
  @override
  build() {
    return [];
  }

  final bookRepository = BookRepository();
  Future<List<Book>?> onSearch(String text) async {
    final getBooks = await bookRepository.getBooks(text);
    state = getBooks ?? [];
  }
}

//3. 뷰모델 관리자 만들기
final viewModelProvider = NotifierProvider<HomeViewModel, List<Book>>(() {
  return HomeViewModel();
});
