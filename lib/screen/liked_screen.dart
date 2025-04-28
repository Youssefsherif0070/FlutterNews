import 'package:flutter/material.dart';
import 'package:tap_news/data/data.dart'; // اللي فيه likedArticles
import 'package:tap_news/widget/news_card.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 18, left: 18),
        child: ValueListenableBuilder(
          valueListenable: LikedArticles.likedArticles,
          builder: (context, article, _) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(
                  child: Text(
                    "Liked Articles",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Text(
                    "Read all your saved articles with just one click",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                article.isEmpty
                    ? const SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          "No Liked Articles yet ...",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                    : SliverList.separated(
                      itemBuilder: (context, index) {
                        return NewsCard(
                          article: article[index],
                          image: article[index].urlToImage,
                          title: article[index].title,
                          source: article[index].name,
                        );
                      },
                      separatorBuilder:
                          (context, index) => const Divider(
                            thickness: 0.6,
                            height: 40,
                            color: Colors.grey,
                          ),
                      itemCount: article.length,
                    ),
              ],
            );
          },
        ),
      ),
    );
  }
}
