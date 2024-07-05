import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_clean_archt/core/constants/constants.dart';
import 'package:news_app_clean_archt/core/resources/data_state.dart';
import 'package:news_app_clean_archt/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_clean_archt/features/daily_news/data/models/article.dart';
import 'package:news_app_clean_archt/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpReponse = await _newsApiService.getNewsArticles(
        // apiKey: Platform.environment['NEWS_API_KEY'],
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data);
      } else {
        return DataFailed(DioException(
          error: httpReponse.response.statusMessage,
          response: httpReponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpReponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
