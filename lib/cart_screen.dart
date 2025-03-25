import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'product.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('سلة المشتريات'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: cart.items.isEmpty
          ? Center(
        child: Text(
          'السلة فارغة',
          style: TextStyle(fontSize: 20),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItemCard(cart.items[i]),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'المجموع الكلي:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${cart.totalAmount.toStringAsFixed(2)} LT',
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    cart.clearCart();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('تم إتمام الشراء بنجاح!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text(
                    'إتمام الشراء',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final CartItem item;

  CartItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Image.asset(
              item.product.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('السعر: ${item.product.price} LT'),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (item.quantity > 1) {
                      Provider.of<CartProvider>(context, listen: false)
                          .updateQuantity(item.product.id, item.quantity - 1);
                    }
                  },
                ),
                Text('${item.quantity}'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .updateQuantity(item.product.id, item.quantity + 1);
                  },
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => Provider.of<CartProvider>(context, listen: false)
                  .removeFromCart(item.product.id),
            ),
          ],
        ),
      ),
    );
  }
}