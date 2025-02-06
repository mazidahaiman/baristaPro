import 'package:flutter/material.dart';
import 'CartPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> cartItems = [];
  String _searchQuery = '';
  String _selectedCategory = 'All';

  void addToCart(String title, double price) {
    setState(() {
      cartItems.add({'title': title, 'price': price});
    });
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MarketPlace'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: cartItems),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 10),
            _buildSearchBar(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CategoriesWidget(onCategorySelected: _selectCategory),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Products",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ProductsWidget(
              addToCart: addToCart,
              searchQuery: _searchQuery,
              selectedCategory: _selectedCategory,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  final Function(String) onCategorySelected;

  const CategoriesWidget({required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryItemWidget(title: "All", icon: Icons.all_inclusive, onCategorySelected: onCategorySelected),
          CategoryItemWidget(title: "Coffee", icon: Icons.local_cafe, onCategorySelected: onCategorySelected),
          CategoryItemWidget(title: "Tool", icon: Icons.build, onCategorySelected: onCategorySelected),
          CategoryItemWidget(title: "Book", icon: Icons.book, onCategorySelected: onCategorySelected),
          CategoryItemWidget(title: "Accessories", icon: Icons.accessibility, onCategorySelected: onCategorySelected),
          CategoryItemWidget(title: "Gift Set", icon: Icons.card_giftcard, onCategorySelected: onCategorySelected),
        ],
      ),
    );
  }
}

class CategoryItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function(String) onCategorySelected;

  const CategoryItemWidget({required this.title, required this.icon, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onCategorySelected(title),
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black, size: 30),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductsWidget extends StatelessWidget {
  final Function(String, double) addToCart;
  final String searchQuery;
  final String selectedCategory;

  const ProductsWidget({required this.addToCart, required this.searchQuery, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    final products = [
      {'title': 'Espresso', 'price': 3.0, 'category': 'Coffee'},
      {'title': 'Latte', 'price': 4.0, 'category': 'Coffee'},
      {'title': 'Coffee Grinder', 'price': 50.0, 'category': 'Tool'},
      {'title': 'Coffee Maker', 'price': 100.0, 'category': 'Tool'},
      {'title': 'Barista Handbook', 'price': 20.0, 'category': 'Book'},
      {'title': 'Coffee Mug', 'price': 10.0, 'category': 'Accessories'},
      {'title': 'Gift Set', 'price': 30.0, 'category': 'Gift Set'},
    ];

    final filteredProducts = products.where((product) {
      final title = product['title'] as String;
      final category = product['category'] as String;
      final matchesSearchQuery = title.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesCategory = selectedCategory == 'All' || category == selectedCategory;
      return matchesSearchQuery && matchesCategory;
    }).toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Adjust the number of items per row as needed
      ),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return ProductItemWidget(
          title: product['title'] as String,
          price: product['price'] as double,
          image: AssetImage('images/${(product['title'] as String).toLowerCase()}.jpg'),
          addToCart: addToCart,
        );
      },
    );
  }
}

class ProductItemWidget extends StatelessWidget {
  final String title;
  final double price;
  final AssetImage image;
  final Function(String, double) addToCart;

  const ProductItemWidget({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
    required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: image, height: 100),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "\RM $price",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addToCart(title, price);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Item Added'),
                    content: Text('$title already added to your cart'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            child: Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}