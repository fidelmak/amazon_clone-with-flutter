import 'package:flutter/material.dart';

class SectionText extends StatelessWidget {
  final String yourText;
  const SectionText({
    super.key,
    required this.yourText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            yourText,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.8,
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black54,
            size: 16, // Set icon color to white
          ),

          ///////
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
