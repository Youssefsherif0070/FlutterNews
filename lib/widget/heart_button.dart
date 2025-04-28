import 'package:flutter/material.dart';
import 'package:tap_news/data/data.dart';
import 'package:tap_news/models/articel_model.dart';

class HeartButton extends StatefulWidget {
  final ArticleModel article;
  const HeartButton({super.key, required this.article});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 25,
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });

        if (isFavorite) {
          LikedArticles.likedArticles.value.add(widget.article);
        } else {
          LikedArticles.likedArticles.value.remove(widget.article);
        }

        LikedArticles.likedArticles.notifyListeners();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 500),
            content: Text(
              isFavorite ? "Added to favorites!" : "Removed from favorites!",
              style: const TextStyle(fontSize: 15),
            ),
          ),
        );
      },
    );
  }
}
