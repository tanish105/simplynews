import 'package:flutter/material.dart';

import '../views/article_view.dart';

class BlogTile1 extends StatelessWidget {
  const BlogTile1({Key? key, required this.imageUrl, required this.title, required this.desc, required this.url}) : super(key: key);
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