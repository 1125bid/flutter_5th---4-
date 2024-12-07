// {
//   "lastBuildDate": "Sat, 07 Dec 2024 12:59:41 +0900",
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

class Book {
  String title;
  String link;
  String image;
  String author;
  String discount;
  String publisher;
  String pubdate;
  String isbn;
  String description;

  Book({
    required this.author,
    required this.description,
    required this.discount,
    required this.image,
    required this.isbn,
    required this.link,
    required this.pubdate,
    required this.publisher,
    required this.title,
  });

  Book.fromJson(Map<String, dynamic> map)
      : this(
          title: map['title'],
          link: map['link'],
          image: map['image'],
          author: map['author'],
          discount: map['discount'],
          publisher: map['publisher'],
          pubdate: map['pubdate'],
          isbn: map['isbn'],
          description: map['description'],
        );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'link': link,
      'image': image,
      'author': author,
      'discount': discount,
      'publisher': publisher,
      'pubdate': pubdate,
      'isbn': isbn,
      'description': description,
    };
  }
}
