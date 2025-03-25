import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('تفاصيل المنتج', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade900,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.blue.shade700,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 200,
                      maxHeight: 400,
                    ),
                    child: Image(
                      image: product.imageUrl.startsWith('http')
                          ? NetworkImage(product.imageUrl)
                          : AssetImage(product.imageUrl) as ImageProvider,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[800],
                        child: Center(
                          child: Icon(Icons.error, color: Colors.white, size: 50),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(product.name, style: TextStyle(fontSize: 28, color: Colors.white)),
              SizedBox(height: 10),
              Text('${product.price} LT', style: TextStyle(fontSize: 24, color: Colors.blue.shade300)),
              SizedBox(height: 20),
              Text('وصف المنتج:', style: TextStyle(fontSize: 20, color: Colors.white)),
              SizedBox(height: 10),
              Text(product.description, style: TextStyle(color: Colors.white70)),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false).addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.white),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'تمت إضافة ${product.name} إلى السلة بنجاح',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.indigo,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.all(10),
                        elevation: 6,
                        action: SnackBarAction(
                          label: 'رائع',
                          textColor: Colors.white,
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'إضافة إلى السلة',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        shadows: [
                    Shadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2,
                    offset: Offset(1, 1),
                    ) ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      ],
    ),
    ),
    );
  }
}