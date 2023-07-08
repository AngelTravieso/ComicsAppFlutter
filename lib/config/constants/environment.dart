import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String apiBaseUrl = dotenv.env['BASE_URL']!;
  static String apiKey = dotenv.env['API_KEY'] ?? 'no api key';
}
