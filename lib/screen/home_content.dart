import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tap_news/models/articel_model.dart';
import 'package:tap_news/services/news_service.dart';
import 'package:tap_news/widget/colorized_card.dart';
import 'package:tap_news/widget/news_card.dart';

class HomeContentScreen extends StatefulWidget {
  const HomeContentScreen({super.key});

  @override
  State<HomeContentScreen> createState() => _HomeContentScreenState();
}

class _HomeContentScreenState extends State<HomeContentScreen> {
  List<ArticleModel> articles = [];

  @override
  void initState() {
    fetchHeadline();
    super.initState();
  }

  Future fetchHeadline() async {
    var fetchedAritcles = await NewsService().topHeadlines();
    setState(() {
      articles = fetchedAritcles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 18, left: 18),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: Text(
              "Discover",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SliverToBoxAdapter(
            child: Text(
              "Read all your favourite news articles with just one click",
              style: TextStyle(fontSize: 15),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          const SliverToBoxAdapter(child: ColorizedCard()),
          const SliverToBoxAdapter(child: SizedBox(height: 15)),
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
                    : const Text(
                      "Top headlines for you",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 15)),
          SliverList.separated(
            itemBuilder: (context, index) {
              return NewsCard(
                article: articles[index],
                image: articles[index].urlToImage,
                title: articles[index].title,
                source: articles[index].name,
              );
            },
            separatorBuilder:
                (context, index) => const Divider(
                  thickness: 0.6,
                  height: 40,
                  color: Colors.grey,
                ),
            itemCount: articles.length,
          ),
        ],
      ),
    );
  }
}
