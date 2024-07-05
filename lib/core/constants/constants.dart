import 'package:flutter_dotenv/flutter_dotenv.dart';

const String newsApiBaseUrl = 'https://newsapi.org/v2/';
String? newsAPIKey = dotenv.env["APIKey"];
const String countryQuery = 'us';
const String categoryQuery = 'general';
