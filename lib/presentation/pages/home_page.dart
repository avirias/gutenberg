import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gutenberg/domain/utils/strings.dart';
import 'package:gutenberg/presentation/widgets/genre_card.dart';
import 'package:gutenberg/presentation/widgets/genre_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3,
                    child: SvgPicture.asset(
                      "assets/svgs/Pattern.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 50, right: 20, bottom: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          projectTitle,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          subHeading,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  children: genres.keys
                      .map((e) => GenreCard(assetName: genres[e], genreName: e))
                      .toList(),
                ),
              )
            ]),
      ),
    );
  }
}
