import 'package:flutter/material.dart';

void main() {
  runApp(ClothingApp());
}

class ClothingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clothing Store',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> clothes = [
    {
      "name": "Fancy Bath robe",
      "image": "assets/2ea23138-daef-4229-8e7c-8eb436b4414e.jpg",
      "description": "A comfortable cotton T-shirt.",
      "price": "\$9.99"
    },
    {
      "name": "Strawberry dress",
      "image": "assets/240ebf9bfb4e6e5d4ada27ba0b747f66.jpg",
      "description": "Stylish blue denim jeans.",
      "price": "\$49.99"
    },
    {
      "name": "Pirate Costume",
      "image": "assets/619HhG5MELL._AC_UF1000,1000_QL80_.jpg",
      "description": "A warm winter jacket.",
      "price": "\$89.99"
    },
    {
      "name": "Birthday dress",
      "image": "assets/LittlePrincessCatDress_BowSetc.jpg",
      "description": "Comfortable running sneakers.",
      "price": "\$59.99"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('213065'), // Ваш број на индекс
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Прикажува 2 картички по ред
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: clothes.length,
          itemBuilder: (context, index) {
            final item = clothes[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(product: item),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(item['image'], fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product['image'],
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              product['name'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              product['description'],
              style: TextStyle(fontSize: 16, color: const Color(0xFFD11111)),
            ),
            SizedBox(height: 16),
            Text(
              product['price'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
