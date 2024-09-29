import 'package:flutter/material.dart';

import '../const/colors.dart';

class EcomNavbar extends StatelessWidget {
  const EcomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Added padding for the navbar
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Distributes space evenly
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              "assets/images/amazon_logo.png",
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                Icons.place,
                color: MyGlobal.textColor,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivered",
                    style: TextStyle(color: MyGlobal.textColor, fontSize: 16),
                  ),
                  Text(
                    "Nigeria",
                    style: TextStyle(color: MyGlobal.textColor, fontSize: 16),
                  ),
                ],
              )
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Text("All", style: TextStyle(color: MyGlobal.textColor)),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            // Expands to take available space
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                style: TextStyle(color: MyGlobal.textGrey),
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: TextStyle(color: MyGlobal.textGrey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: MyGlobal.textGrey),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: MyGlobal.textGrey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
