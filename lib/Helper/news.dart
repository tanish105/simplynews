import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  String country;
  List<ArticleModel> news =[];
  News({this.country="in"});
  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=$country&apiKey=7bef18eb0a1c444e8580716ad648a103";
    http.Response response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null ){
          ArticleModel articleModel = ArticleModel(author: element['author'], title: element['title'], description: element['description'], url: element['url'], urlToImage: element['urlToImage'], content: element['content']);
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass{
  List<ArticleModel> news =[];

  Future<void> getNews(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=7bef18eb0a1c444e8580716ad648a103";
    http.Response response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null ){
          ArticleModel articleModel = ArticleModel(author: element['author'], title: element['title'], description: element['description'], url: element['url'], urlToImage: element['urlToImage'], content: element['content']);
          news.add(articleModel);
        }
      });
    }
  }
}

class getCountryNews{
  List<ArticleModel> news =[];

  final String country;
  getCountryNews(this.country);

  Future<void> CountryNews(String country) async{
    String url = "https://newsapi.org/v2/top-headlines?country=$country&apiKey=7bef18eb0a1c444e8580716ad648a103";
    http.Response response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null ){
          ArticleModel articleModel = ArticleModel(author: element['author'], title: element['title'], description: element['description'], url: element['url'], urlToImage: element['urlToImage'], content: element['content']);
          news.add(articleModel);
        }
      });
    }
  }
}

class getqueryNews{
  List<ArticleModel> news =[];

  final String query;
  getqueryNews(this.query);

  Future<void> queryNews(String query) async{
    print(query);
    String url = "https://newsapi.org/v2/everything?q=$query&from=2023-03-05&sortBy=publishedAt&apiKey=7bef18eb0a1c444e8580716ad648a103";
    http.Response response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null ){
          ArticleModel articleModel = ArticleModel(author: element['author'], title: element['title'], description: element['description'], url: element['url'], urlToImage: element['urlToImage'], content: element['content']);
          news.add(articleModel);
        }
      });
    }
  }
}