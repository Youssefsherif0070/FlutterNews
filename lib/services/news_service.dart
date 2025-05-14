import 'package:dio/dio.dart';
import 'package:tap_news/models/articel_model.dart';

main() {}

class NewsService {
  final dio = Dio();

  Future<List<ArticleModel>> topHeadlines() async {
    try {
      var response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=b2c477ef973e48739375006d4a220bd9",
      );

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        articlesList.add(
          ArticleModel(
            name: article["source"]["name"],
            title: article["title"],
            urlToImage: article["urlToImage"] ?? 'There is no image',
          ),
        );
      }
      return articlesList;
    } catch (e) {
      print("❌ Error fetching top headlines: $e");
      return [];
    }
  }

  Future<List<ArticleModel>> scienceNews() async {
    try {
      var response = await dio.get(
        "https://newsapi.org/v2/top-headlines?category=science&apiKey=b2c477ef973e48739375006d4a220bd9",
      );

      Map<String, dynamic> data = response.data;
      List<dynamic> articles = data["articles"];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        articlesList.add(
          ArticleModel(
            name: article["source"]["name"],
            title: article["title"],
            urlToImage: article["urlToImage"] ?? 'There is no image',
          ),
        );
      }
      return articlesList;
    } catch (e) {
      print("❌ Error fetching top headlines: $e");
      return [];
    }
  }

  Future<List<ArticleModel>> healthNews() async {
    try {
      var response = await dio.get(
        "https://newsapi.org/v2/top-headlines?category=health&apiKey=b2c477ef973e48739375006d4a220bd9",
      );

      Map<String, dynamic> data = response.data;
      List<dynamic> articles = data["articles"];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        articlesList.add(
          ArticleModel(
            name: article["source"]["name"],
            title: article["title"],
            urlToImage: article["urlToImage"] ?? 'There is no image',
          ),
        );
      }
      return articlesList;
    } catch (e) {
      print("❌ Error fetching top headlines: $e");
      return [];
    }
  }

  Future<List<ArticleModel>> entertainmentNews() async {
    try {
      var response = await dio.get(
        "https://newsapi.org/v2/top-headlines?category=entertainment&apiKey=b2c477ef973e48739375006d4a220bd9",
      );

      Map<String, dynamic> data = response.data;
      List<dynamic> articles = data["articles"];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        articlesList.add(
          ArticleModel(
            name: article["source"]["name"],
            title: article["title"],
            urlToImage: article["urlToImage"] ?? 'There is no image',
          ),
        );
      }
      return articlesList;
    } catch (e) {
      print("❌ Error fetching top headlines: $e");
      return [];
    }
  }

  Future<List<ArticleModel>> lifeStyleNews() async {
    try {
      var response = await dio.get(
        "https://newsapi.org/v2/top-headlines?category=general&apiKey=b2c477ef973e48739375006d4a220bd9",
      );

      Map<String, dynamic> data = response.data;
      List<dynamic> articles = data["articles"];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        articlesList.add(
          ArticleModel(
            name: article["source"]["name"],
            title: article["title"],
            urlToImage: article["urlToImage"] ?? 'There is no image',
          ),
        );
      }
      return articlesList;
    } catch (e) {
      print("❌ Error fetching top headlines: $e");
      return [];
    }
  }

  Future<List<ArticleModel>> cryptoNews() async {
    try {
      var response = await dio.get(
        "https://newsapi.org/v2/top-headlines?q=crypto&apiKey=b2c477ef973e48739375006d4a220bd9",
      );

      Map<String, dynamic> data = response.data;
      List<dynamic> articles = data["articles"];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        articlesList.add(
          ArticleModel(
            name: article["source"]["name"],
            title: article["title"],
            urlToImage: article["urlToImage"] ?? 'There is no image',
          ),
        );
      }
      return articlesList;
    } catch (e) {
      print("❌ Error fetching top headlines: $e");
      return [];
    }
  }

  Future<List<ArticleModel>> politicsNews() async {
    try {
      var response = await dio.get(
        "https://newsapi.org/v2/top-headlines?category=politics&apiKey=b2c477ef973e48739375006d4a220bd9",
      );

      Map<String, dynamic> data = response.data;
      List<dynamic> articles = data["articles"];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        articlesList.add(
          ArticleModel(
            name: article["source"]["name"],
            title: article["title"],
            urlToImage: article["urlToImage"] ?? 'There is no image',
          ),
        );
      }
      return articlesList;
    } catch (e) {
      print("❌ Error fetching top headlines: $e");
      return [];
    }
  }

  Future<List<ArticleModel>> gamingNews() async {
    try {
      var response = await dio.get(
        "https://newsapi.org/v2/top-headlines?category=gaming&apiKey=b2c477ef973e48739375006d4a220bd9",
      );

      Map<String, dynamic> data = response.data;
      List<dynamic> articles = data["articles"];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        articlesList.add(
          ArticleModel(
            name: article["source"]["name"],
            title: article["title"],
            urlToImage: article["urlToImage"] ?? 'There is no image',
          ),
        );
      }
      return articlesList;
    } catch (e) {
      print("❌ Error fetching top headlines: $e");
      return [];
    }
  }

  Future<List<ArticleModel>> sportsNews() async {
    try {
      var response = await dio.get(
        "https://newsapi.org/v2/top-headlines?category=sports&apiKey=b2c477ef973e48739375006d4a220bd9",
      );

      Map<String, dynamic> data = response.data;
      List<dynamic> articles = data["articles"];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        articlesList.add(
          ArticleModel(
            name: article["source"]["name"],
            title: article["title"],
            urlToImage: article["urlToImage"] ?? 'There is no image',
          ),
        );
      }
      return articlesList;
    } catch (e) {
      print("❌ Error fetching top headlines: $e");
      return [];
    }
  }

  Future<List<ArticleModel>> technologyNews() async {
    try {
      var response = await dio.get(
        "https://newsapi.org/v2/top-headlines?category=technology&apiKey=b2c477ef973e48739375006d4a220bd9",
      );

      Map<String, dynamic> data = response.data;
      List<dynamic> articles = data["articles"];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        articlesList.add(
          ArticleModel(
            name: article["source"]["name"],
            title: article["title"],
            urlToImage: article["urlToImage"] ?? 'There is no image',
          ),
        );
      }
      return articlesList;
    } catch (e) {
      print("❌ Error fetching top headlines: $e");
      return [];
    }
  }

  Future<List<ArticleModel>> businessNews() async {
    try {
      var response = await dio.get(
        "https://newsapi.org/v2/top-headlines?category=business&apiKey=b2c477ef973e48739375006d4a220bd9",
      );

      Map<String, dynamic> data = response.data;
      List<dynamic> articles = data["articles"];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        articlesList.add(
          ArticleModel(
            name: article["source"]["name"],
            title: article["title"],
            urlToImage: article["urlToImage"] ?? 'There is no image',
          ),
        );
      }
      return articlesList;
    } catch (e) {
      print("❌ Error fetching top headlines: $e");
      return [];
    }
  }
}
