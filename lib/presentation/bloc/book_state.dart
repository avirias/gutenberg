part of 'book_bloc.dart';

enum BookStatus { initial, success, failure }

/// State for the bloc
/// BookStatus is to maintain the network call status and if it's a fist call
/// Genre is maintaining the current genre view is displaying
/// Books is the books view has to display
/// Query is search string entered by the user
/// isSearching holds the user interaction with text field
/// page is maintaining which page's data to fetch next
/// hasReachedMax to store the end of the result
class BookState extends Equatable {
  final BookStatus status;
  final String genre;
  final List<Book> books;
  final String query;
  final bool isSearching;
  final int page;
  final bool hasReachedMax;

  BookState(
      {this.status = BookStatus.initial,
      this.books = const <Book>[],
      this.genre,
      this.query = "",
      this.isSearching = false,
      this.page = 1,
      this.hasReachedMax = false});

  BookState copyWith(
      {BookStatus status,
      List<Book> books,
      bool hasReachedMax,
      String query,
      bool isSearching,
      String genre,
      int page}) {
    return BookState(
      status: status ?? this.status,
      books: books ?? this.books,
      page: page ?? this.page,
      query: query ?? this.query,
      isSearching: isSearching ?? this.isSearching,
      genre: genre ?? this.genre,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, books, hasReachedMax];
}
