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
    dynamic fetchedAritcles;
    switch (widget.categoryName) {
      case "Business":
        fetchedAritcles = await NewsService().businessNews();
        setState(() {
          articles = fetchedAritcles;
        });
        break;
      case "Crypto":
        fetchedAritcles = await NewsService().cryptoNews();
        setState(() {
          articles = fetchedAritcles;
        });
        break;
      case "Entertainment":
        fetchedAritcles = await NewsService().entertainmentNews();
        setState(() {
          articles = fetchedAritcles;
        });
        break;
      case "Gaming":
        fetchedAritcles = await NewsService().gamingNews();
        setState(() {
          articles = fetchedAritcles;
        });
        break;
      case "Health":
        fetchedAritcles = await NewsService().healthNews();
        setState(() {
          articles = fetchedAritcles;
        });
        break;
      case "Life-Style":
        fetchedAritcles = await NewsService().lifeStyleNews();
        setState(() {
          articles = fetchedAritcles;
        });
        break;

      case "Politics":
        fetchedAritcles = await NewsService().politicsNews();
        setState(() {
          articles = fetchedAritcles;
        });
        break;

      case "Science":
        fetchedAritcles = await NewsService().scienceNews();
        setState(() {
          articles = fetchedAritcles;
        });
        break;

      case "Technology":
        fetchedAritcles = await NewsService().technologyNews();
        setState(() {
          articles = fetchedAritcles;
        });

        break;
      case "Sports":
        fetchedAritcles = await NewsService().sportsNews();
        setState(() {
          articles = fetchedAritcles;
        });

        break;
      default:
        fetchedAritcles = await NewsService().topHeadlines();
        setState(() {
          articles = fetchedAritcles;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 18, left: 18),

        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 100,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.categoryHeadline,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black45,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                centerTitle: true,
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.purpleAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              backgroundColor: Colors.deepPurple,
              elevation: 0,
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 20)),
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
                  // ask if articles is empty "Still loading" if yes == shimmer  , else show "Top headlines for you"
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
