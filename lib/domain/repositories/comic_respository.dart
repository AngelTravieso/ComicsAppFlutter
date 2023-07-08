import 'dart:io';

import 'package:comics_app/domain/model/models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

/// Class [ComicRepository]
class ComicRepository {
  final _baseUrl = dotenv.env['BASE_URL'];
  final _dio = Dio();
  final httpTimeout = const Duration(seconds: 20);

  /// Gets a list of comics from an external API.
  /// Returns an instance of [ComicModel] containing the comics data, or null if an error occurs.
  Future<ComicModel?> getComics() async {
    try {
      final response = await _dio.get('${_baseUrl!}/issues',
          options: Options(
            receiveTimeout: httpTimeout,
            sendTimeout: httpTimeout,
          ),
          queryParameters: {
            'api_key': dotenv.env['API_KEY'],
            'format': 'json',
          });

      if (response.statusCode == HttpStatus.ok) {
        return ComicModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (err) {
      throw Exception('Error getting comics: $err');
    }
  }

  /// Get comic detail
  /// Returns an instance of [ComicDetail] containing the comics data, or null if an error occurs.
  Future<ComicDetail?> getComicDetail({required String endpoint}) async {
    try {
      final response = await _dio.get(endpoint,
          options: Options(
            receiveTimeout: httpTimeout,
            sendTimeout: httpTimeout,
          ),
          queryParameters: {
            'api_key': dotenv.env['API_KEY'],
            'format': 'json',
          });

      if (response.statusCode == HttpStatus.ok) {
        return ComicDetail.fromJson(response.data);
      } else {
        return null;
      }
    } catch (err) {
      throw Exception('Error getting comic detail: $err');
    }
  }
}
