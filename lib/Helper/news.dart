import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news =[];

  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=7bef18eb0a1c444e8580716ad648a103";
    //var response = await Uri.tryParse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7bef18eb0a1c444e8580716ad648a103");
    http.Response response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    // print("Outside IF");
    if(jsonData['status'] == "ok"){
      // print(jsonData);
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null ){
          ArticleModel articleModel = ArticleModel(author: element['author'], title: element['title'], description: element['description'], url: element['url'], urlToImage: element['urlToImage'], content: element['content']);
          news.add(articleModel);
        }
      });
    }
  }
}