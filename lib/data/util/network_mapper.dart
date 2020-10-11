import 'package:gutenberg/data/response/book_response.dart';
import 'package:gutenberg/data/util/string_util.dart';
import 'package:gutenberg/domain/entity/book.dart';
import 'package:gutenberg/domain/entity/formats.dart';
import 'package:gutenberg/domain/utils/mapper.dart';

class NetworkMapper implements Mapper<Book, BookResult> {
  static final Mapper _instance = NetworkMapper._internal();

  factory NetworkMapper() => _instance;

  NetworkMapper._internal();

  @override
  BookResult mapEntityToModel(Book entity) {
    throw UnimplementedError();
  }

  @override
  Book mapModelToEntity(BookResult model) {
    Map toJson = model.formats.toJson();
    toJson.removeWhere((key, value) => value == null);

    return Book(
        id: model.id,
        author: model.authors.isNotEmpty
            ? getName(model.authors.first.name)
            : "Not Available",
        title: model.title,
        coverUrl: model.formats.imageJpeg,
        formats: {
          Format.PDF: getFormat(toJson, "pdf"),
          Format.HTML: getFormat(toJson, "htm"),
          Format.ZIP: getFormat(toJson, "zip"),
          Format.TXT: getFormat(toJson, "txt")
        });
  }

  String getFormat(Map<String, String> format, String type1) {
    try {
      String value = format.values.firstWhere(
          (element) => element.endsWith(type1));
      return value;
    } catch (e) {
      return null;
    }
  }
}
