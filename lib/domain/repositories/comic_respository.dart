import 'dart:io';

import 'package:comics_app/config/constants/environment.dart';
import 'package:comics_app/domain/model/models.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Class [ComicRepository]
class ComicRepository {
  final _dio = Dio();
  final httpTimeout = const Duration(seconds: 60);

  /// Gets a list of comics from an external API.
  /// Returns an instance of [ComicModel] containing the comics data, or null if an error occurs.
  Future<ComicModel?> getComics() async {
    try {
      final response = await _dio.get('${Environment.apiBaseUrl}/issues',
          options: Options(
            receiveTimeout: httpTimeout,
            sendTimeout: httpTimeout,
          ),
          queryParameters: {
            'api_key': Environment.apiKey,
            'format': 'json',
          });

      if (response.statusCode == HttpStatus.ok) {
        return ComicModel.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (err) {
      if (kDebugMode) {
        print(err.error);
        print(err.message);
        print(err.stackTrace);
      }

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
            'api_key': Environment.apiKey,
            'format': 'json',
          });

      if (response.statusCode == HttpStatus.ok) {
        return ComicDetail.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (err) {
      if (kDebugMode) {
        print(err.error);
        print(err.message);
        print(err.stackTrace);
      }

      throw Exception('Error getting comic detail: $err');
    }
  }
}
