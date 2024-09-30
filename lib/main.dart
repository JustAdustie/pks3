import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Магазин машинок',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product('Машина 1', 'assets/product1.jpg', 'Описание товара.'),
    Product('Что-то большее чем машина', 'assets/product2.jpg', 'Описание чего-то большего чем машина.'),
    Product('Машина 3', 'assets/product3.jpg', 'описание машины 3.'),
    Product('Машина 4', 'assets/product4.jpg', 'Тут есть описание.'),
    Product('Машина 5', 'assets/product5.jpg', 'Описание?'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Карточки')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: products[index]),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(products[index].imagePath, height: 200, fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(products[index].name, style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(product.imagePath, height: 300, fit: BoxFit.cover),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                product.description,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Product {
  final String name;
  final String imagePath;
  final String description;

  Product(this.name, this.imagePath, this.description);
}
