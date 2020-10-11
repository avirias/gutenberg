part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/// Event to fetch books
class BookFetch extends BookEvent {
  final String genre;


  BookFetch({this.genre});
}

/// Event to start the search
/// This event is executed when submit button in the text field is pressed
/// It sets isSearching to true, flushes the book and sets BookStatus to initial
class SearchStarted extends BookEvent {

  final String query;

  SearchStarted(this.query);

}
/// Event to end the search
/// This event is executed when cross button in the text field is pressed
/// It ends the search event and set isSearching to false
class SearchEnded extends BookEvent {}