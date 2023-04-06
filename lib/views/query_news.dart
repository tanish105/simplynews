import 'package:flutter/material.dart';
import 'package:newsapp/Helper/news.dart';
import '../Helper/consts1.dart';
import '../models/article_model.dart';
import 'article_view.dart';

class QueryNews extends StatefulWidget {
  QueryNews({Key? key, required this.query}) : super(key: key);
  String query;

  @override
  State<QueryNews> createState() => _QueryNewsState();
}

class _QueryNewsState extends State<QueryNews> {
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQueryNews();
  }

  getQueryNews() async{
    getqueryNews newsClass = getqueryNews(widget.query);
    await newsClass.queryNews(widget.query);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const BackButton(color: Colors.black,),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Simply",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(Icons.save),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ///blogs
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: ListView.builder(shrinkWrap: true,physics: ClampingScrollPhysics(),itemBuilder: (context,index){
                  return BlogTile1(imageUrl: articles[index].urlToImage!, title: articles[index].title!, desc: articles[index].description!,url: articles[index].url!,);
                },itemCount: articles.length,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

