import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gutenberg/data/repository/repository.dart';
import 'package:gutenberg/presentation/bloc/book_bloc.dart';
import 'package:gutenberg/presentation/pages/genre_page.dart';
import 'package:gutenberg/presentation/widgets/buttons/next_button.dart';

class GenreCard extends StatelessWidget {
  final String assetName;
  final String genreName;

  const GenreCard({Key key, @required this.assetName, @required this.genreName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(211, 209, 238, 0.5),
              offset: Offset(0, 2),
              blurRadius: 5,
              spreadRadius: 0),
        ], borderRadius: BorderRadius.circular(4), color: Colors.white),
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          highlightColor: Theme.of(context).accentColor.withOpacity(0.1),
          splashColor: Theme.of(context).accentColor.withOpacity(0.25),
          padding: EdgeInsets.only(left: 10, right: 10),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) => BookBloc(repository: RepositoryImpl()),
                    child: GenrePage(
                      genre: genreName,
                    ))));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    assetName,
                    width: 25,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    genreName.toUpperCase(),
                    style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Colors.black.withOpacity(0.7)
                    )
                  )
                ],
              ),
              NextButton()
            ],
          ),
        ),
      ),
    );
  }
}
