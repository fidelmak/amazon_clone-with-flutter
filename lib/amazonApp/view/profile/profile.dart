import 'package:flutter/material.dart';

import '../../widgets/custom_bottom_nav.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(
                "assets/images/user.png",
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
            const Center(child: Text('Profile Page')),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
