import 'package:alaboud_company/product.dart';
import 'package:alaboud_company/product_detail_screen.dart';
import 'package:flutter/material.dart';

import '../services/data.dart';

class ProductSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear, color: Colors.white),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () {
        close(context, null!);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products.where((prod) => prod.name.toLowerCase().contains(query.toLowerCase())).toList();
    return _buildSearchResults(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? products
        : products.where((prod) => prod.name.toLowerCase().contains(query.toLowerCase())).toList();
    return _buildSearchResults(suggestions);
  }

  Widget _buildSearchResults(List<Product> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            results[index].name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(results[index]),
              ),
            );
          },
        );
      },
    );
  }
}