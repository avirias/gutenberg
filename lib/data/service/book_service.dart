import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gutenberg/data/response/book_response.dart';
import 'package:http/http.dart' as http;

final String baseUrl = "http://skunkworks.ignitesol.com:8000";

abstract class BookService {
  Future<BookResponse> getBooksByGenre({String genre, int page});

  Future<BookResponse> searchBook({String genre, String query, int page});
}

class BookServiceImpl implements BookService {
  static final BookService _instance = BookServiceImpl._internal();

  BookServiceImpl._internal();

  factory BookServiceImpl() => _instance;

  @override
  Future<BookResponse> getBooksByGenre({@required String genre, int page = 1}) {
    return http.get('$baseUrl/books?mime_type=image&topic=$genre&page=$page').then((value) {
      var response = value.body;
      var jsonResponse = jsonDecode(response);
      return BookResponse.fromJson(jsonResponse);
    }).catchError((e) => e);
  }

  @override
  Future<BookResponse> searchBook({String genre, String query, int page = 1}) {
    return http
        .get('$baseUrl/books?search=$query&topic=$genre&mime_type=image&page=$page')
        .then((value) {
      var response = value.body;
      var jsonResponse = jsonDecode(response);
      return BookResponse.fromJson(jsonResponse);
    }).catchError((e) => e);
  }
}
