import 'package:gutenberg/data/response/book_response.dart';
import 'package:gutenberg/domain/entity/book.dart';

/// Main result[BookResponse] mapped to this[BookData] to remove unwanted data
class BookData {
  final bool hasPrevious;
  final bool hasNext;
  final int count;
  final List<Book> books;

  BookData({this.hasPrevious, this.hasNext, this.count, this.books});
}
