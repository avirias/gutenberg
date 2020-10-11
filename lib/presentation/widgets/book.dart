import 'package:flutter/material.dart';
import 'package:gutenberg/domain/entity/book.dart' as model;
import 'package:gutenberg/domain/entity/formats.dart';
import 'package:gutenberg/presentation/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

/// Book card
class Book extends StatefulWidget {
  final model.Book book;

  const Book({Key key, @required this.book}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 114,
      child: InkWell(
        onTap: _bookTapped,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 5,
                    spreadRadius: 0,
                    color: Color.fromRGBO(211, 209, 238, 0.5)),
              ], borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.book.coverUrl,
                  height: 150,
                  width: 114,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.book.title.toUpperCase(),
              style: Theme.of(context).textTheme.headline6,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.book.author,
              style: Theme.of(context).textTheme.caption,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  /// Launch a given url
  Future launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _bookTapped() {
    /// Opening the url based on the priority
    /// i.e. HTML > PDF > TXT

    if (widget.book.formats[Format.HTML] != null)
      launch(widget.book.formats[Format.HTML]);
    else if (widget.book.formats[Format.PDF] != null)
      launch(widget.book.formats[Format.PDF]);
    else if (widget.book.formats[Format.TXT] != null)
      launch(widget.book.formats[Format.TXT]);
    // TODO: Work on zip file case
    // else if (widget.book.formats[Format.ZIP] != null)
    //   _downloadAndShow(widget.book.formats[Format.ZIP]);
    else
      _showNotAvailableDialog();
  }

  _showNotAvailableDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Not Available",
                style: Theme.of(context).textTheme.headline3,
              ),
              content: Text(
                "${widget.book.title} is not available in html/pdf/txt format",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: darkGrey,
                  fontWeight: FontWeight.w500
                ),
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("okay".toUpperCase(),
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: accentColor
                      ),))
              ],
            ));
  }

  void _downloadAndShow(String zipUrl) {
    print("here");
  }
}
