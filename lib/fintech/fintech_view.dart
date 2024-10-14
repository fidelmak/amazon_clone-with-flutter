import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FintechPage extends ConsumerStatefulWidget {
  const FintechPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FintechPageState();
}

class _FintechPageState extends ConsumerState<FintechPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
