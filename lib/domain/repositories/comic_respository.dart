import 'dart:io';

import 'package:comics_app/domain/model/comic_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

class ComicRepository {
  final _url = dotenv.env['BASE_URL'];
  final _dio = Dio();
  final httpTimeout = const Duration(seconds: 20);

  Future<ComicModel?> getComics() async {
    try {
      final response = await _dio.get('${_url!}/issues',
          options: Options(
            receiveTimeout: httpTimeout,
            sendTimeout: httpTimeout,
          ),
          queryParameters: {
            'api_key': dotenv.env['API_KEY'],
            'format': 'json',
          });

      if (response.statusCode == HttpStatus.ok) {
        final comicsData = ComicModel.fromJson(response.data);
        return comicsData;
      } else {
        return null;
      }
    } catch (err) {
      throw Exception('Error getting comics: $err');
    }
  }
}
