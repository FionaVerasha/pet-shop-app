import 'package:flutter/material.dart';
import 'package:pet_shop_app/theme_manager.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF0F172A) : const Color(0xFF322839),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.pets, color: Colors.white, size: 28),
                      ValueListenableBuilder<ThemeMode>(
                        valueListenable: appThemeMode,
                        builder: (context, themeMode, child) {
                          return IconButton(
                            icon: Icon(
                              themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
                              color: Colors.white,
                            ),
                            onPressed: toggleThemeMode,
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Whisker Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'A joyful, trusted pet shop built for every tail, whisker, and paw.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: const [
                      _FeatureChip(icon: Icons.favorite, label: 'Trusted'),
                      SizedBox(width: 12),
                      _FeatureChip(icon: Icons.local_shipping, label: 'Fast Delivery'),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Story',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : const Color(0xFF322839),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Whisker Cart began with a single idea: make pet care simple, joyful, and affordable for every family. We bring premium food, trusted accessories, and caring advice to pet parents across the city.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: isDark ? Colors.grey[300] : const Color(0xFF5A5662),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'What Makes Us Different',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : const Color(0xFF322839),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _InfoCard(
                      icon: Icons.shopping_bag_outlined,
                      title: 'Curated Products',
                      description: 'Only the best pet food, treats, and supplies from brands you can trust.',
                    ),
                    const SizedBox(height: 16),
                    _InfoCard(
                      icon: Icons.thumb_up_off_alt,
                      title: 'Pet-Friendly Service',
                      description: 'Friendly staff and fast checkout designed around your furry companion.',
                    ),
                    const SizedBox(height: 16),
                    _InfoCard(
                      icon: Icons.support_agent,
                      title: 'Expert Advice',
                      description: 'Guidance on nutrition, grooming, and toys so you can care for every whisker.',
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Our Promise',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : const Color(0xFF322839),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'At Whisker Cart, we promise: happy pets, helpful people, and quality products delivered with love. Whether you shop online or in-store, your pet’s comfort comes first.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: isDark ? Colors.grey[300] : const Color(0xFF5A5662),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF1F2937) : const Color(0xFFFFF3D6),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined, color: isDark ? Colors.tealAccent.shade100 : const Color(0xFF322839), size: 28),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'Find us at 24 Paws Avenue, Petville. Open daily for happy shopping and tail wagging.',
                              style: TextStyle(
                                color: isDark ? Colors.white : const Color(0xFF322839),
                                fontSize: 15,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark ? const Color(0xFF22C55E) : const Color(0xFF322839),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                      ),
                      child: const Text(
                        'Explore Our Collections',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FeatureChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(0.08) : Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: isDark ? Colors.white : Colors.white, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111827) : Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withOpacity(0.35) : Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF164E63) : const Color(0xFFFFF3D6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: isDark ? Colors.tealAccent.shade100 : const Color(0xFF322839), size: 26),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF322839),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: isDark ? Colors.grey[300] : const Color(0xFF6B6377),
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
