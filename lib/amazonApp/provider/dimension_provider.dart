import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define your reference dimensions for iPhone 7
const double referenceWidth = 375;
const double referenceHeight = 667;

// State class to hold screen dimensions and scale factor
class ScreenSizeState {
  final double screenWidth;
  final double screenHeight;
  final double scaleFactor;

  ScreenSizeState({
    required this.screenWidth,
    required this.screenHeight,
    required this.scaleFactor,
  });
}

// StateNotifier to manage screen size and scaling factor
class ScreenSizeNotifier extends StateNotifier<ScreenSizeState> {
  ScreenSizeNotifier()
      : super(ScreenSizeState(screenWidth: 0, screenHeight: 0, scaleFactor: 1));

  void updateScreenSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate scaling factor based on width, or height if preferred
    final scaleFactor = screenWidth / referenceWidth;

    state = ScreenSizeState(
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      scaleFactor: scaleFactor,
    );
  }
}

// Create a provider for ScreenSizeNotifier
final screenSizeProvider =
    StateNotifierProvider<ScreenSizeNotifier, ScreenSizeState>(
  (ref) => ScreenSizeNotifier(),
);

/// screenSize Provider
final newScreenSizeProvider = Provider<Size>((ref) {
  // `context` will need to be passed when this is used in a widget
  throw UnimplementedError('Screen size provider requires BuildContext.');
});

class ScreenSizeProviderInitializer extends ConsumerWidget {
  final Widget child;

  const ScreenSizeProviderInitializer({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    ref.read(newScreenSizeProvider.overrideWithValue(screenSize));
    return child;
  }
}
