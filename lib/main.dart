import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Store',
      home: const HomePage(),
    );
  }
}

// Sample product data
final List<Map<String, dynamic>> products = [
  {
    'title': 'Essence Mascara',
    'brand': 'Essence',
    'category': 'Beauty',
    'price': 9.99,
    'rating': 4.5,
    'description': 'Volumizing mascara for beautiful lashes.',
    'thumbnail': 'https://dummyjson.com/image/300x230',
  },
  {
    'title': 'Eyeshadow Palette',
    'brand': 'Glamour',
    'category': 'Beauty',
    'price': 19.99,
    'rating': 4.2,
    'description': 'A colorful palette for everyday looks.',
    'thumbnail': 'https://dummyjson.com/image/300x230',
  },
  {
    'title': 'Powder Canister',
    'brand': 'Velvet',
    'category': 'Beauty',
    'price': 14.99,
    'rating': 4.0,
    'description': 'A lightweight powder for a smooth finish.',
    'thumbnail': 'https://dummyjson.com/image/300x230',
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Store'),
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,

        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAlias,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Product Image
                Container(
                  width: double.infinity,
                  height: 230,
                  color: Colors.white,
                  child: Image.network(
                    product['thumbnail'],
                    fit: BoxFit.contain,
                  ),
                ),

                // Product Information
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Rating + Brand
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '${product['rating']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          Text(
                            product['brand'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Price
                      Text(
                        '\$${product['price']}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Description
                      Text(
                        product['description'],
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          height: 1.4,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Product Title
                      Text(
                        product['title'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      // Category
                      Text(
                        product['category'],
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}