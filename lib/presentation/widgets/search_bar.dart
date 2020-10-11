import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gutenberg/presentation/bloc/book_bloc.dart';
import 'package:gutenberg/presentation/theme/colors.dart';
import 'package:gutenberg/presentation/widgets/buttons/cancel_button.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _SearchBarState createState() => _SearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(65);
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _controller = TextEditingController();
  BookBloc _bookBloc;
  String _text;

  @override
  void initState() {
    super.initState();
    _bookBloc = BlocProvider.of<BookBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, right: 18, left: 18, top: 10),
      child: Container(
        height: 44,
        child: TextField(
          maxLines: 1,
          autocorrect: false,
          expands: false,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
            color: darkGrey
          ),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 22),
              fillColor: lightGrey,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4)),
              isDense: true,
              hintText: "Search",
              filled: true,
              hintStyle: Theme.of(context).textTheme.bodyText2,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).accentColor),
                  borderRadius: BorderRadius.circular(4)),
              suffixIcon: _text != null && _text.isNotEmpty
                  ? CancelButton(
                      onPressed: _cancelButtonPressed,
                    )
                  : Container(
                      height: 0,
                      width: 0,
                    ),
              prefixIcon: SvgPicture.asset(
                "assets/svgs/Search.svg",
                fit: BoxFit.scaleDown,
              )),
          controller: _controller,
          textInputAction: TextInputAction.done,
          onSubmitted: _submitted,
          onChanged: (val) {
            setState(() {
              _text = val;
            });
          },
        ),
      ),
    );
  }

  void _submitted(String value) {
    /// Sending the event to flush the book list and also change book status to initial
    _bookBloc.add(SearchStarted(value));
  }

  void _cancelButtonPressed() {
    /// Sending event to set isSearching to false
    /// And to fetch books with genres only
    _bookBloc.add(SearchEnded());
    setState(() {
      _text = null;
      _controller.text = "";
    });
  }
}
