import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../views/article_view.dart';
import '../views/category_news.dart';

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;

  const CategoryTile({Key? key, this.imageUrl, this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CategoryNews(category: categoryName.toString().toLowerCase()),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                width: 120,
                height: 70,
                fit: BoxFit.cover,
                imageUrl: imageUrl,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  const BlogTile({Key? key, required this.imageUrl, required this.title, required this.desc, required this.url}) : super(key: key);

  final String imageUrl,title,desc,url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url),),);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(6), child: Image.network(imageUrl)),
            const SizedBox(height: 8,),
            Text(title,style: const TextStyle(fontSize: 18,color: Colors.black87,fontWeight: FontWeight.w500
            ),),
            const SizedBox(height: 8,),
            Text(desc,style: const TextStyle(color: Colors.black54),),
          ],
        ),
      ),
    );
  }
}
