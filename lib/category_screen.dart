import 'package:alaboud_company/product_item.dart';
import 'package:flutter/material.dart';
import '../services/data.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryTitle;

  CategoryScreen(this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final categoryProducts = products.where((prod) => prod.category == categoryTitle).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade900,
        elevation: 10,
        iconTheme: IconThemeData(color: Colors.white), 
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade900.withOpacity(0.7),
              Colors.black,
            ],
          ),
        ),
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: categoryProducts.length,
          itemBuilder: (ctx, i) => ProductItem(categoryProducts[i]),
        ),
      ),
    );
  }
}