//0. flutter pub add flutter_riverpod

//1. 상태 클래스 만들기 List<Book>

//2. 뷰모델 만들기
import 'package:flutter_book_searching_app/data/model/book.dart';
import 'package:flutter_book_searching_app/data/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends Notifier<List<Book>> {
  @override
  build() {
    return [];
  }

  final bookRepository = BookRepository(); //getBooks 사용을 위해 객체를 만들어 변수에 담음

//뷰에서 호출할 함수를 정의.
//
//상태를 업데이트 시켜주는 함수를 만든다.
//
  Future<List<Book>?> onSearch(String text) async {
    final getBooks =
        await bookRepository.getBooks(text); //변수에 담긴 getBooks 를 사용.(객체에 담아서)
    state = getBooks ?? []; //새로운 값(레포지터리에서 갖고온)을 상태에 넣어줌 "state"!!
  }
}

//3. 뷰모델 관리자(providerNotifier)만들기
final homeViewModelProvider = NotifierProvider<HomeViewModel, List<Book>>(() {
  return HomeViewModel();
});//파라미터가 함수-사용할때 만들기 위함.(호출되는 시점에 만들기 위해서)
