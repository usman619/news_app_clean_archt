import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_clean_archt/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;
  const RemoteArticlesState({this.articles, this.error});

  @override
  List<Object?> get props => [articles!, error!];
}

//Loading State
class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

//Data Received State
class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone(List<ArticleEntity> article)
      : super(articles: article);
}

//Error State
class RemoteArticlesError extends RemoteArticlesState {
  const RemoteArticlesError(DioException error) : super(error: error);
}
