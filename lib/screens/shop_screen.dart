import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String selectedCategory = 'Dogs';
  int cartCount = 0;

  final List<String> categories = ['Dogs', 'Cats', 'Others'];

  final List<Map<String, dynamic>> allProducts = [
    // Dogs Section (4 Products)
    {
      'name': 'Premium Dog Food',
      'brand': 'Super Feed',
      'price': 45.00,
      'image': 'assets/images/premium_dog_food.png',
      'category': 'Dogs',
      'isFavorite': false,
      'isAsset': true,
    },
    {
      'name': 'Pedigree Dog Food',
      'brand': 'Pedigree',
      'price': 12.50,
      'image': 'assets/images/pedigree_dog_food.png',
      'category': 'Dogs',
      'isFavorite': true,
      'isAsset': true,
    },
    {
      'name': 'Best Premium Dog Food',
      'brand': 'Super Feed',
      'price': 55.00,
      'image': 'assets/images/best_premium_dog_food.png',
      'category': 'Dogs',
      'isFavorite': false,
      'isAsset': true,
    },
    {
      'name': 'Chappi Dog Food',
      'brand': 'Chappi',
      'price': 14.99,
      'image': 'assets/images/chappi_dog_food.jpg',
      'category': 'Dogs',
      'isFavorite': false,
      'isAsset': true,
    },
    // Cats Section (4 Products)
    {
      'name': 'Whiskas Cat Food',
      'brand': 'Whiskas',
      'price': 2.50,
      'image': 'assets/images/whiskas_cat_food.jpg',
      'category': 'Cats',
      'isFavorite': false,
      'isAsset': true,
    },
    {
      'name': 'Purina Go-Cat Indoor',
      'brand': 'Purina',
      'price': 15.99,
      'image': 'assets/images/purina_gocat_indoor.jpg',
      'category': 'Cats',
      'isFavorite': true,
      'isAsset': true,
    },
    {
      'name': 'Gourmet Cat Food',
      'brand': 'Gourmet',
      'price': 6.75,
      'image': 'assets/images/gourmet_cat_food.jpg',
      'category': 'Cats',
      'isFavorite': false,
      'isAsset': true,
    },
    {
      'name': 'Lifelong Cat Food',
      'brand': 'Amazon',
      'price': 18.50,
      'image': 'assets/images/lifelong_cat_food.jpg',
      'category': 'Cats',
      'isFavorite': false,
      'isAsset': true,
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
                  child: cartCount == 0 
                    ? const SizedBox.shrink() 
                    : Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFD700),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          cartCount.toString(),
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
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
                      childAspectRatio: 0.48,
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Center(
                    child: Hero(
                      tag: product['name'],
                      child: Transform.scale(
                        scale: 1.2,
                        child: SizedBox(
                          height: 240,
                          width: 200,
                          child: product['isAsset'] == true
                              ? Image.asset(
                                  product['image'],
                                  fit: BoxFit.contain,
                                )
                              : Image.network(
                                  product['image'],
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.pets, size: 50, color: Colors.grey),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      product['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                      color: product['isFavorite'] ? Colors.red : Colors.black45,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['brand'],
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  product['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF1A1A1A),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product['price'].toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Color(0xFF2D7B37),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        cartCount++;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product['name']} added to cart!'),
                          backgroundColor: const Color(0xFF2D7B37),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD700),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
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
