import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String selectedCategory = 'Dogs';

  final List<String> categories = ['Dogs', 'Cats', 'Others'];

  final List<Map<String, dynamic>> allProducts = [
    // Dogs Section (4 Products)
    {
      'name': 'Premium Kibble',
      'brand': 'Royal Canin',
      'price': 45.00,
      'image': 'https://images.unsplash.com/photo-1589924691106-07c26da3b8bf?q=80&w=1000&auto=format&fit=crop',
      'category': 'Dogs',
      'isFavorite': false,
    },
    {
      'name': 'Organic Beef Jerky',
      'brand': 'Purina Pro',
      'price': 12.50,
      'image': 'https://images.unsplash.com/photo-1601758228041-f3b2795255f1?q=80&w=1000&auto=format&fit=crop',
      'category': 'Dogs',
      'isFavorite': true,
    },
    {
      'name': 'Dental Chew Sticks',
      'brand': 'Pedigree',
      'price': 8.99,
      'image': 'https://images.unsplash.com/photo-1544568100-847a948585b9?q=80&w=1000&auto=format&fit=crop',
      'category': 'Dogs',
      'isFavorite': false,
    },
    {
      'name': 'Training Treats',
      'brand': 'Zuke\'s',
      'price': 14.99,
      'image': 'https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?q=80&w=1000&auto=format&fit=crop',
      'category': 'Dogs',
      'isFavorite': false,
    },
    // Cats Section (4 Products)
    {
      'name': 'Salmon Pate',
      'brand': 'Fancy Feast',
      'price': 2.50,
      'image': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?q=80&w=1000&auto=format&fit=crop',
      'category': 'Cats',
      'isFavorite': false,
    },
    {
      'name': 'Tuna Flakes Mix',
      'brand': 'Whiskas',
      'price': 15.99,
      'image': 'https://images.unsplash.com/photo-1574158622682-e40e69881006?q=80&w=1000&auto=format&fit=crop',
      'category': 'Cats',
      'isFavorite': true,
    },
    {
      'name': 'Anti-Hairball Treat',
      'brand': 'Iams',
      'price': 6.75,
      'image': 'https://images.unsplash.com/photo-1533738363-b7f9aef128ce?q=80&w=1000&auto=format&fit=crop',
      'category': 'Cats',
      'isFavorite': false,
    },
    {
      'name': 'Gourmet Wet Food',
      'brand': 'Sheba',
      'price': 18.50,
      'image': 'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?q=80&w=1000&auto=format&fit=crop',
      'category': 'Cats',
      'isFavorite': false,
    },
    // Others Section (4 Products)
    {
      'name': 'Rabbit Veggie Mix',
      'brand': 'Kaytee',
      'price': 11.20,
      'image': 'https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308?q=80&w=1000&auto=format&fit=crop',
      'category': 'Others',
      'isFavorite': false,
    },
    {
      'name': 'Bird Seed Blend',
      'brand': 'Wild Harvest',
      'price': 9.50,
      'image': 'https://images.unsplash.com/photo-1522850959076-3997748283c4?q=80&w=1000&auto=format&fit=crop',
      'category': 'Others',
      'isFavorite': false,
    },
    {
      'name': 'Hamster Fruit Mix',
      'brand': 'Vitakraft',
      'price': 7.99,
      'image': 'https://images.unsplash.com/photo-1425082661705-1834bfd09dca?q=80&w=1000&auto=format&fit=crop',
      'category': 'Others',
      'isFavorite': true,
    },
    {
      'name': 'Fish Flake Food',
      'brand': 'Tetra',
      'price': 5.50,
      'image': 'https://images.unsplash.com/photo-1522069169874-c58ec4b76be5?q=80&w=1000&auto=format&fit=crop',
      'category': 'Others',
      'isFavorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> displayedProducts = allProducts
        .where((product) => product['category'] == selectedCategory)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search pet food...',
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              suffixIcon: Icon(Icons.tune, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
                ),
                Positioned(
                  top: 5,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFD700),
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // Category Dropdown at the Left
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700),
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedCategory,
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 28),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  dropdownColor: const Color(0xFFFFD700),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedCategory = newValue;
                      });
                    }
                  },
                  items: categories.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Product Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: displayedProducts.isEmpty 
                ? const Center(child: Text('No items in this category yet!'))
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: displayedProducts.length,
                    itemBuilder: (context, index) {
                      final product = displayedProducts[index];
                      return _buildProductCard(product);
                    },
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        product['image'],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.pets, size: 50, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Icon(
                    product['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                    color: product['isFavorite'] ? Colors.red : Colors.black54,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          product['brand'],
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
        Text(
          product['name'],
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${product['price'].toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF2D7B37)),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.shopping_cart_outlined, size: 18),
            ),
          ],
        ),
      ],
    );
  }
}
