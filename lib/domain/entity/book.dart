import 'package:equatable/equatable.dart';
import 'package:gutenberg/domain/entity/formats.dart';

/// Domain book class used inside views
/// Add addition properties here and map it inside the NetworkMapper
class Book extends Equatable {
  final int id;
  final String author;
  final String title;
  final String coverUrl;
  final Map<Format, String> formats;

  Book({this.id, this.author, this.title, this.coverUrl, this.formats});

  @override
  List<Object> get props => [id, title];
}
