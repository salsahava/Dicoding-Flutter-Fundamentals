import 'package:news_app/data/model/article.dart';

class ArticlesResult {
  ArticlesResult({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory ArticlesResult.fromJson(Map<String, dynamic> json) => ArticlesResult(
        status: json['status'],
        totalResults: json['totalResults'],
        articles: List<Article>.from((json['articles'] as List)
            .map((x) => Article.fromJson(x))
            .where((article) =>
                article.author != null &&
                article.urlToImage != null &&
                article.publishedAt != null &&
                article.content != null)),
      );
}
