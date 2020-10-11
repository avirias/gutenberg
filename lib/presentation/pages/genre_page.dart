import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutenberg/presentation/bloc/book_bloc.dart';
import 'package:gutenberg/presentation/theme/colors.dart';
import 'package:gutenberg/presentation/widgets/bottom_loader.dart';
import 'package:gutenberg/presentation/widgets/buttons/back_button.dart';
import 'package:gutenberg/presentation/widgets/book.dart';
import 'package:gutenberg/presentation/widgets/search_bar.dart';

class GenrePage extends StatefulWidget {
  final String genre;

  const GenrePage({Key key, @required this.genre}) : super(key: key);

  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  ScrollController _scrollController = ScrollController();

  BookBloc _bookBloc;

  BookFetch _bookFetch;

  @override
  void initState() {
    super.initState();
    /// Create book fetch event with the genre
    _bookFetch = BookFetch(genre: widget.genre);
    /// Adds a listener to scroll controller for pagination
    _scrollController.addListener(_onScroll);
    /// Garbing the book bloc through inherited widget and adding the event for first call
    _bookBloc = BlocProvider.of<BookBloc>(context)..add(_bookFetch);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            widget.genre,
            style: Theme.of(context).textTheme.headline2.copyWith(
              color: accentColor,
              fontSize: 28
            ),
          ),
          leading: BackButtonSvg(),
          bottom: SearchBar(),
        ),
        body: BlocConsumer<BookBloc, BookState>(
          listener: (context, state) {
            if (!state.hasReachedMax && !_isBottom) _bookBloc.add(_bookFetch);
          },
          builder: (context, state) {
            switch (state.status) {
              case BookStatus.failure:
                return Center(
                  child: Text(':( error occurred'),
                );
              case BookStatus.success:
                if (state.books.isEmpty)
                  return Center(
                    child: Text('No books found'),
                  );
                return Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: GridView.builder(
                    controller: _scrollController,
                    itemCount: state.hasReachedMax
                        ? state.books.length
                        : state.books.length + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.5,
                    ),
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(20.0),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return index >= state.books.length
                          ? BottomLoader()
                          : Book(book: state.books.elementAt(index));
                    },
                  ),
                );
              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  /// if user scroll to bottom of grid view a new event is send to fetch more books
  void _onScroll() {
    if (_isBottom) {
      _bookBloc.add(_bookFetch);
    }
  }

  /// Calculate if user scroll to the some part of grid view
  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    final delta = MediaQuery.of(context).size.height * 0.25;
    return (maxScroll - currentScroll) <= delta;
  }
}

