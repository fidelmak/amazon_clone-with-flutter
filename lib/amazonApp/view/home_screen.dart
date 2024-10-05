import 'package:flutter/material.dart';

import '../const/colors.dart';

class EcomWeb extends StatefulWidget {
  const EcomWeb({super.key});

  @override
  State<EcomWeb> createState() => _EcomWebState();
}

class _EcomWebState extends State<EcomWeb> {
  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyGlobal.TextWhite,
      appBar: AppBar(
        title: Container(
          child: Image.asset(
            "assets/images/amz.png",
            fit: BoxFit.cover,
            width: 150,
            height: 150,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipOval(
              child: Container(
                color: Colors.white,
                width: 30,
                height: 30,
                // Set background color to black
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 24, // Set icon color to white
                ),
              ),
            ),
          )
        ],
        // Use the custom EcomNavbar widget here
        backgroundColor: MyGlobal.textColor,
        toolbarHeight: 60, // Set AppBar background color
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /////////

            Stack(
              children: [
                // Background color split into two parts: black and white
                Column(
                  children: [
                    Container(
                      height: ScreenSize.height / 32, // Black top half
                      color: Colors.black,
                    ),
                    Container(
                      height: ScreenSize.height / 32, // White bottom half
                      color: Colors.white,
                    ),
                  ],
                ),
                // Centered search widget
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.1), // Light black shadow
                          spreadRadius: 2, // How wide the shadow spreads
                          blurRadius: 5, // How blurry the shadow is
                          offset: Offset(
                              0, 4), // The direction and amount of the shadow
                        ),
                      ],
                    ),
                    width: ScreenSize.width / 1.2,
                    height: ScreenSize.height / 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.search),
                          color: Colors.black,
                          onPressed: () {
                            // Search action when icon is pressed
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              style: TextStyle(
                                color: Colors.black, // Black input text color
                              ),
                              decoration: InputDecoration(
                                hintText: 'What are you looking for',
                                hintStyle: TextStyle(
                                    color: Colors.grey), // Hint text color
                                border: InputBorder
                                    .none, // Removes default underline
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.camera_alt_outlined),
                          color: Colors.black,
                          onPressed: () {
                            // Action for camera icon press
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            ////////
            // Center(
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(24),
            //       color: Colors.white,
            //       boxShadow: [
            //         BoxShadow(
            //           color:
            //               Colors.black.withOpacity(0.1), // Light black shadow
            //           spreadRadius: 2, // How wide the shadow spreads
            //           blurRadius: 5, // How blurry the shadow is
            //           offset: Offset(
            //               0, 4), // The direction and amount of the shadow
            //         ),
            //       ],
            //     ),
            //     width: ScreenSize.width / 1.2,
            //     height: ScreenSize.height / 16,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         IconButton(
            //           icon: Icon(Icons.search),
            //           color: Colors.black,
            //           onPressed: () {
            //             // Search action when icon is pressed
            //             // You can add logic to retrieve input from the TextField here
            //           },
            //         ),
            //         Expanded(
            //           child: Padding(
            //             padding: const EdgeInsets.all(16.0),
            //             child: TextField(
            //               style: TextStyle(
            //                 color: MyGlobal
            //                     .textColor, // Makes the input text color black
            //               ),
            //               onSubmitted:
            //                   null, // Executes search when user submits input
            //               decoration: InputDecoration(
            //                 labelStyle: TextStyle(color: MyGlobal.textColor),
            //
            //                 hintText: 'What are you looking for ',
            //                 hintStyle: TextStyle(color: MyGlobal.textGrey),
            //                 border:
            //                     InputBorder.none, // Removes default underline
            //               ),
            //             ),
            //           ),
            //         ),
            //         IconButton(
            //           icon: Icon(Icons.camera_alt_outlined),
            //           color: Colors.black,
            //           onPressed: () {
            //             // Search action when icon is pressed
            //             // You can add logic to retrieve input from the TextField here
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black54,
                    size: 16, // Set icon color to white
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
