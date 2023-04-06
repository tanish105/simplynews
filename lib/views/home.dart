import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Helper/data.dart';
import 'package:newsapp/Helper/news.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/views/article_view.dart';
import 'package:newsapp/views/category_news.dart';
import 'package:newsapp/views/query_news.dart';
import 'package:newsapp/views/search_news.dart';
import '../models/article_model.dart';
import 'package:newsapp/Helper/consts.dart';
import 'package:newsapp/Helper/consts1.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  String country = 'in';
  String query = "";
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    setState(() {
      country;
    });
    getNews();
  }

  getNews() async {
    News newsClass = News(country: country);
    await newsClass.getNews();
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
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: 0,
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchNews(country: country),
                          ),
                        );
                      },
                      icon: const Icon(Icons.search),
                    ),
                    hintText: "Enter country code",
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    country = value;
                  },
                ),
              ),
              const PopupMenuItem(child: SizedBox(height: 0.5,)),
              PopupMenuItem(
                value: 1,
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QueryNews(query: query),
                          ),
                        );
                      },
                      icon: const Icon(Icons.search),
                    ),
                    hintText: "Enter hot topic!",
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    query = value;
                  },
                ),
              ),
            ];
          })
        ],
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(left: 25),),
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
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ///categories
                    Container(
                      height: 70,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            imageUrl: categories[index].ImageURL,
                            categoryName: categories[index].CategoryName,
                          );
                        },
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    ///blogs
                    Container(
                      padding: const EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BlogTile1(
                            imageUrl: articles[index].urlToImage!,
                            title: articles[index].title!,
                            desc: articles[index].description!,
                            url: articles[index].url!,
                          );
                        },
                        itemCount: articles.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
