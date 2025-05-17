import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tap_news/models/articel_model.dart';
import 'package:tap_news/services/news_service.dart';
import 'package:tap_news/widget/news_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
    required this.categoryName,
    required this.categoryHeadline,
    required this.categoryDescription,
  });
  final String categoryName;
  final String categoryHeadline;

  final String categoryDescription;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<ArticleModel> articles = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future fetchNews() async {
    Map<String, Future<dynamic>> categoryMap = {
      "Business": NewsService().businessNews(),
      "Crypto": NewsService().cryptoNews(),
      "Entertainment": NewsService().entertainmentNews(),
      "Gaming": NewsService().gamingNews(),
      "Health": NewsService().healthNews(),
      "Life-Style": NewsService().lifeStyleNews(),
      "Politics": NewsService().politicsNews(),
      "Science": NewsService().scienceNews(),
      "Technology": NewsService().technologyNews(),
      "Sports": NewsService().sportsNews(),
    };

    dynamic fetchedArticles;

    if (categoryMap.containsKey(widget.categoryName)) {
      fetchedArticles = await categoryMap[widget.categoryName];
    } else {
      fetchedArticles = await NewsService().topHeadlines();
    }

    setState(() {
      articles = fetchedArticles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 18, left: 18),

        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: ShaderMask(
                shaderCallback:
                    (bounds) => const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.red,
                        Colors.pink,
                        Colors.purple,
                        Colors.deepPurple,
                      ],
                    ).createShader(bounds),
                child: Text(
                  widget.categoryHeadline,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 15)),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.categoryDescription,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 20)),
            SliverToBoxAdapter(
              child:
                  articles.isEmpty
                      ? Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 160,
                          height: 140,
                          color: Colors.white,
                        ),
                      )
                      : const SizedBox(height: 15),
            ),

            SliverList.separated(
              itemBuilder: (context, index) {
                return NewsCard(
                  article: articles[index],
                  image: articles[index].urlToImage,
                  title: articles[index].title,
                  source: articles[index].name,
                );
              },
              // seprator builder is a function that will be called for each item in the list
              separatorBuilder:
                  (context, index) => Divider(
                    thickness: 0.6,
                    height: 40,
                    color: Colors.grey,
                  ), // أو SizedBox(height: 10)
              itemCount: articles.length,
            ),
          ],
        ),
      ),
    );
  }
}
