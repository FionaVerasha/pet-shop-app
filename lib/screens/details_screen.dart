import 'package:flutter/material.dart';
import 'package:pet_shop_app/theme_manager.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic>? pet;
  final void Function(Map<String, dynamic>)? onAddToCart;
  
  const DetailsScreen({
    super.key,
    this.pet,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    // If no pet provided, inject a placeholder mapping representing Mikka
    final data = pet ?? {
      'name': 'Mikka',
      'gender': 'Male',
      'age': '1 year',
      'distance': '2 kms away',
      'bgColor': 0xFFA9CBE6,
      'image': 'https://images.unsplash.com/photo-1517849845537-4d257902454a?auto=format&fit=crop&w=400&q=80',
      'weight': '10 kg',
    };

    final bool isProduct = data.containsKey('category');
    final Color bgColor = isProduct ? const Color(0xFFF8F9FA) : Color(data['bgColor']);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF090B13) : const Color(0xFF1A1C28),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: isDark ? Colors.white : Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          data['name'],
          style: TextStyle(color: isDark ? Colors.white : Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          ValueListenableBuilder<ThemeMode>(
            valueListenable: appThemeMode,
            builder: (context, themeMode, child) {
              return IconButton(
                icon: Icon(
                  themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
                  color: isDark ? Colors.white : Colors.white,
                ),
                onPressed: toggleThemeMode,
              );
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF1A1C28),
              ),
            ),
          ),
          Positioned(
            top: 72,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 310,
                height: 310,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned(
            top: 92,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: data['name'],
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF111827) : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: ClipOval(
                    child: Container(
                      color: isDark ? const Color(0xFF111827) : Colors.white,
                      padding: const EdgeInsets.all(8),
                      child: isProduct
                        ? data['isAsset'] == true
                            ? Image.asset(data['image'], fit: BoxFit.contain)
                            : Image.network(data['image'], fit: BoxFit.contain)
                        : Image.network(
                            data['image'],
                            fit: BoxFit.cover,
                            errorBuilder: (c, e, s) => const Icon(Icons.pets, size: 100, color: Colors.white),
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 360,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF111827) : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['name'],
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            isProduct ? data['brand'] : data['distance'],
                            style: TextStyle(
                              color: isDark ? Colors.grey[400] : Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        if (isProduct)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A1C28),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Text(
                              '\$${data['price'].toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoBox(context, isProduct ? 'Weight' : 'Sex', isProduct ? '10 kg' : data['gender']),
                        _buildInfoBox(context, isProduct ? 'Category' : 'Age', isProduct ? data['category'] : data['age']),
                        _buildInfoBox(context, isProduct ? 'Exp. Date' : 'Weight', isProduct ? '12/2026' : (data['weight'] ?? '10 kg')),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isProduct
                        ? 'This premium ${data['category'].toLowerCase()} food is formulated with high-quality ingredients to support your pet\'s health and vitality. It contains essential vitamins, minerals, and proteins for a balanced diet.'
                        : 'There are some dogs that are naturally very intelligent. They do not need to repeat the command 100 times, because they grasp everything on the fly.',
                      style: TextStyle(
                        color: isDark ? Colors.grey[300] : Colors.grey.shade600,
                        height: 1.5,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (isProduct && onAddToCart != null) {
                            onAddToCart!(data);
                          }
                          if (!isProduct) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Adoption request sent!'), backgroundColor: Color(0xFF1A1C28)),
                            );
                          }
                          if (isProduct) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${data['name']} added to cart!'), backgroundColor: const Color(0xFF1A1C28)),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDark ? const Color(0xFF0F172A) : const Color(0xFF1A1C28),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          isProduct ? 'Add to Cart' : 'Adopt now',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(BuildContext context, String title, String value) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F172A) : Colors.blueGrey.shade50.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(color: isDark ? Colors.grey[300] : Colors.black87, fontWeight: FontWeight.normal)),
          const SizedBox(height: 4),
          Text(value, style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
