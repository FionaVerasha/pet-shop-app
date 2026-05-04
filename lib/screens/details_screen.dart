import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic>? pet;
  
  const DetailsScreen({super.key, this.pet});

  @override
  Widget build(BuildContext context) {
    // If no pet provided, inject a placeholder mapping representing Mikka
    final petData = pet ?? {
      'name': 'Mikka',
      'gender': 'Male',
      'age': '1 year',
      'distance': '2 kms away',
      'bgColor': 0xFFA9CBE6,
      'image': 'https://images.unsplash.com/photo-1517849845537-4d257902454a?auto=format&fit=crop&w=400&q=80',
      'weight': '10 kg',
    };

    final bgColor = Color(petData['bgColor']);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
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
                  decoration: const BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          
          // Pet Image overlapping the circle - We use ClipOval for rectangular pictures to fit perfectly conceptually
          Positioned(
            top: MediaQuery.of(context).padding.top + 40,
            left: 50,
            right: 50,
            height: MediaQuery.of(context).size.height * 0.45,
            child: ClipOval(
              child: Image.network(
                petData['image'],
                fit: BoxFit.cover,
                errorBuilder: (c,e,s) => const Icon(Icons.pets, size: 100, color: Colors.white),
              ),
            ),
          ),

          // Bottom Sheet Element
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.58, // Increased height
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
                    // Title and Paw
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          petData['name'],
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const Icon(Icons.pets, color: Colors.grey, size: 30),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Location
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.grey, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          petData['distance'],
                          style: const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Info boxes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoBox('Sex', petData['gender']),
                        _buildInfoBox('Age', petData['age']),
                        _buildInfoBox('Weight', petData['weight'] ?? '10 kg'),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // About section
                    const Text(
                      'About:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'There are some dogs that are naturally very intelligent. They do not need to repeat the command 100 times, because they grasp everything on the fly.',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        height: 1.5,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Adopt button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Adopt me',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
