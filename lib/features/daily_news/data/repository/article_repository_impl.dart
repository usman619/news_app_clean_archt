import 'package:news_app_clean_archt/core/resources/data_state.dart';
import 'package:news_app_clean_archt/features/daily_news/data/models/article.dart';
import 'package:news_app_clean_archt/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }
}
