import 'package:alaboud_company/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cart_provider.dart';
import 'cart_screen.dart';
import 'category_item.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'id': '5', 'title': 'العروض', 'icon': FontAwesomeIcons.tags, 'color': Colors.redAccent},
    {'id': '3', 'title': 'الأدوات المنزلية', 'icon': FontAwesomeIcons.home, 'color': Colors.greenAccent},
    {'id': '1', 'title': 'الكهربائيات', 'icon': FontAwesomeIcons.lightbulb, 'color': Colors.amber},
    {'id': '2', 'title': 'الأدوات الصحية', 'icon': FontAwesomeIcons.faucet, 'color': Colors.blueAccent},
    {'id': '4', 'title': 'الطاقة النظيفة', 'icon': FontAwesomeIcons.solarPanel, 'color': Colors.orangeAccent},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'شركة العبود',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 24,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 8,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(1),
          ),
        ),
        actions: [
          Consumer<CartProvider>(
            builder: (ctx, cart, _) => Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.shoppingCart, size: 24, color: Colors.white),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  ),
                ),
                if (cart.items.length > 0)
                  Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Center(
                        child: Text(
                          '${cart.items.length}',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.search, size: 22, color: Colors.white),
            onPressed: () => showSearch(
              context: context,
              delegate: ProductSearch(),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade900.withOpacity(0.9),
              Colors.black,
            ],
            stops: [0.1, 0.5],
          ),
        ),
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      blurRadius: 15,
                      spreadRadius: 2,
                      offset: Offset(0, 5),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.blueAccent.withOpacity(0.8),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    '.dart_tool/assets/kitchen/369692775_793293339162526_5496493608221056920_n.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[800],
                      child: Center(
                        child: Icon(Icons.image_not_supported, color: Colors.white, size: 50),
                      ),
                    ),
                  ),
                ),
              ),
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'الأقسام الرئيسية',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.category, color: Colors.blue.shade300),
                ],
              ),
            ),


            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (ctx, i) => CategoryItem(
                    categories[i]['id']!,
                    categories[i]['title']!,
                    categories[i]['icon']!,
                    color: categories[i]['color']!,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}