import 'package:gutenberg/data/response/book_response.dart';
import 'package:gutenberg/data/service/book_service.dart';
import 'package:gutenberg/data/util/network_mapper.dart';
import 'package:gutenberg/domain/entity/book.dart';
import 'package:gutenberg/domain/entity/book_data.dart';
import 'package:gutenberg/domain/utils/mapper.dart';

abstract class Repository {
  Future<BookData> getBooksByGenre({String genre, int page});

  Future<BookData> searchBook({String genre, String query, int page});
}

class RepositoryImpl implements Repository {
  static final Repository _instance = RepositoryImpl._internal();

  factory RepositoryImpl() => _instance;

  RepositoryImpl._internal();

  final BookService _bookService = BookServiceImpl();
  final Mapper<Book, BookResult> _networkMapper = NetworkMapper();

  @override
  Future<BookData> getBooksByGenre({String genre, int page}) {
    return _bookService.getBooksByGenre(genre: genre, page: page).then((value) {
      final bookData = BookData(
          hasNext: value.next != null,
          hasPrevious: value.previous != null,
          books: value.results
              .map((e) => _networkMapper.mapModelToEntity(e))
              .where((element) => element.coverUrl != null)
              .toList(),
          count: value.count);
      return bookData;
    }).catchError((e) => e);
  }

  @override
  Future<BookData> searchBook({String genre, String query, int page}) {
    return _bookService
        .searchBook(genre: genre, query: query, page: page)
        .then((value) {
      return BookData(
          hasNext: value.next != null,
          hasPrevious: value.previous != null,
          books: value.results
              .map((e) => _networkMapper.mapModelToEntity(e))
              .where((element) => element.coverUrl != null)
              .toList(),
          count: value.count);
    }).catchError((e) => e);
  }
}
