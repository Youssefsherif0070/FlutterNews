import 'package:flutter/material.dart';
import 'package:tap_news/data/data.dart';
import 'package:tap_news/models/category_model.dart';
import 'package:tap_news/screen/category_screen.dart';
import 'package:tap_news/widget/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final List<CategoryModel> category = categories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 18, left: 18),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "Read about various categories as per your interests",
                style: TextStyle(fontSize: 15),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CategoryScreen(
                            categoryHeadline: category[index].headline,
                            categoryName: category[index].categoryName,
                            categoryDescription: category[index].description,
                          );
                        },
                      ),
                    );
                  },
                  child: CategoryCard(category: category[index]),
                ),
                childCount: category.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 7,
                crossAxisCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
