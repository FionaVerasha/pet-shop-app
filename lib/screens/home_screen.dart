import 'package:flutter/material.dart';
import 'package:pet_shop_app/theme_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: _buildHeader(context, isDark),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(flex: 5, child: _buildLeftContent(isMobile: false)),
                              const SizedBox(width: 60),
                              Expanded(flex: 5, child: _buildRightContent(context, isMobile: false, isDark: isDark)),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLeftContent(isMobile: true),
                          const SizedBox(height: 48),
                          _buildRightContent(context, isMobile: true, isDark: isDark),
                        ],
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 40),
              _buildPopularCategories(),
              const SizedBox(height: 60),
              _buildTrustSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeftContent({required bool isMobile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFEAF5EF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'WELCOME TO WHISKER CART',
            style: TextStyle(
              color: Color(0xFF1A9A5A),
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: isMobile ? 40 : 56,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF14211D),
              height: 1.1,
            ),
            children: const [
              TextSpan(text: 'Everything Your Pet\nNeeds, '),
              TextSpan(
                text: 'Delivered\nWith Care',
                style: TextStyle(color: Color(0xFF1A9A5A)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Discover a curated selection of premium pet supplies, toys, nutritious food, and professional grooming essentials. We treat your pets like family.',
          style: TextStyle(
            fontSize: isMobile ? 15 : 18,
            color: const Color(0xFF6B7280),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A9A5A),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Shop Now',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF14211D),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                side: const BorderSide(color: Color(0xFFE5E7EB), width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Our Services',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome back!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : const Color(0xFF14211D),
              ),
            ),
            Row(
              children: [
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
                const SizedBox(width: 8),
                Icon(Icons.pets, size: 28, color: isDark ? Colors.tealAccent : const Color(0xFF1A9A5A)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          'Find premium pet supplies, expert tips, and joyful care for every fur friend.',
          style: TextStyle(
            fontSize: 16,
            color: isDark ? Colors.grey[300] : const Color(0xFF6B7280),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: isDark ? Colors.grey[500] : const Color(0xFF9CA3AF)),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search food, toys, accessories...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey.shade500),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A9A5A),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.tune, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRightContent(BuildContext context, {required bool isMobile, required bool isDark}) {
    final theme = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          height: isMobile ? 350 : 500,
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: isDark ? Colors.black.withOpacity(0.25) : Colors.black.withOpacity(0.05),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.network(
              'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?auto=format&fit=crop&w=800',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: isMobile ? -20 : -30,
          right: isMobile ? 0 : -30,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0F172A) : Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: isDark ? Colors.black.withOpacity(0.25) : Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBD6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF8A00),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'New Arrivals',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF1E2D24),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Available Today',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPopularCategories() {
    return Column(
      children: [
        const Text(
          'Popular Categories',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF14211D),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Shop the most loved items for cats, dogs, grooming, and wellness.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF6B7280),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 4,
          width: 70,
          decoration: BoxDecoration(
            color: const Color(0xFF1A9A5A),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 34),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double cardWidth;
              if (constraints.maxWidth > 1000) {
                cardWidth = (constraints.maxWidth - (3 * 24)) / 4;
              } else if (constraints.maxWidth > 600) {
                cardWidth = (constraints.maxWidth - 24) / 2;
              } else {
                cardWidth = constraints.maxWidth;
              }

              // Set a reasonable max width for cards
              if (cardWidth > 280) cardWidth = 280;

              return Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  _buildCategoryCard(
                    title: 'Cat Essentials',
                    subtitle: 'Litter, toys, and cozy comforts every cat will love.',
                    icon: Icons.pets,
                    iconColor: const Color(0xFF3B82F6),
                    iconBgColor: const Color(0xFFEFF6FF),
                    accentColor: const Color(0xFF93C5FD),
                    width: cardWidth,
                    label: 'Feline',
                  ),
                  _buildCategoryCard(
                    title: 'Dog Essentials',
                    subtitle: 'Strong collars, healthy snacks, and comfy beds for pups.',
                    icon: Icons.pets,
                    iconColor: const Color(0xFFF97316),
                    iconBgColor: const Color(0xFFFFF7ED),
                    accentColor: const Color(0xFFFCCB88),
                    width: cardWidth,
                    label: 'Canine',
                  ),
                  _buildCategoryCard(
                    title: 'Pet Grooming',
                    subtitle: 'Shampoos, brushes, and everything for a fresh, happy pet.',
                    icon: Icons.brush,
                    iconColor: const Color(0xFFA855F7),
                    iconBgColor: const Color(0xFFF5EEFF),
                    accentColor: const Color(0xFFD8B4FE),
                    width: cardWidth,
                    label: 'Beauty',
                  ),
                  _buildCategoryCard(
                    title: 'Health & Wellness',
                    subtitle: 'Vitamins, supplements, and comfort products for every pet.',
                    icon: Icons.health_and_safety,
                    iconColor: const Color(0xFF16A34A),
                    iconBgColor: const Color(0xFFDCFCE7),
                    accentColor: const Color(0xFF86EFAC),
                    width: cardWidth,
                    label: 'Wellness',
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required Color accentColor,
    required double width,
    required String label,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [accentColor.withOpacity(0.4), Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  label.toUpperCase(),
                  style: TextStyle(
                    color: iconColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 26),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF14211D),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF4B5563),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Explore now',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: iconColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrustSection() {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0F172A), // Dark navy blue background
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        children: [
          const Text(
            'Why Pet Owners Trust Us',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'We are committed to excellence in every package we deliver.',
            style: TextStyle(
              color: Color(0xFF94A3B8), // Slate 400
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              double cardWidth;
              if (constraints.maxWidth > 900) {
                cardWidth = (constraints.maxWidth - 48) / 3;
              } else if (constraints.maxWidth > 600) {
                cardWidth = (constraints.maxWidth - 24) / 2;
              } else {
                cardWidth = constraints.maxWidth;
              }

              if (cardWidth > 350) cardWidth = 350;

              return Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  _buildTrustCard(
                    title: 'Secure Payments',
                    description: 'Shop with confidence using our encrypted and highly secure payment gateways.',
                    icon: Icons.gpp_good,
                    iconColor: const Color(0xFF10B981), // Emerald 500
                    iconBgColor: const Color(0xFF064E3B).withOpacity(0.5), // Emerald 900
                    width: cardWidth,
                  ),
                  _buildTrustCard(
                    title: 'Fast Delivery',
                    description: 'Running low on food? Don\'t worry, we offer lightning-fast shipping across the country.',
                    icon: Icons.bolt,
                    iconColor: const Color(0xFF3B82F6), // Blue 500
                    iconBgColor: const Color(0xFF1E3A8A).withOpacity(0.5), // Blue 900
                    width: cardWidth,
                  ),
                  _buildTrustCard(
                    title: 'Quality Products',
                    description: 'Every item in our inventory is hand-checked for quality, safety, and pet satisfaction.',
                    icon: Icons.auto_awesome,
                    iconColor: const Color(0xFFF97316), // Orange 500
                    iconBgColor: const Color(0xFF7C2D12).withOpacity(0.5), // Orange 900
                    width: cardWidth,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTrustCard({
    required String title,
    required String description,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required double width,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B), // Slate 800
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF334155), // Slate 700
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 32,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(
              color: Color(0xFF94A3B8), // Slate 400
              fontSize: 15,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
