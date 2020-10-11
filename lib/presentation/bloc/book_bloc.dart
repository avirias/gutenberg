import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutenberg/data/repository/repository.dart';
import 'package:gutenberg/domain/entity/book.dart';
import 'package:rxdart/rxdart.dart';

part 'book_event.dart';

part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final Repository repository;

  BookBloc({@required this.repository}) : super(BookState());

  /// To transforming and handling the events and setting the debounce time for the event
  @override
  Stream<Transition<BookEvent, BookState>> transformEvents(
    Stream<BookEvent> events,
    TransitionFunction<BookEvent, BookState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 1500)),
      transitionFn,
    );
  }



  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    /// Checks if the event is SearchEnded if yes it resets the books
    /// and change isSearching to false
    if (event is SearchEnded)
      yield state.copyWith(
          status: BookStatus.initial,
          isSearching: false,
          page: 1,
          hasReachedMax: false,
          books: <Book>[]);

    /// Checks if event is SearchStarted if yes it resets the books
    /// and put the query in state, change isSearching to true
    if (event is SearchStarted)
      yield state.copyWith(
          status: BookStatus.initial,
          isSearching: true,
          query: event.query,
          page: 1,
          hasReachedMax: false,
          books: <Book>[]);

    /// Otherwise more books is fetched through the repository and mapped to state
    if (event is BookFetch) {
      yield await _mapBookToState(state,genre: event.genre);
    }
  }

  Future<BookState> _mapBookToState(
    BookState state,{String genre}
  ) async {
    /// If all pages are fetched then no network will be executed
    if (state.hasReachedMax) return state;
    try {
      if (state.status == BookStatus.initial) {

        /// Checks if isSearching is true
        /// based on the variable network is selected [getBooksByGenre or searchBook]
        final data = !state.isSearching
            ? await repository.getBooksByGenre(
                genre: genre ?? state.genre, page: state.page)
            : await repository.searchBook(
                genre: state.genre, query: state.query, page: state.page);
        return state.copyWith(
            status: BookStatus.success,
            books: data.books,
            genre: genre ?? state.genre,
            hasReachedMax: !data.hasNext,
            page: state.page + 1);
      }

      final data = !state.isSearching
          ? await repository.getBooksByGenre(
          genre: state.genre, page: state.page)
          : await repository.searchBook(
          genre: state.genre, query: state.query, page: state.page);
      /// If data has next then more call will be executed else
      /// hasReachedMax will be set to true
      return !data.hasNext
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: BookStatus.success,
              genre: state.genre,
              books: List.of(state.books)..addAll(data.books),
              page: state.page + 1,
              hasReachedMax: !data.hasNext);
    } on Exception {
      /// If error setting the status to failure
      return state.copyWith(status: BookStatus.failure);
    }
  }
}
