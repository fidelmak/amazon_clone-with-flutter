import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../provider/auth_provider.dart'; // Import the auth provider
import '../../widgets/custom_bottom_nav.dart';
import '../../widgets/custom_button.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    final screenSize = MediaQuery.of(context).size;

    final user = authRepository.getCurrentUser(); // Get the current user

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile image container
            Container(
              child: Image.asset(
                "assets/images/user.png",
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
            // Add padding and email below the image
            SizedBox(height: 16),
            Text(
              user?.email ?? 'No Email Available',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('Profile Page'),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                desireColor: Colors.orange,
                screenSize: screenSize,
                text: 'Create a Product',
                onPressed: () {
                  context.go('/create');
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                desireColor: Colors.orange.withOpacity(0.6),
                screenSize: screenSize,
                text: 'Edit Product',
                onPressed: () {
                  context.go('/create');
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                desireColor: Colors.orange.withOpacity(0.3),
                screenSize: screenSize,
                text: 'View All Product',
                onPressed: () {
                  context.go('/create');
                },
              ),
            ),

            TextButton(
              onPressed: () async {
                await authRepository.signOut(); // Call the logout function
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You have been logged out'),
                    backgroundColor: Colors.orange,
                  ),
                );
                // Optionally, you can navigate to the login screen after logout
                context.go("/login");
              },
              child: Text("Logout", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
