import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../provider/auth_provider.dart'; // Import the auth provider
import '../../widgets/custom_bottom_nav.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.watch(authRepositoryProvider);

    final user = authRepository.getCurrentUser(); // Get the current user

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Center(
              child: Text(
                user?.email ?? 'No Email Available',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            const Center(child: Text('Profile Page')),
            SizedBox(height: 20),
            Center(
              child: TextButton(
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
