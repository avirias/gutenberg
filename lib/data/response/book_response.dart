class BookResponse {
  BookResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int count;
  String next;
  String previous;
  List<BookResult> results;

  factory BookResponse.fromJson(Map<String, dynamic> json) => BookResponse(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<BookResult>.from(json["results"].map((x) => BookResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class BookResult {
  BookResult({
    this.id,
    this.authors,
    this.bookshelves,
    this.downloadCount,
    this.formats,
    this.languages,
    this.mediaType,
    this.subjects,
    this.title,
  });

  int id;
  List<Author> authors;
  List<String> bookshelves;
  int downloadCount;
  Formats formats;
  List<Language> languages;
  MediaType mediaType;
  List<String> subjects;
  String title;

  factory BookResult.fromJson(Map<String, dynamic> json) => BookResult(
    id: json["id"],
    authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
    bookshelves: List<String>.from(json["bookshelves"].map((x) => x)),
    downloadCount: json["download_count"],
    formats: Formats.fromJson(json["formats"]),
    languages: List<Language>.from(json["languages"].map((x) => languageValues.map[x])),
    mediaType: mediaTypeValues.map[json["media_type"]],
    subjects: List<String>.from(json["subjects"].map((x) => x)),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
    "bookshelves": List<dynamic>.from(bookshelves.map((x) => x)),
    "download_count": downloadCount,
    "formats": formats.toJson(),
    "languages": List<dynamic>.from(languages.map((x) => languageValues.reverse[x])),
    "media_type": mediaTypeValues.reverse[mediaType],
    "subjects": List<dynamic>.from(subjects.map((x) => x)),
    "title": title,
  };
}

class Author {
  Author({
    this.birthYear,
    this.deathYear,
    this.name,
  });

  int birthYear;
  int deathYear;
  String name;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    birthYear: json["birth_year"] == null ? null : json["birth_year"],
    deathYear: json["death_year"] == null ? null : json["death_year"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "birth_year": birthYear == null ? null : birthYear,
    "death_year": deathYear == null ? null : deathYear,
    "name": name,
  };
}

class Formats {
  Formats({
    this.applicationXMobipocketEbook,
    this.applicationPdf,
    this.textPlainCharsetUsAscii,
    this.textPlainCharsetUtf8,
    this.applicationRdfXml,
    this.applicationZip,
    this.applicationEpubZip,
    this.textHtmlCharsetUtf8,
    this.textPlainCharsetIso88591,
    this.imageJpeg,
    this.textPlain,
    this.textHtmlCharsetUsAscii,
    this.textHtml,
    this.textRtf,
    this.textHtmlCharsetIso88591,
    this.applicationPrsTex,
  });

  String applicationXMobipocketEbook;
  String applicationPdf;
  String textPlainCharsetUsAscii;
  String textPlainCharsetUtf8;
  String applicationRdfXml;
  String applicationZip;
  String applicationEpubZip;
  String textHtmlCharsetUtf8;
  String textPlainCharsetIso88591;
  String imageJpeg;
  String textPlain;
  String textHtmlCharsetUsAscii;
  String textHtml;
  String textRtf;
  String textHtmlCharsetIso88591;
  String applicationPrsTex;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
    applicationXMobipocketEbook: json["application/x-mobipocket-ebook"] == null ? null : json["application/x-mobipocket-ebook"],
    applicationPdf: json["application/pdf"] == null ? null : json["application/pdf"],
    textPlainCharsetUsAscii: json["text/plain; charset=us-ascii"] == null ? null : json["text/plain; charset=us-ascii"],
    textPlainCharsetUtf8: json["text/plain; charset=utf-8"] == null ? null : json["text/plain; charset=utf-8"],
    applicationRdfXml: json["application/rdf+xml"],
    applicationZip: json["application/zip"] == null ? null : json["application/zip"],
    applicationEpubZip: json["application/epub+zip"] == null ? null : json["application/epub+zip"],
    textHtmlCharsetUtf8: json["text/html; charset=utf-8"] == null ? null : json["text/html; charset=utf-8"],
    textPlainCharsetIso88591: json["text/plain; charset=iso-8859-1"] == null ? null : json["text/plain; charset=iso-8859-1"],
    imageJpeg: json["image/jpeg"] == null ? null : json["image/jpeg"],
    textPlain: json["text/plain"] == null ? null : json["text/plain"],
    textHtmlCharsetUsAscii: json["text/html; charset=us-ascii"] == null ? null : json["text/html; charset=us-ascii"],
    textHtml: json["text/html"] == null ? null : json["text/html"],
    textRtf: json["text/rtf"] == null ? null : json["text/rtf"],
    textHtmlCharsetIso88591: json["text/html; charset=iso-8859-1"] == null ? null : json["text/html; charset=iso-8859-1"],
    applicationPrsTex: json["application/prs.tex"] == null ? null : json["application/prs.tex"],
  );

  Map<String, String> toJson() => {
    "application/x-mobipocket-ebook": applicationXMobipocketEbook == null ? null : applicationXMobipocketEbook,
    "application/pdf": applicationPdf == null ? null : applicationPdf,
    "text/plain; charset=us-ascii": textPlainCharsetUsAscii == null ? null : textPlainCharsetUsAscii,
    "text/plain; charset=utf-8": textPlainCharsetUtf8 == null ? null : textPlainCharsetUtf8,
    "application/rdf+xml": applicationRdfXml,
    "application/zip": applicationZip == null ? null : applicationZip,
    "application/epub+zip": applicationEpubZip == null ? null : applicationEpubZip,
    "text/html; charset=utf-8": textHtmlCharsetUtf8 == null ? null : textHtmlCharsetUtf8,
    "text/plain; charset=iso-8859-1": textPlainCharsetIso88591 == null ? null : textPlainCharsetIso88591,
    "image/jpeg": imageJpeg == null ? null : imageJpeg,
    "text/plain": textPlain == null ? null : textPlain,
    "text/html; charset=us-ascii": textHtmlCharsetUsAscii == null ? null : textHtmlCharsetUsAscii,
    "text/html": textHtml == null ? null : textHtml,
    "text/rtf": textRtf == null ? null : textRtf,
    "text/html; charset=iso-8859-1": textHtmlCharsetIso88591 == null ? null : textHtmlCharsetIso88591,
    "application/prs.tex": applicationPrsTex == null ? null : applicationPrsTex,
  };
}

enum Language { EN, ES }

final languageValues = EnumValues({
  "en": Language.EN,
  "es": Language.ES
});

enum MediaType { TEXT }

final mediaTypeValues = EnumValues({
  "Text": MediaType.TEXT
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
