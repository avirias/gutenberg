import 'package:gutenberg/presentation/widgets/genre_card.dart';


/// Map to maintain assets[Genres] along with the Genre name
/// Add more genres here along with their asset path
Map<String, String> genres = {
  "Adventure": "assets/svgs/Adventure.svg",
  "Drama": "assets/svgs/Drama.svg",
  "Fiction": "assets/svgs/Fiction.svg",
  "History": "assets/svgs/History.svg",
  "Humour": "assets/svgs/Humour.svg",
  "Philosophy": "assets/svgs/Philosophy.svg",
  "Politics": "assets/svgs/Politics.svg",
};

List<GenreCard> genresList() {
  return genres.keys
      .map((e) => GenreCard(assetName: genres[e], genreName: e))
      .toList();
}
