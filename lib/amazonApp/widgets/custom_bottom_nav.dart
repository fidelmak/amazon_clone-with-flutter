// Provider to handle the current index of the BottomNavigationBar
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class CustomNavBar extends ConsumerWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return BottomNavigationBar(
      selectedItemColor: Colors.orange, // Set the color for the selected item
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, ref, index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }

  void _onItemTapped(BuildContext context, WidgetRef ref, int index) {
    // Update the current tab index using Riverpod
    ref.read(bottomNavIndexProvider.notifier).state = index;

    // Navigate to the correct page based on the index
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/search');
        break;
      case 2:
        context.go('/profile');
        break;
    }
  }
}
