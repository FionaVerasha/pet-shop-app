import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final Map<String, dynamic>? pet;
  final int cartCount;
  final void Function(Map<String, dynamic>)? onAddToCart;
  final VoidCallback? onCartTap;
  
  const DetailsScreen({
    super.key,
    this.pet,
    this.cartCount = 0,
    this.onAddToCart,
    this.onCartTap,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late int currentCartCount;

  @override
  void initState() {
    super.initState();
    currentCartCount = widget.cartCount;
  }

  @override
  Widget build(BuildContext context) {
    // If no pet provided, inject a placeholder mapping representing Mikka
    final data = widget.pet ?? {
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

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black87),
                  onPressed: widget.onCartTap,
                ),
                if (currentCartCount > 0)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFD700),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        currentCartCount.toString(),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Color and Circle
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Container(
              color: bgColor,
              child: Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: isProduct ? Colors.black.withOpacity(0.02) : Colors.white24,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          
          // Image
          Positioned(
            top: MediaQuery.of(context).padding.top + 40,
            left: 50,
            right: 50,
            height: MediaQuery.of(context).size.height * 0.40,
            child: Hero(
              tag: data['name'],
              child: isProduct 
                ? data['isAsset'] == true
                    ? Image.asset(data['image'], fit: BoxFit.contain)
                    : Image.network(data['image'], fit: BoxFit.contain)
                : ClipOval(
                    child: Image.network(
                      data['image'],
                      fit: BoxFit.cover,
                      errorBuilder: (c,e,s) => const Icon(Icons.pets, size: 100, color: Colors.white),
                    ),
                  ),
            ),
          ),

          // Bottom Sheet Element
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.55,
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Brand (for products)
                    if (isProduct)
                      Text(
                        data['brand'].toUpperCase(),
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    
                    // Title
                    Text(
                      data['name'],
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Location or Price
                    Row(
                      children: [
                        Icon(isProduct ? Icons.payments_outlined : Icons.location_on, color: isProduct ? const Color(0xFF2D7B37) : Colors.grey, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          isProduct ? '\$${data['price'].toStringAsFixed(2)}' : data['distance'],
                          style: TextStyle(
                            color: isProduct ? const Color(0xFF2D7B37) : Colors.grey, 
                            fontSize: isProduct ? 20 : 14,
                            fontWeight: isProduct ? FontWeight.w900 : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Info boxes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoBox(isProduct ? 'Weight' : 'Sex', isProduct ? '10 kg' : data['gender']),
                        _buildInfoBox(isProduct ? 'Category' : 'Age', isProduct ? data['category'] : data['age']),
                        _buildInfoBox(isProduct ? 'Exp. Date' : 'Weight', isProduct ? '12/2026' : (data['weight'] ?? '10 kg')),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // About section
                    Text(
                      isProduct ? 'Description:' : 'About:',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isProduct 
                        ? 'This premium ${data['category'].toLowerCase()} food is formulated with high-quality ingredients to support your pet\'s health and vitality. It contains essential vitamins, minerals, and proteins for a balanced diet.'
                        : 'There are some dogs that are naturally very intelligent. They do not need to repeat the command 100 times, because they grasp everything on the fly.',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        height: 1.5,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Main Action Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (isProduct) {
                            if (widget.onAddToCart != null) {
                              widget.onAddToCart!(data);
                            }
                            setState(() {
                              currentCartCount += 1;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${data['name']} added to cart!'), backgroundColor: const Color(0xFF2D7B37)),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isProduct ? const Color(0xFFFFD700) : Colors.black87,
                          foregroundColor: isProduct ? Colors.black : Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          isProduct ? 'Add to Cart' : 'Adopt me',
                          style: const TextStyle(
                            fontSize: 18,
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

  Widget _buildInfoBox(String title, String value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.normal)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
