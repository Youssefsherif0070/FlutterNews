import 'package:tap_news/models/category_model.dart';
import 'package:tap_news/models/articel_model.dart';
import 'package:flutter/material.dart';

List<CategoryModel> categories = [
  CategoryModel(
    categoryName: "Business",
    categoryImage: "assets/category/business.jpg",
    headline: "Stay Updated with Business News",
    description:
        "Catch up with the fast-paced world of business! From stock markets and corporate moves to financial trends shaping the global economy — everything you need to stay ahead.",
  ),
  CategoryModel(
    categoryName: "Crypto",
    categoryImage: "assets/category/crypto.jpg",
    headline: "The Latest in Crypto World",
    description:
        "Stay on top of the ever-changing crypto scene! Follow Bitcoin, Ethereum, NFTs, and all the latest breakthroughs shaking up the digital finance space.",
  ),
  CategoryModel(
    categoryName: "Entertainment",
    categoryImage: "assets/category/entertainment.jpg",
    headline: "All About Entertainment",
    description:
        "Get your daily dose of celebrity buzz, movie releases, music trends, and pop culture moments that everyone’s talking about — right here, right now.",
  ),
  CategoryModel(
    categoryName: "Gaming",
    categoryImage: "assets/category/gaming.jpg",
    headline: "Gaming World Unlocked",
    description:
        "Level up with breaking news about new game releases, esports tournaments, gaming updates, and everything that fuels your gamer spirit.",
  ),
  CategoryModel(
    categoryName: "Health",
    categoryImage: "assets/category/health.jpg",
    headline: "Your Health Matters",
    description:
        "Explore the latest health trends, scientific breakthroughs, wellness tips, and expert advice to help you live a stronger, healthier life every day.",
  ),
  CategoryModel(
    categoryName: "Life-Style",
    categoryImage: "assets/category/lifestyle.jpg",
    headline: "Life-Style and Vibes",
    description:
        "From fashion trends and travel destinations to wellness hacks and everyday inspirations — discover how to upgrade your life in style.",
  ),
  CategoryModel(
    categoryName: "Politics",
    categoryImage: "assets/category/politics.jpg",
    headline: "Political Pulse of the World",
    description:
        "Get real-time updates on government moves, global policies, elections, and everything shaping the political landscape locally and worldwide.",
  ),
  CategoryModel(
    categoryName: "Science",
    categoryImage: "assets/category/science.jpg",
    headline: "Exploring the Future of Science",
    description:
        "Dive into the wonders of science with discoveries, innovations, and mind-blowing research that are pushing humanity toward the future.",
  ),
  CategoryModel(
    categoryName: "Sports",
    categoryImage: "assets/category/sports.jpg",
    headline: "The Spirit of Sports",
    description:
        "Catch all the action from global sports — match highlights, transfer news, records broken, and all the moments that define champions.",
  ),
  CategoryModel(
    categoryName: "Technology",
    categoryImage: "assets/category/technology.jpg",
    headline: "Tomorrow’s Tech, Today",
    description:
        "Stay plugged into the latest tech innovations, gadgets, startups, and digital revolutions that are changing the way we live, work, and play.",
  ),
];

class LikedArticles {
  static ValueNotifier<List<ArticleModel>> likedArticles = ValueNotifier([]);
}
