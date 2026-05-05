import 'package:flutter/material.dart';
import 'package:pet_shop_app/theme_manager.dart';
import 'details_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String selectedCategory = 'Dogs';
  List<Map<String, dynamic>> cartItems = [];

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
      'name': 'Cadbury Animals Biscuits',
      'brand': 'Cadbury',
      'price': 11.20,
      'image': 'assets/images/cadbury_animals.jpg',
      'category': 'Others',
      'isFavorite': false,
      'isAsset': true,
    },
    {
      'name': 'Cadbury Animals with Freddo',
      'brand': 'Cadbury',
      'price': 9.50,
      'image': 'assets/images/cadbury_freddo.jpg',
      'category': 'Others',
      'isFavorite': false,
      'isAsset': true,
    },
    {
      'name': 'Animals Like Us RawMix',
      'brand': 'Animals Like Us',
      'price': 7.99,
      'image': 'assets/images/animals_like_us.jpg',
      'category': 'Others',
      'isFavorite': true,
      'isAsset': true,
    },
    {
      'name': 'Pedigree Wet Food',
      'brand': 'Pedigree',
      'price': 5.50,
      'image': 'assets/images/pedigree_wet_food.jpg',
      'category': 'Others',
      'isFavorite': false,
      'isAsset': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> displayedProducts = allProducts
        .where((product) => product['category'] == selectedCategory)
        .toList();

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: theme.inputDecorationTheme.fillColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            style: TextStyle(color: isDark ? Colors.white : Colors.black),
            decoration: InputDecoration(
              hintText: 'Search pet food...',
              prefixIcon: Icon(Icons.search, color: isDark ? Colors.grey[400] : Colors.grey),
              suffixIcon: Icon(Icons.tune, color: isDark ? Colors.grey[400] : Colors.grey),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              hintStyle: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey),
            ),
          ),
        ),
        actions: [
          ValueListenableBuilder<ThemeMode>(
            valueListenable: appThemeMode,
            builder: (context, themeMode, child) {
              return IconButton(
                icon: Icon(
                  themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
                  color: isDark ? Colors.white : Colors.black,
                ),
                onPressed: toggleThemeMode,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () => _showCartItems(context),
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
                    child: cartItems.isEmpty 
                      ? const SizedBox.shrink() 
                      : Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFD700),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            cartItems.length.toString(),
                            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shop the Best for Your Pets',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Find perfectly sized products, fresh favorites, and premium nutrition in one place.',
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.grey[300] : const Color(0xFF6B7280),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Category Dropdown at the Left
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF2F855A) : const Color(0xFFFFD700),
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedCategory,
                  icon: Icon(Icons.keyboard_arrow_down, color: isDark ? Colors.white : Colors.black, size: 28),
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  dropdownColor: isDark ? const Color(0xFF1F2937) : const Color(0xFFFFD700),
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
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 370,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: displayedProducts.length,
                    itemBuilder: (context, index) {
                      final product = displayedProducts[index];
                      return _buildProductCard(context, product);
                    },
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, dynamic> product) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              pet: product,
              onAddToCart: (item) {
                setState(() {
                  cartItems.add(item);
                });
              },
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black.withOpacity(0.30) : Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              margin: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF5F7FB),
                borderRadius: BorderRadius.circular(26),
              ),
              child: Center(
                child: Hero(
                  tag: product['name'],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(26),
                    child: SizedBox(
                      height: 220,
                      width: 220,
                      child: product['isAsset'] == true
                          ? Image.asset(product['image'], fit: BoxFit.contain)
                          : Image.network(
                              product['image'],
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) => Icon(Icons.pets, size: 56, color: isDark ? Colors.grey[400] : Colors.grey),
                            ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1F2937) : const Color(0xFFE9F7EF),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      product['category'],
                      style: TextStyle(
                        color: isDark ? Colors.greenAccent.shade100 : const Color(0xFF1A9A5A),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: isDark ? Colors.white : const Color(0xFF1B1F24),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product['brand'],
                    style: TextStyle(
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product['price'].toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: isDark ? Colors.tealAccent.shade200 : const Color(0xFF1A9A5A),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.add_shopping_cart_outlined,
                          color: Color(0xFF4B5563),
                          size: 18,
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
                          cartItems.add(product);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product['name']} added to cart!'),
                            backgroundColor: const Color(0xFF1A9A5A),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A9A5A),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCartItems(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            double total = cartItems.fold(0, (sum, item) => sum + item['price']);
            
            return Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'My Cart',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${cartItems.length} items',
                        style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (cartItems.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Text('Your cart is empty!'),
                      ),
                    )
                  else
                    Flexible(
                      child: Builder(
                        builder: (context) {
                          // Group items by name to show quantities
                          Map<String, int> itemQuantities = {};
                          Map<String, Map<String, dynamic>> uniqueItems = {};
                          for (var item in cartItems) {
                            String name = item['name'];
                            itemQuantities[name] = (itemQuantities[name] ?? 0) + 1;
                            uniqueItems[name] = item;
                          }
                          List<String> uniqueNames = uniqueItems.keys.toList();

                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: uniqueNames.length,
                            itemBuilder: (context, index) {
                              String name = uniqueNames[index];
                              final item = uniqueItems[name]!;
                              int qty = itemQuantities[name]!;

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image.asset(item['image'], fit: BoxFit.contain),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['name'],
                                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                          ),
                                          Text(
                                            '${item['brand']} • Qty: $qty',
                                            style: TextStyle(color: Colors.grey[500], fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '\$${(item['price'] * qty).toStringAsFixed(2)}',
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    const SizedBox(width: 8),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove_circle_outline, color: Colors.red, size: 22),
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          onPressed: () {
                                            setState(() {
                                              // Find first index of this item and remove it
                                              int idx = cartItems.indexWhere((element) => element['name'] == name);
                                              if (idx != -1) cartItems.removeAt(idx);
                                            });
                                            setModalState(() {});
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                        IconButton(
                                          icon: const Icon(Icons.add_circle_outline, color: Colors.green, size: 22),
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          onPressed: () {
                                            setState(() {
                                              cartItems.add(item);
                                            });
                                            setModalState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      ),
                    ),
                  const Divider(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF2D7B37),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: cartItems.isEmpty ? null : () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Checkout feature coming soon!')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFD700),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 0,
                      ),
                      child: const Text('Checkout', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          }
        );
      },
    );
  }
}
